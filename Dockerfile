FROM golang:1.17.7-alpine

RUN apk add --no-cache hugo ansible npm openssh-client make
