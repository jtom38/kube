# Jenkins

## Volumes

The container runs as user `jenkins` that has a UID of 1000.
For the user to access the volume correctly you will need to adjust permissions.
This is the command I ran against my NFS share, its a bit extra but, worked.

```shell
sudo chmod -R ugo+rw /mnt/kubefs/jenkins/data
```

## Unlocking Jenkins

In order to get the key you can run the following command.

```shell
kubectl exec jenkinsPodName cat /var/jenkins_home/secrets/initialAdminPassword
```

You can also use the logs to get the secret to unlock Jenkins.

```shell
kubectl logs jenkinsPodName
```

## Jenkins Setup

1. Install Kubernetes Plugin
2. Manage Jenkins > Manage Nodes and Clouds > Configure Clouds
3. Add a new Cloud > Kubernetes

### Kubernetes Cloud Config

```yaml
name: Kubernetes
Kubernetes URL: https://kubernetes.default:443
Credentials
  Add > Jenkins
  Kind: Kubernetes Service Account
  Add
Click 'Test Connection'
  If you get an error, check rbac.yml and sa.yml to make sure the service account is correct.

Jenkins URL: http://jenkins
  Note:
    We use the name of the service because it was configured for ClusterIP.
    This lets the Jenkins pod talk to the internal service that was established.

Jenkins Tunnel: jenkins:50000
  Note:
    This is defined in `service jenkins` and `deployment jenkins`.
    This lets the agent pods talk to Jenkins controller for build jobs.

Pod Label:
  key: app
  value: jenkins-agent

Pod Template:
  Name: jenkins-agent
  Labels: jenkins-agent
  Containers:
    Name: jnlp
      Note:
        The Kubernetes plugin wants the name to be jnlp, so dont change this unless you have too.
    Docker Image: jenkins/jnlp-agent-docker
    Working Directory: /home/jenkins/agent
    Command to run: /bin/sh -c
    Arguments to pass to the command: cat
    Allocate pseudo-TTY: true
  Volumes:
    Type: HostPath
    Host Path: /var/run/docker.sock
    Mount Path: /var/run/docker.sock
Save
```
  
