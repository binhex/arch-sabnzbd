FROM binhex/arch-base
MAINTAINER binhex

# install application
#####################

# update package databases from the server
RUN pacman -Sy --noconfirm

# install any pre-reqs for application
RUN pacman -S python2-pyopenssl --noconfirm

# run packer to install application
RUN packer -S sabnzbd --noconfirm

# docker settings
#################

# map /config to host defined config to store logs, config etc
VOLUME /config

# map /data to host defined data which contains data to index
VOLUME /data

# expose port for http
EXPOSE 8080

# expose port for https
EXPOSE 8090

# set permissions
#################

# change owner
RUN chown -R nobody:users /opt/sabnzbd

# set permissions
RUN chmod -R 775 /opt/sabnzbd

# run application
#################

# set process to run as user "nobody" group "users"
USER nobody:users

# run script with home dir, host ip and port specified (http and https)
CMD ["/opt/sabnzbd/SABnzbd.py", "--config-file", "/config", "--server", "0.0.0.0:8080", "--https", "8090"]