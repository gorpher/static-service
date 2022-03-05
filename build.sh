#!/usr/bin/env bash
export GOOS=linux
export CGO_ENABLED=0
go mod tidy
go build  -o static-service-linux-amd64 .
echo built $(pwd)
echo "go build success!!!"

docker build -t gorpher/static-service:latest .
rm -f static-service-linux-amd64
