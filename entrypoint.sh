USER_ID=${LOCAL_USER_ID:-9001}
USERENV="PATH=${PATH} LD_LIBRARY_PATH=${LD_LIBRARY_PATH} PYTHONPATH=${PYTHONPATH}"
USERNAME=user

echo "Starting container with user ID : $USER_ID"

if [ ! $USER_ID -eq 0 ]; then
    getent passwd $USER_ID > /dev/null 2&>1
    result=$?
    if [ ! $result -eq 0 ]; then
        echo "Create new uid"
        useradd --shell /bin/bash -u $USER_ID -o -M -c "" -d /home/$USERNAME $USERNAME
        echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
        echo "syntax enable" > /home/$USERNAME/vimrc
        echo "set number" >> /home/$USERNAME/vimrc
        echo "set expandtab shiftwidth=4 tabstop=4" >> /home/$USERNAME/vimrc
        chown -R $USERNAME /home/$USERNAME
    fi
    
    if [ ! -e /home/$USERNAME ]; then
        mkdir -p /home/$USERNAME
    fi
    
    updatedb
    
    chmod 775 /home/$USERNAME
    export HOME=/home/$USERNAME
    
    cd $HOME
    sudo -E -u $USERNAME /usr/bin/env ${USERENV} "$1"
else
    exec "$1"
fi
