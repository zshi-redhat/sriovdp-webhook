FROM golang:1.11
ENV PKG_NAME=github.com/zshi-redhat/sriovdp-webhook
ENV PKG_PATH=$GOPATH/src/$PKG_NAME
WORKDIR $PKG_PATH
COPY . $PKG_PATH/
WORKDIR $PKG_PATH/webhook/server
RUN go install
WORKDIR $PKG_PATH/webhook/deployment
RUN go install

RUN mkdir /webhook
RUN cp /go/bin/* /webhook/
WORKDIR /webhook
CMD ["./server"]
