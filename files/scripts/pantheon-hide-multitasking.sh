#!/usr/bin/env bash

set -euo pipefail

SOURCE="/usr/share/applications/"
TARGET="/usr/etc/xdg/applications/"
FILE="gala-multitaskingview.desktop"

[[ -f "${SOURCE}${FILE}" ]] || exit 0

install -D -m 0644 "${SOURCE}${FILE}" "${TARGET}${FILE}"

if grep -q '^NoDisplay=' "${TARGET}${FILE}"; then
    sed -i 's/^NoDisplay=.*/NoDisplay=true/' "${TARGET}${FILE}"
else
    sed -i '/^\[Desktop Entry\]/a NoDisplay=true' "${TARGET}${FILE}"
fi
