FROM debian:10-slim

RUN apt-get update && \
  apt-get install -y \
    build-essential \
    nasm \
    wget

COPY ./build-deps.sh /

ENV BUILD_DIR /build

RUN /build-deps.sh $BUILD_DIR
