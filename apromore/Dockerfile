FROM ubuntu:18.04

RUN groupadd -r apromore && useradd --no-log-init -r -g apromore apromore

RUN apt-get -y update \
&& apt-get -y install openjdk-8-jre-headless \
&& apt-get -y clean

RUN mkdir /opt/apromore
COPY . /opt/apromore/

RUN chown -R apromore:apromore /opt/apromore \
&& chmod 777 /opt/apromore

WORKDIR /opt/apromore/
USER apromore
EXPOSE 9000
CMD [ "./virgo-tomcat-server-3.6.4.RELEASE/bin/startup.sh", "-clean" ]

