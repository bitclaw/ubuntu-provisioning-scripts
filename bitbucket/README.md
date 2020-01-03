## Bitbucket caveats

See https://confluence.atlassian.com/bbkb/recent-ipv6-changes-840796883.html

Workaround for IPv6 when connecting via VPN:

If you are still encountering errors, then you should also be able to work around the issue by adding this...

```bash
104.192.143.3 bitbucket.org
```

See also https://stackoverflow.com/questions/21671706/configure-git-to-use-ipv4-instead-of-ipv6-by-default

This is the best solution, the solution above was causing a timeout when off the VPN.

```bash
sudo add-apt-repository ppa:git-core/ppa  
sudo apt-get update  
sudo apt-get install git
```
