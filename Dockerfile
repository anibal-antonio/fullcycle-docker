FROM golang:1.20.3-alpine3.17 AS goBuilder

WORKDIR /usr/src/app

COPY ./go .

RUN go build -ldflags "-s -w" hello.go && chmod 777 /usr/src/app/hello && rm -f usr/src/app/hello.go

FROM scratch

COPY --from=goBuilder /usr/src/app .

CMD ["./hello"]
