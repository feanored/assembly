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

# docker build -t alpine-asm .
# docker run -it --rm -v .:/codigo alpine-asm