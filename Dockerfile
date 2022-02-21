FROM ubuntu:latest

# RUN apt update
#
# RUN apt install python3 -y
#
# RUN set -xe \
#     && apt-get update \
#     && apt-get install python3-pip -y
# RUN pip install --upgrade pip
#
# RUN pip install scapy
RUN apt-get update; apt-get install curl -y

WORKDIR /usr/app/src

COPY getattack.sh ./
#COPY evil.py ./

RUN chmod +x ./getattack.sh
CMD ["./getattack.sh"]

#--ip 192.168.0.3 --gate 3001 --n_pkt 1000
#CMD ["python3","./evil.py", "--ip","192.168.0.3","--gate","3001","--n_pkt", "1000"]