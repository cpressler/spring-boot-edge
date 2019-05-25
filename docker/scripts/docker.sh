#!/bin/bash

ARTIFACT=spring-boot-edge-server

# Set directory. Need to get to root project  directory to execute

# Set image version based on parameter passed in
tagversion=$1
push=$2
echo "Version is..."$tagversion
case "$tagversion" in
    *SNAPSHOT)
        echo "Inside case..."
        tagversion="latest";
        echo "Version is..."$tagversion
    ;;
esac

#echo "Building the docker image now"
# Build Image
export BUILDVERSION=$1
#env
#echo $BUILDVERSION

if [ "$2" == "i" ]; then
  echo "Building the discovery docker image now"
  # Push Image to repository
  docker build -f docker/server/${ARTIFACT}.Dockerfile . --tag softvisionlvcp/${ARTIFACT}:$tagversion --build-arg buildversion=`echo $BUILDVERSION`
else
  echo "Docker image build not enable for discovery"
fi


echo "testing if login is active"
docker login

if [ "$2" == "p" ]; then
  echo "Pushing the docker image now"
  # Push Image to repository
  docker push softvisionlvcp/${ARTIFACT}:$tagversion
else
  echo "Docker push not enabled"
fi



# to run interactive
# docker run -p 8000:80 softvisionlvcp/spring-react-qatest-ui

#to run detached
# docker run -d -p 8000:80 softvisionlvcp/spring-react-qatest-ui --name docker_frontend

# to exec into a detached container
#docker exec -it docker_frontend /bin/sh