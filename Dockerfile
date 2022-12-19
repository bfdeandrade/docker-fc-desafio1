FROM golang:1.13-alpine3.12 as builder 

ENV PATH="$PATH:/usr/local/go/bin"
RUN mkdir -p /usr/src/app/
COPY app/helloworld.go /usr/src/app/
RUN go build -ldflags="-s -w" /usr/src/app/helloworld.go



FROM scratch
COPY --from=builder /go/helloworld /
CMD ["/helloworld"]