FROM ubuntu:18.04

RUN groupadd -r apromore && useradd --no-log-init -r -g apromore apromore

RUN apt-get -y update \
&& apt-get -y install git \
&& apt-get -y install python3 \
&& apt-get -y install python3-pip \
&& apt-get -y clean

WORKDIR /opt/
RUN git clone https://github.com/nirdizati/nirdizati-training-backend.git

WORKDIR /opt/nirdizati-training-backend/
RUN pip3 install -r requirements.txt

COPY retry.sh /opt/nirdizati-training-backend/apromore/

RUN chown -R apromore:apromore /opt/nirdizati-training-backend \
&& chmod -R 777 /opt/nirdizati-training-backend

ENV PYTHONPATH=/opt/nirdizati-training-backend:/opt/nirdizati-training-backend/core

WORKDIR /opt/nirdizati-training-backend/apromore
USER apromore
CMD [ "./retry.sh", "python3", "predict.py", "kafka:9092", "apromore:9000", "control", "prefixes", "predictions" ]
