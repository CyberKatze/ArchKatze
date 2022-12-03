FROM archlinux:latest
RUN pacman -Syy && pacman -S git archiso sudo base-devel make --noconfirm
RUN useradd -m -s /bin/bash -G wheel builder
RUN echo '%wheel ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER builder
WORKDIR /home/builder
RUN git clone https://github.com/cyberkatze/archkatze
WORKDIR archkatze
RUN echo -e "[custom]\nSigLevel = Optional TrustAll\nServer = file:///home/builder/archkatze/airootfs/root/pkg" >> pacman.conf
ENTRYPOINT ["./docker_script.sh"]
