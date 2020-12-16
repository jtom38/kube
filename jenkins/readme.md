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

