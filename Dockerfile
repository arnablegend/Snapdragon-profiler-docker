#base image
FROM ubuntu:20.04

#Update base image
RUN echo "deb http://archive.ubuntu.com/ubuntu/ trusty main universe" | tee -a /etc/apt/sources.list
RUN echo "deb http://archive.ubuntu.com/ubuntu/ trusty-updates main universe" | tee -a /etc/apt/sources.list
RUN apt-get update --fix-missing

RUN apt-get --yes --allow-unauthenticated install apt-utils

#environment helpers
RUN apt-get --yes --allow-unauthenticated install sudo build-essential bash-completion aptitude zip mlocate

#Dev helpers - Comment if you are not developing in this docker
RUN apt-get --yes --allow-unauthenticated install wget pkg-config vim screen byobu

#Install Mono for snapdragon profiler
RUN apt-get --yes --allow-unauthenticated install openssh-client sshpass
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
RUN apt update 
RUN apt-get --yes --allow-unauthenticated install mono-devel

#Install other deps
RUN apt-get --yes --allow-unauthenticated install gtk-sharp2 libc++1

COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh
COPY ./setup-profiler.sh /usr/local/bin/setup-profiler.sh

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]
CMD ["/bin/bash"]
