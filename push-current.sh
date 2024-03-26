DOCKERUSER=$(docker info | sed '/Username:/!d;s/.* //')
IMAGE=$(docker images | awk '{print $3}' | awk 'NR==2')

echo "Image ID is" $IMAGE

TAG=$(basename $PWD | sed 's/^.*://')

echo "Tag is" $DOCKERUSER/coq:$TAG

echo "Run the following commands:"

echo

echo docker tag $IMAGE $DOCKERUSER/coq:$TAG

echo docker push $DOCKERUSER/coq:$TAG