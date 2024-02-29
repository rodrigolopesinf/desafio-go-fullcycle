FROM golang:1-alpine as builder

WORKDIR /app
COPY *.go /app
RUN go build -ldflags "-s -w" hello.go

FROM scratch
WORKDIR /app
COPY --from=builder /app/hello /app/hello
CMD [ "/app/hello" ]