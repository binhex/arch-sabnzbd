# Application

[SABnzbd](http://sabnzbd.org/)

## Description

SABnzbd is an Open Source Binary Newsreader written in Python. SABnzbd makes
Usenet as simple and streamlined as possible by automating everything we can.
All you have to do is add an .nzb. SABnzbd takes over from there, where it will
be automatically downloaded, verified, repaired, extracted and filed away with
zero human interaction.

## Build notes

Latest stable SABnzbd release from Arch Linux AUR.

## Usage

```bash
docker run -d \
    -p 8080:8080 \
    -p 8090:8090 \
    --name=<container name> \
    -v <path for data files>:/data \
    -v <path for config files>:/config \
    -v /etc/localtime:/etc/localtime:ro \
    -e HEALTHCHECK_COMMAND=<command> \
    -e HEALTHCHECK_ACTION=<action> \
    -e UMASK=<umask for created files> \
    -e PUID=<uid for user> \
    -e PGID=<gid for user> \
    binhex/arch-sabnzbd
```

Please replace all user variables in the above command defined by <> with the
correct values.

## Access application

`http://<host ip>:8080`

## Example

```bash
docker run -d \
    -p 8080:8080 \
    -p 8090:8090 \
    --name=SABnzbd \
    -v /root/docker/data:/data \
    -v /apps/docker/sabnzbd:/config \
    -v /etc/localtime:/etc/localtime:ro \
    -e UMASK=000 \
    -e PUID=0 \
    -e PGID=0 \
    binhex/arch-sabnzbd
```

## Notes

User ID (PUID) and Group ID (PGID) can be found by issuing the following command
for the user you want to run the container as:-

```bash
id <username>
```

___
If you appreciate my work, then please consider buying me a beer  :D

[![PayPal donation](https://www.paypal.com/en_US/i/btn/btn_donate_SM.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=MM5E27UX6AUU4)

[Documentation](https://github.com/binhex/documentation) | [Support forum](http://forums.unraid.net/index.php?topic=45821.0)
