SABnzbd
=======

SABnzbd - http://sabnzbd.org/

Latest stable SABnzbd release from Arch Linux AUR using Packer to compile.

**Pull image**

```
docker pull binhex/arch-sabnzbd
```

**Run container**

```
docker run -d -p 8080:8080 -p 8090:8090 --name=<container name> -v <path for media files>:/media -v <path for config files>:/config -v /etc/localtime:/etc/localtime:ro binhex/arch-sabnzbd
```

Please replace all user variables in the above command defined by <> with the correct values.

**Access application**

```
http://<host ip>:8080
```

or for SSL

```
https://<host ip>:8090
```
