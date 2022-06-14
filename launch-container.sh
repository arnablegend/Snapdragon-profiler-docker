image_name=$1
container_name=${image_name//[:\/]/-}-$(id -u -n $USER)
WORKSPACE=$2

docker ps -a | grep ${container_name} > /dev/null 2>&1
result=$?

if [ ! $result -eq 0 ]; then
    echo "Creating container"
    if [ ! -d $WORKSPACE ]; then
        echo "Create local directory : $WORKSPACE"
        mkdir -p $WORKSPACE
    fi
    
    docker run -it
               -e LOCAL_USER_ID=`id -u $USER` \
               --security-opt seccomp-unconfined \
               --cap-add=ALL --privileged \
               -e DISPLAY=$DISPLAY \
               -v /dev:/dev \
               -v /lib/modules:/lib/modules \
               -v $WORKSPACE:/home/user/workpsace \
               --network=host \
               --name=${container_name} \
               $image_name /bin/bash
else
    docker start ${container_name} && docker attach ${container_name}
fi
