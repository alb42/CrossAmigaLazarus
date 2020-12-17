FROM debian:latest
MAINTAINER alb42 <alb42@web.de>
# start vncserver :1 to access lazarus
EXPOSE 5901

# Installing packages
RUN dpkg --add-architecture i386
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget binutils gcc libgtk2.0-0 libgtk2.0-dev psmisc tightvncserver icewm xterm gdb libstdc++6:i386 libgcc1:i386 zlib1g:i386 libncurses5:i386
RUN wget https://build.alb42.de/fpcdocker/fpc-laz_3.2.0-1_amd64.deb && dpkg -i fpc-laz_3.2.0-1_amd64.deb && rm fpc-laz_3.2.0-1_amd64.deb
RUN wget https://build.alb42.de/fpcdocker/fpc-src_3.2.0-1_amd64.deb && dpkg -i fpc-src_3.2.0-1_amd64.deb && rm fpc-src_3.2.0-1_amd64.deb
RUN wget https://build.alb42.de/fpcdocker/lazarus-project_2.0.10-0_amd64.deb && dpkg -i lazarus-project_2.0.10-0_amd64.deb && rm lazarus-project_2.0.10-0_amd64.deb
RUN apt-get clean && apt-get autoremove -y

# Installing Amiga cross compiler
RUN wget https://build.alb42.de/fpcdocker/crossfpc-3.2.0-amiga2.tar.gz && tar -zxvf crossfpc-3.2.0-amiga2.tar.gz -C /usr/ && rm crossfpc-3.2.0-amiga2.tar.gz

# install default options
ADD environmentoptions.xml /root/.lazarus/
ADD projectoptions.xml /root/.lazarus/
ADD startvnc /usr/bin/
ADD muiwsdialogs.pp /usr/share/lazarus/2.0.10/lcl/interfaces/mui/