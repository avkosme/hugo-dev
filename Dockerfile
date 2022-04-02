FROM golang:1.18-alpine

RUN apk add --no-cache git rsync sshpass hugo ansible npm openssh-client make g++ python3 curl py3-pip nftables
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN git clone https://github.com/sshuttle/sshuttle.git && cd sshuttle/ && ./setup.py install
RUN git clone https://github.com/go-delve/delve && cd delve && go install github.com/go-delve/delve/cmd/dlv && go build  -o /usr/bin/dvl cmd/dlv/main.go
