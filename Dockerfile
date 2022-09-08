FROM golang:1.18-alpine
LABEL org.opencontainers.image.source https://github.com/avkosme/hugo-dev

RUN apk add --no-cache git rsync sshpass hugo ansible npm openssh-client make g++ python3 curl py3-pip nftables openssl protoc
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN git clone https://github.com/sshuttle/sshuttle.git && cd sshuttle/ && ./setup.py install
RUN git clone https://github.com/go-delve/delve && cd delve && go install github.com/go-delve/delve/cmd/dlv && go build  -o /usr/bin/dvl cmd/dlv/main.go
RUN go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.48.0
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.28.1
RUN go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2.0
RUN go install golang.org/x/vuln/cmd/govulncheck@latest
RUN apk add docker
RUN DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker} && mkdir -p $DOCKER_CONFIG/cli-plugins && curl -SL https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose && chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
RUN go install -tags 'postgres' github.com/golang-migrate/migrate/v4/cmd/migrate@latest
