#!/usr/bin/env bash
export GOOS=linux
export GOARCH=amd64
export CGO_ENABLED=0
go mod tidy
go build  -o  build/static-service-linux-amd64 .
echo built $(pwd)
echo "go build static-service-linux-amd64 success!!!"

export GOOS=windows
export GOARCH=amd64
export CGO_ENABLED=0
go build  -o build/static-service-windows-amd64 .
echo built $(pwd)
echo "go build static-service-windows-amd64 success!!!"
