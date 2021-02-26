FROM fedora:latest
LABEL maintainer "Carlos Guidugli <guidugli@protonmail.com>"

ARG PUID=1001
ARG PGID=1001

ENV HOME /home/user
RUN useradd --create-home --uid=${PUID} --home-dir $HOME user \
        && chown -R user:user $HOME


RUN dnf update -y
RUN dnf install -y gcc make pkg-config libyubikey-devel ykpers-devel iniparser-devel \
                libarchive-devel cryptsetup-devel python-markdown systemd-devel \
                keyutils-libs-devel rpmdevtools rpmlint wget curl git

RUN sudo su - user -c "cd $HOME ; rpmdev-setuptree"

ENV LANG C.UTF-8

COPY mkinitcpio-ykfde.spec $HOME/rpmbuild/SPECS/
COPY getsource.sh $HOME/
RUN chown -R user:user $HOME
RUN chmod 755 $HOME/getsource.sh
RUN sudo su - user -c "bash $HOME/getsource.sh"
RUN sudo su - user -c "rpmbuild -ba $HOME/rpmbuild/SPECS/mkinitcpio-ykfde.spec"
RUN chown -R root:root $HOME/rpmbuild

WORKDIR $HOME
USER user

ENTRYPOINT [ "/bin/bash" ]

