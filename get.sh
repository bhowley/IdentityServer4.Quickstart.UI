#!/usr/bin/env bash

set -e

SOURCE="https://github.com/IdentityServer/IdentityServer4.Modules/archive/release.zip"
curl -L -o ui.zip "$SOURCE"

unzip -d ui ui.zip

[[ -d Quickstart ]] || mkdir Quickstart
[[ -d Views ]] || mkdir Views
[[ -d wwwroot ]] || mkdir wwwroot

cp -r ./ui/IdentityServer4.Modules-release/Quickstart/* Quickstart
cp -r ./ui/IdentityServer4.Modules-release/Views/* Views
cp -r ./ui/IdentityServer4.Modules-release/wwwroot/* wwwroot

rm -rf ui ui.zip
