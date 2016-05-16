FROM centos:7
MAINTAINER Bamacharan Kundu <bamachrn@gmail.com>
RUN curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -
RUN yum -y install nodejs git vim
RUN yum -y install sudo
RUN useradd nodeowner
RUN npm install bower grunt -g
ADD firstRun.sh /firstRun.sh
RUN chmod a+x /firstRun.sh
Add runApp.sh /runApp.sh
