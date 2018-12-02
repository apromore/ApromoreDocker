FROM ubuntu:18.04

RUN groupadd -r apromore && useradd --no-log-init -r -g apromore apromore

RUN apt-get -y update \
&& apt-get -y install openjdk-8-jre-headless \
&& apt-get -y install git \
&& apt-get -y install python3 \
# && apt-get -y install sudo \
# && apt-get -y install telnet \
# && apt-get -y install iputils-ping \
&& apt-get -y clean

WORKDIR /opt/
RUN git clone https://github.com/nirdizati/nirdizati-training-backend.git \
&& chown -R apromore:apromore /opt/nirdizati-training-backend \
&& chmod -R 777 /opt/nirdizati-training-backend

RUN mkdir /opt/apromore
COPY . /opt/apromore/

RUN chown -R apromore:apromore /opt/apromore \
&& chmod -R 777 /opt/apromore

WORKDIR /opt/apromore/
USER apromore
EXPOSE 9000
CMD [ "./virgo-tomcat-server-3.6.4.RELEASE/bin/startup.sh", "-clean" ]
