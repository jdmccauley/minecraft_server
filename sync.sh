#!/usr/bin/env bash

pushd /root/OneDrive/Documents/Gaming/minecraft/server_backups > /dev/null

backup="$(date +%Y%m%d%H%M)_java_server_backup.zip"

zip -r "${backup}" "${1}"
rm -r "${1}"

onedrive --synchronize --upload-only

rm *

popd > /dev/null
