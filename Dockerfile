FROM binhex/arch-base:2015010200
MAINTAINER binhex

# additional files
##################

# add supervisor conf file for app
ADD sabnzbd.conf /etc/supervisor/conf.d/sabnzbd.conf

# install app
#############

# install base devel, install app using packer, set perms, cleanup
RUN pacman -Sy --noconfirm && \
	pacman -S --needed base-devel python2-pyopenssl python2-feedparser --noconfirm && \	
	useradd -m -g wheel -s /bin/bash makepkg_user && \
	echo -e "makepkg_password\nmakepkg_password" | passwd makepkg_user && \
	echo "%wheel      ALL=(ALL) ALL" >> /etc/sudoers && \
	echo "Defaults:makepkg_user      !authenticate" >> /etc/sudoers && \
	curl -o /home/makepkg_user/packer.tar.gz https://aur.archlinux.org/packages/pa/packer/packer.tar.gz && \
	cd /home/makepkg_user && \
	tar -xvf packer.tar.gz && \
	su -c "cd /home/makepkg_user/packer && makepkg -s --noconfirm --needed" - makepkg_user && \
	pacman -U /home/makepkg_user/packer/packer*.tar.xz --noconfirm && \
	su -c "packer -S sabnzbd --noconfirm" - makepkg_user && \
	chown -R nobody:users /opt/sabnzbd && \
	chmod -R 775 /opt/sabnzbd && \	
	pacman -Ru base-devel --noconfirm && \
	yes|pacman -Scc && \
	rm -rf /archlinux/usr/share/locale && \
	rm -rf /archlinux/usr/share/man && \
	rm -rf /root/* && \
	rm -rf /tmp/*

# docker settings
#################

# map /config to host defined config path (used to store configuration from app)
VOLUME /config

# map /data to host defined data path (used to store data from app)
VOLUME /data

# expose port for http
EXPOSE 8080

# expose port for https
EXPOSE 8090

# run supervisor
################

# run supervisor
CMD ["supervisord", "-c", "/etc/supervisor.conf", "-n"]