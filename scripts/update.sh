#!/bin/bash
# BMAD Solo update — git pull + reinstall
set -e
cd "$(dirname "$0")/.."
git pull --ff-only
bash scripts/install-global.sh
