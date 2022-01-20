# Kubernetes Pod Priority

Within Kubernetes you are able to define how critical a pod is by defining a Pod Priority.

With this, you can define what deployments/pods are told to take higher priority then others.  If you have an aggressive pod like Plex, giving it a high priority will allow it to keep running even if its the pod that is killing IO and would normally be evicted.

Take a look at media/plex/deployments.yml to see how to define the high-priority pod.
