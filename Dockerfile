FROM golang:1.9.1 AS goBuilder

WORKDIR /usr/src/app

COPY ./go .

RUN go build -ldflags "-s -w" hello.go && chmod 777 /usr/src/app/hello && rm -f usr/src/app/hello.go

FROM alpine:3.13

WORKDIR /usr/src/app

COPY --from=goBuilder /usr/src/app .

CMD ["./hello"]
