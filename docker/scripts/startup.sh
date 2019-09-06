#!/bin/sh

echo "fetching code from $repository"
git clone $repository /temp --progress #need to write to stdout to hold container open on build


echo "Building $dockerfilepath with tag of $tag"
docker build -f $dockerfilepath $dockerpath -t $tag