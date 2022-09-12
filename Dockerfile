FROM ubuntu:18.04
LABEL maintainer="Christian Petersen <christianlundpetersen@gmail.com>"
#transrightarehumanrights =D

RUN apt-get update \
  && apt-get install -y libpcap0.8-dev libuv1-dev curl

RUN mkdir /app
RUN mkdir /config

COPY ./app /app
COPY ./config /config

WORKDIR /app

#Should grab latest
RUN curl -L -o lan-play-linux https://github.com/spacemeowx2/switch-lan-play/releases/latest/download/lan-play-linux
#Grabs the gui - will need manual updating
RUN curl -L -o lan-play-gui https://github.com/takashi1kun/lan-play-GUI/releases/download/v1.3.0/lan-play-GUI-linux-1.3.0.AppImage

#Old Commands + gui version
RUN chmod +x lan-play-linux
RUN chmod +x lan-play-gui
RUN chmod +x start.sh

#Commands recommended in the gui README.MD
RUN setcap 'CAP_NET_RAW+eip CAP_NET_ADMIN+eip' lan-play-linux
RUN chmod 777 lan-play-linux

#This will now open lan-play-gui
CMD ["./start.sh"]
