FROM golang:1.19.4-alpine3.17
LABEL org.opencontainers.image.source https://github.com/avkosme/hugo-dev
LABEL org.opencontainers.image.description Golang app docker image for developing

RUN apk add --no-cache git rsync sshpass hugo ansible npm openssh-client make g++ python3 curl py3-pip nftables openssl protoc tzdata vim
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN git clone https://github.com/sshuttle/sshuttle.git && cd sshuttle/ && ./setup.py install
RUN wget -O- -nv https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s v1.49.0
RUN git clone https://github.com/go-delve/delve && cd delve && go install github.com/go-delve/delve/cmd/dlv && go build  -o /usr/bin/dvl cmd/dlv/main.go

RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.28.1
RUN go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2.0
RUN go install golang.org/x/vuln/cmd/govulncheck@latest
RUN apk add docker
RUN DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker} && mkdir -p $DOCKER_CONFIG/cli-plugins && curl -SL https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose && chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
RUN go install -tags 'postgres,mysql' github.com/golang-migrate/migrate/v4/cmd/migrate@latest
RUN go install github.com/fullstorydev/grpcurl/cmd/grpcurl@latest
RUN go install golang.org/x/tools/gopls@latest
RUN git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
COPY conf/dlv/config.yml  /root/.config/dlv/config.yml
RUN go install honnef.co/go/tools/cmd/staticcheck@latest
