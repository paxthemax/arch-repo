#!/bin/env bash

cd x86_64 || { echo -e "no arch dir"; exit 1; }

[ -f ".sync-marker" ] && { echo -e "repo in syncing mode"; exit 1; }

mv paxthemax.db paxthemax.db.tar.xz
ln -sf paxthemax.db.tar.xz paxthemax.db

mv paxthemax.files paxthemax.files.tar.xz
ln -sf paxthemax.files.tar.xz paxthemax.files

touch .sync-marker