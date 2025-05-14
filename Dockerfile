FROM golang:1.24 AS build
WORKDIR /build
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 go build

FROM debian:12-slim
COPY --from=build /build/mpo-example-app /usr/local/bin/mpo-example-app
CMD ["/usr/local/bin/mpo-example-app"]
EXPOSE 8000
EXPOSE 8001
