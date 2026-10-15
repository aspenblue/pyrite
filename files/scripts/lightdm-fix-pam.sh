#!/usr/bin/env bash
set -euo pipefail

PAM_FILE="/etc/pam.d/lightdm"

if [[ ! -f "$PAM_FILE" ]]; then
    PAM_FILE="/usr/etc/pam.d/lightdm"
fi

if [[ ! -f "$PAM_FILE" ]]; then
    echo "ERROR: LightDM PAM configuration not found." >&2
    exit 1
fi

for action in close open; do
    if ! grep -Eq "^[[:space:]]*session[[:space:]]+required[[:space:]]+pam_selinux\.so[[:space:]]+${action}([[:space:]]|$)" "$PAM_FILE"; then
        echo "ERROR: pam_selinux.so ${action} line not found in $PAM_FILE" >&2
        exit 1
    fi

    sed -E -i "/^[[:space:]]*session[[:space:]]+required[[:space:]]+pam_selinux\\.so[[:space:]]+${action}([[:space:]]|$)/ { /(^|[[:space:]])nottys([[:space:]]|$)/! s/[[:space:]]*$/ nottys/ }" "$PAM_FILE"
done

echo "LightDM PAM configuration fixed:"
grep -n 'pam_selinux.so' "$PAM_FILE"
