FROM mysql:5.7

ARG USER="mysql"
ARG UID="1000"
ARG GROUP="mysql"
ARG GID="1000"
ARG WORKSPACE="/var/lib/mysql/"

# system update
RUN apt-get -y update

# locale
RUN apt-get -y install locales && localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

# timezone (Asia/Tokyo)
ENV TZ JST-9

# etc
ENV TERM xterm

# my.conf
COPY my.cnf /etc/mysql/conf.d/custom.cnf 

# user setting
WORKDIR $WORKSPACE
RUN usermod -u $UID $USER && groupmod -g $GID $GROUP

