#!/usr/bin/env bash

backup="$(date +%Y%m%d)_java_server_backup"
backup_dir="/root/OneDrive/Documents/Gaming/minecraft/server_backups"

tmpdir=$(mktemp -d)

docker cp -a "minecraft_server-server-1:/mc/JAVA_SERVER" "${tmpdir}/${backup}"
docker cp -a "${tmpdir}/${backup}" "minecraft_server-onedrive-1:${backup_dir}/${backup}"

docker exec -it minecraft_server-onedrive-1 /root/sync.sh "${backup}"

rm -r "${tmpdir}"

