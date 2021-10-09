# VARIABLES
IMAGE_NAME=jupyter-docker_jupyter-hub-weapon
IMAGE_TAG=latest
JUPYTER_DIR=$(pwd)

# SCRIPT
printf "\n\nBUILD"
printf "\n---------------------------------------------\n"
docker build -t $IMAGE_NAME:$IMAGE_TAG -f Dockerfile-weapon .

printf "\n\nRUN"
printf "\n---------------------------------------------\n"
docker run -it \
    -p 8000:8000 \
    -v $JUPYTER_DIR/volumes/config/jupyterhub_config_custom.py:/etc/jupyterhub/jupyterhub_config.py \
    -v $JUPYTER_DIR/volumes/jupyterhub:/etc/jupyterhub/home \
    -v "$(pwd)":/etc/jupyterhub/home/iaweapon \
    $IMAGE_NAME:$IMAGE_TAG

