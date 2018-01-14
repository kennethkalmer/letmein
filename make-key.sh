#!/bin/bash

# So this is how I generate my keys

PHRASE="${1}"
PASSKEY_NAME=$(uuidgen)

if [ -z "${PHRASE}" ]; then
    echo "Erm, aren't we forgetting something?"
    echo
    exit 1
fi

openssl passwd -1 "${PHRASE}" > "${PASSKEY_NAME}"

echo "Done! Passphrase saved to ${PASSKEY_NAME}"
