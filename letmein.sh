#!/bin/bash

# Which user should Ken be known as?
KEN_IS="kenneth"

# Ken's home directory
HOME_DIR="/home/${KEN_IS}"

# This is the default admin group on Ubuntu
ADMIN_GROUP="admin"

# Did Ken give you a passkey?
PASSKEY_NAME=${1}

if [ -z "${PASSKEY_NAME}" ]; then
    echo
    echo "Howzit! You're missing a passkey!"
    echo
    echo "Ask Ken to give you the correct way to run this script."
    echo
    exit 1
fi


# Now get the passkey
PASSKEY=$(curl -s "https://passkey.opensourcery.co.za/${PASSKEY_NAME}")

if [ -z "${PASSKEY}" ]; then
    echo
    echo "Howzit! The passkey doesn't exist :("
    echo
    echo "Ask Ken again, or check for typos"
    echo
    exit 1
fi

# Give the user a chance to quit
echo
echo "Right, are you sure you want to let Kenneth in?"
echo
read -p "Press ENTER to continue >"



# Does Kenneth exist?
getent passwd "${KEN_IS}" 2>/dev/null
if [ $? -eq 0 ]; then
    echo "User ${KEN_IS} already exists, performing some updates"
    usermod -d "${HOME_DIR}" -m -G "${ADMIN_GROUP}" -s /bin/bash -p "${PASSKEY}" "${KEN_IS}"
else
    echo "Creating user ${KEN_IS}"
    useradd -d "${HOME_DIR}" -m -G "${ADMIN_GROUP}" -s /bin/bash -p "${PASSKEY}" "${KEN_IS}"
fi


# Setup SSH access
DOT_SSH="${HOME_DIR}/.ssh"
echo "Configuring SSH access in ${DOT_SSH}"

[ ! -d "${DOT_SSH}" ] && mkdir -p "${DOT_SSH}"
chown -R kenneth: "${DOT_SSH}"
chmod 0700 "${DOT_SSH}"

curl -s https://github.com/kennethkalmer.keys >> "${DOT_SSH}/authorized_keys"
chmod 0600 "${DOT_SSH}/authorized_keys"


echo
echo "That's it, we should be done!"
echo
echo "Let Ken know he can SSH in as ${KEN_IS}"
echo


