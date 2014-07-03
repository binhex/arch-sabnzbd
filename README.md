sabnzbd
=======

Latest stable SABnzbd+ release from Arch Linux AUR using Packer to compile.

This is a Dockerfile for SABnzbd+ - http://sabnzbd.org/

**Pull image**

```
docker pull binhex/arch-sabnzbd
```

**Run container**

```
docker run -d -p 8080:8080 --name=<container name> -v <path for data files>:/data -v <path for config files>:/config -v /etc/localtime:/etc/localtime:ro binhex/arch-sabnzbd
```

Please replace all user variables in the above command defined by <> with the correct values.

**Access application**

```
http://<host ip>:8080
```
