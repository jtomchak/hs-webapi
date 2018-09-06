# Dockerfile.builder
# docker build -t hs-webapi/api-builder --file Dockerfile.builder .
FROM haskell:8.4.3

# Install dependecies needed to compile Haskell libraries
RUN apt-get update && apt-get install --yes \
    xz-utils \
    make

RUN stack --resolver lts-12.6 install base \
    scotty \
    protolude \
    text \
    aeson \
    yaml \
    unordered-containers \
    case-insensitive \
    regex-compat
