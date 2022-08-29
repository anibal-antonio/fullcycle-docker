FROM golang:latest AS goBuilder

WORKDIR /usr/src/app

COPY ./go .

RUN go build hello.go && \
    rm hello.go

FROM golang:alpine3.16
WORKDIR /user/src/app
COPY --from=goBuilder /user/src/app /.
ENTRYPOINT ["./hello"]
