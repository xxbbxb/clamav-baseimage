#!/bin/bash
mkdir -p /usr/share/clamav
cd /usr/share/clamav
curl -O --remote-header-name -fSL http://database.clamav.net/main.cvd
curl -O --remote-header-name -fSL http://database.clamav.net/daily.cvd
curl -O --remote-header-name -fSL http://database.clamav.net/bytecode.cvd
chown clamav.clamav /usr/share/clamav
