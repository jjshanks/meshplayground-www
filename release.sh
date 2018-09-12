# adopted from https://medium.com/travis-on-docker/how-to-version-your-docker-images-1d5c577ebf54
set -ex

REGISTRY=docker.meshplayground.com
# image name
IMAGE=www.meshplayground.com

docker run --rm -v "$PWD":/app treeder/bump patch
version=`cat VERSION`
echo "version: $version"

./build.sh

git add VERSION
git commit -m "version $version"
git tag -a "$version" -m "version $version"
git push
git push --tags
docker tag $REGISTRY/$IMAGE:latest $REGISTRY/$IMAGE:$version
# push it
docker push $REGISTRY/$IMAGE:latest
docker push $REGISTRY/$IMAGE:$version
