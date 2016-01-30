**Application**

[SABnzbd](http://sabnzbd.org/)

**Application description**

SABnzbd is an Open Source Binary Newsreader written in Python. SABnzbd makes Usenet as simple and streamlined as possible by automating everything we can. All you have to do is add an .nzb. SABnzbd takes over from there, where it will be automatically downloaded, verified, repaired, extracted and filed away with zero human interaction.

**Build notes**

Latest stable SABnzbd release from Arch Linux AUR using Packer to compile.

**Usage**
```
docker run -d \
	-p 8080:8080 \
	-p 8090:8090 \
	--name=<container name> \
	-v <path for media files>:/media \
	-v <path for config files>:/config \
	-v /etc/localtime:/etc/localtime:ro \
	binhex/arch-sabnzbd
```

Please replace all user variables in the above command defined by <> with the correct values.

**Access application**

`http://<host ip>:8080`

**Example**
```
docker run -d \
	-p 8080:8080 \
	-p 8090:8090 \
	--name=SABnzbd \
	-v /media/movies:/media \
	-v /apps/docker/sabnzbd:/config \
	-v /etc/localtime:/etc/localtime:ro \
	binhex/arch-sabnzbd
```

**Notes**

N/A

[Support forum](http://lime-technology.com/forum/index.php?topic=45821.0)