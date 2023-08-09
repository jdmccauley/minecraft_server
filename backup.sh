#!/usr/bin/env bash

backup_dir="/root/OneDrive/Documents/Gaming/minecraft/server_backups"
SERVER_DIR="JAVA_SERVER"

tmpdir=$(mktemp -d)

docker cp -a "minecraft_server-server-1:/mc/JAVA_SERVER" "${tmpdir}/JAVA_SERVER"
docker cp -a "${tmpdir}/${SERVER_DIR}" "minecraft_server-onedrive-1:${backup_dir}/${SERVER_DIR}"

docker exec -it minecraft_server-onedrive-1 /root/sync.sh "${SERVER_DIR}"

rm -r "${tmpdir}"

