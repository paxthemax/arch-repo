#!/bin/env bash

cd x86_64 || { echo -e "arch dir not found"; exit 1; }

[ -f ".sync-marker" ] || { echo -e "repo not in syncing mode"; exit 1; }

repo-add paxthemax.db.tar.xz *.pkg.*
