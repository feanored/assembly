FROM alpine:latest

RUN apk update && apk add \
    nasm \
    gcc \
    make \
    vim \
    binutils \
    bash

WORKDIR /codigo
CMD [ "bash" ]


# Build & Run Container
# docker build -t feanored/alpine-asm .
# docker run --name alpine-asm -v .:/codigo feanored/alpine-asm