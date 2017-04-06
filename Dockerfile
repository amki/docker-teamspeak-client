FROM debian:latest

RUN apt-get update && apt-get install -y \
    bzip2 \
    consolekit \
    curl \
    dbus \
    libasound2 \
    libglib2.0-0 \
    libnss3 \
    libqt5core5a libqt5gui5 libqt5network5 libqt5sql5 \
    libxcursor1 \
    pulseaudio \
    x11vnc \
    xvfb

COPY start_teamspeak.sh /
COPY start_xvfb.sh /
COPY entrypoint.sh /

RUN mkdir teamspeak/ && cd /teamspeak && curl http://dl.4players.de/ts/releases/3.1.3/TeamSpeak3-Client-linux_amd64-3.1.3.run -o teamspeak.run && chmod u+x teamspeak.run && (sleep 3 && echo "q" && sleep 3 && echo "y") | ./teamspeak.run

ENTRYPOINT ["/entrypoint.sh"]
