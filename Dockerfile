FROM debian:latest
LABEL maintainer="alb42 <alb42@web.de>" Description="Cross compilation and development for Amiga/AROS/MorphOS using Lazarus"
# start vncserver :1 to access lazarus
EXPOSE 5901

# Installing packages
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get -y install curl wget binutils gcc libgtk2.0-0 libgtk2.0-dev psmisc tightvncserver icewm xterm gdb libstdc++6:i386 libgcc1:i386 zlib1g:i386 libncurses5:i386; \
    apt-get clean && apt-get -y autoremove && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*;

RUN cd /tmp; \
    curl -fsSL "https://build.alb42.de/fpcdocker/fpc-laz_3.2.0-1_amd64.deb" -o /tmp/fpc-laz_amd64.deb && \
    dpkg -i fpc-laz_amd64.deb; \
    curl -fsSL "https://build.alb42.de/fpcdocker/fpc-src_3.2.0-1_amd64.deb" -o /tmp/fpc-src_amd64.deb && \
    dpkg -i fpc-src_amd64.deb; \
    curl -fsSL "https://build.alb42.de/fpcdocker/lazarus-project_2.0.12-0_amd64.deb" -o /tmp/lazarus-project_amd64.deb && \
    dpkg -i lazarus-project_amd64.deb; \
    curl -fsSL "https://build.alb42.de/fpcdocker/crossfpc-3.2.0-amiga3.tar.gz" -o /tmp/crossfpc-amiga3.tar.gz && \
    tar -zxvf crossfpc-amiga3.tar.gz -C /usr/; \
    rm -rf /tmp/*;

# install default options
ADD environmentoptions.xml /root/.lazarus/
ADD projectoptions.xml /root/.lazarus/
ADD startvnc /usr/bin/
ADD muiwsdialogs.pp /usr/share/lazarus/2.0.12/lcl/interfaces/mui/

WORKDIR /sources
