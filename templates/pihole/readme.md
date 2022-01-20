# Pihole

Here are my notes on getting pihole working in Kube.

If you are looking at pihole, chances are you are on a metal install.
Install MetalLB.  I have my config files plus the offical installs stored in `global/lb/`

Because pihole requires usage of port 53 and 67, you are unable to use NodePort configuration.
With MetalLB you can use the L2 config to expose a direct IP to the cluster.

The services `services-dns-tcp.yml` shows you how to configure this.

1. Update the metadata to tell metallb to share IP addresses with other services with the same label.
2. Define `loadBalanceIP: yourIPHere` lets you pick the IP it will pull
3. Define `externalTrafficPolicy: Local` [link](https://metallb.universe.tf/usage/#local-traffic-policy-1)
 


