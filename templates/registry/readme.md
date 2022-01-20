# Registry

Moving to kube I noticed a lot more image pulls and hub.docker.com now limits the number of pulls.
I am making my own registry to become my local cache for my cluster

## Auth

This will generate a file that will contain a user and password that will be used to auth with the registry.
```bash
apt install apache2-utils
htpasswd -Bc registry.password userName
mv ./registry.password /mnt/kubefs/registry/auth
```


## Cert

If you want to make a self signed cert, here you go

```bash

```


## Sources

 https://gabrieltanner.org/blog/docker-registry



