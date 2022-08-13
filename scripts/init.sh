#!/bin/env bash

cd x86_64 || { echo -e "no arch dir"; exit 1; }

[ -f "paxthemax.db" ] || [ -f "paxthemax.db.tar.xz" ] || [ -f ".sync-marker" ] && { echo -e "repo already initialized"; exit 1; }

repo-add paxthemax.db.tar.xz
touch .sync-marker