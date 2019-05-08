# FROM ubuntu:18.04

FROM openjdk:8

# FROM ibmjava:8

RUN groupadd -r apromore && useradd --no-log-init -r -g apromore apromore

RUN apt-get -y update \
# && apt-get -y install openjdk-8-jre-headless \
# && apt-get -y install default-jdk \
# && apt-get install -y openjdk-8-jre \
&& sed -i -e '/^assistive_technologies=/s/^/#/' /etc/java-8-openjdk/accessibility.properties \
&& apt-get -y install git \
&& apt-get -y install python3 \
&& apt-get -y install python3-pip \
&& apt-get -y install xvfb \
&& apt-get -y install python3-tk \
# && apt-get -y install xserver-xorg-core \
# && apt-get -y install sudo \
# && apt-get -y install telnet \
# && apt-get -y install iputils-ping \
&& apt-get -y clean

WORKDIR /opt/

# # Add LPSolve sources
# ADD http://downloads.sourceforge.net/project/lpsolve/lpsolve/5.5.2.0/lp_solve_5.5.2.0_source.tar.gz /opt/
# RUN tar xzvf lp_solve_5.5.2.0_source.tar.gz && \
# 	rm lp_solve_5.5.2.0_source.tar.gz
# # Compile LPSolve
# RUN chmod +x /opt/lp_solve_5.5/lpsolve55/ccc
# RUN cd /opt/lp_solve_5.5/lpsolve55 && \
# 	./ccc
# # Set environmental variables for LPSolve
# ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:$RDBASE/lib:/opt/lp_solve_5.5/lpsolve55/bin/ux64

# APROMORE SETUP
RUN mkdir /opt/apromore
COPY . /opt/apromore/

RUN chown -R apromore:apromore /opt/apromore \
&& chmod -R 777 /opt/apromore

# PREDICTIVE MONITORING SETUP
RUN git clone https://github.com/nirdizati/nirdizati-training-backend.git

WORKDIR /opt/nirdizati-training-backend/
RUN pip3 install -r requirements.txt

RUN chown -R apromore:apromore /opt/nirdizati-training-backend \
&& chmod -R 777 /opt/nirdizati-training-backend

ENV PYTHONPATH=/opt/nirdizati-training-backend/
# ENV DISPLAY=localhost:0.0

# PROCESS DISCOVERY ADVANCED SETUP
WORKDIR /opt/
RUN git clone https://github.com/AdaptiveBProcess/SiMo-Discoverer.git \
&& cd SiMo-Discoverer \
&& git checkout 0527d1f25ae5079520deca6a61bcaf022ed8ecfd \
&& cp /opt/apromore/simo-files/requirements.txt /opt/SiMo-Discoverer \
&& mkdir /opt/SiMo-Discoverer/simo/ \
&& cp /opt/apromore/simo-files/apromore-simo.py /opt/SiMo-Discoverer/simo/
WORKDIR /opt/SiMo-Discoverer/
RUN pip3 install -r requirements.txt

RUN chown -R apromore:apromore /opt/SiMo-Discoverer \
&& chmod -R 777 /opt/SiMo-Discoverer/

ENV PYTHONPATH=/opt/SiMo-Discoverer/

# setup LPSolve library
RUN cp /opt/apromore/virgo-tomcat-server-3.6.4.RELEASE/liblpsolve55/* /usr/local/lib \
    && ldconfig \
    && chmod 755 /usr/local/lib/liblpsolve55j.so
ENV LD_LIBRARY_PATH /usr/local/lib

# RUN Xvfb :1 & \
#     && export DISPLAY=localhost:1.0

WORKDIR /opt/apromore/
USER apromore
EXPOSE 9000
CMD [ "./virgo-tomcat-server-3.6.4.RELEASE/bin/startup.sh", "-clean" ]
