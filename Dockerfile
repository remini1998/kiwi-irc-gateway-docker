FROM golang:rc

RUN apt-get install -y git

RUN mkdir -p /go/src/github.com/kiwiirc/
WORKDIR /go/src/github.com/kiwiirc/

RUN git clone https://github.com/kiwiirc/webircgateway.git
WORKDIR /go/src/github.com/kiwiirc/webircgateway
RUN go get github.com/kiwiirc/webircgateway
RUN dep ensure
RUN go build -o webircgateway main.go

COPY config.conf .

CMD ["./webircgateway", "--config=config.conf"]
