FROM golang:1.17.7-alpine

RUN apk add --no-cache git rsync sshpass hugo ansible npm openssh-client make g++ python3
