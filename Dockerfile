ARG SERVER_ZIP="JAVA_SERVER.zip"
ARG TARGET="server"

FROM debian:bookworm-slim as server
RUN apt-get update && \
    apt-get install -y vim openjdk-17-jre zip
WORKDIR /mc/JAVA_SERVER
COPY ${SERVER_ZIP} /mc/
RUN unzip /mc/JAVA_SERVER.zip -d /mc
RUN groupadd -g 1000 server && \
    useradd -g 1000 -u 1000 server && \
    chown -R server /mc && \
    chmod -R 775 /mc
EXPOSE 25565
USER server
ENTRYPOINT ["java", "-Xmx6G", "-Xms1G", "-jar", "/mc/JAVA_SERVER/server.jar", "nogui"]

FROM driveone/onedrive:debian as onedrive
RUN apt-get update && apt-get install zip unzip -y
WORKDIR /root/OneDrive/Documents/Gaming/minecraft/server_backups
COPY sync.sh /root/
RUN groupadd -g 1000 onedrive && \
    useradd -g 1000 -u 1000 onedrive && \
    chown -R onedrive /root/OneDrive && \
    chmod -R 775 /root/OneDrive
ENTRYPOINT ["/usr/bin/env", "bash"]

FROM ${TARGET} as main
LABEL maintainer="Joshua McCauley <z898c96su@mozmail.com>"