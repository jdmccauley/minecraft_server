#!/usr/bin/env bash

pushd /root/OneDrive/Documents/Gaming/minecraft/server_backups > /dev/null

zip -r "${1}.zip" "${1}"
rm -r "${1}"

onedrive --synchronize --upload-only

rm *

popd > /dev/null