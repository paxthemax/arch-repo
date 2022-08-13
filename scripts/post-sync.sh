#!/bin/env bash

cd x86_64 || { echo -e "no arch dir"; exit 1; }

[ -f ".sync-marker" ] || { echo -e "repo not in syncing mode"; exit 1; }

rm paxthemax.db
mv paxthemax.db.tar.xz paxthemax.db

rm paxthemax.files
mv paxthemax.files.tar.xz paxthemax.files

rm .sync-marker