#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Must provide two arguments to run the script."
    echo "Usage: make-go-dir <root directory name> <identifier name>"
    exit
elif [[ -z "$2" ]]; then
    echo "Must provide two arguments to run the script."
    echo "usage: make-go-dir <root directory> <identifier name>"
    exit
fi

PROCEED_PHRASE="Yes"
echo "I am about to create a directory structure named '$1'"
echo "Do you want to continue? [Yes/No]"
read INPUT

if [[ "$INPUT" != "$PROCEED_PHRASE" ]]; then
    echo "Abort."
    exit
fi

mkdir "$1"
touch "$1"/go.mod
touch "$1"/Makefile
mkdir "$1"/bin
mkdir "$1"/cmd
mkdir "$1"/cmd/api
touch "$1"/cmd/api/main.go
mkdir "$1"/internals
mkdir "$1"/migrations
mkdir "$1"/remote

echo "// File: cmd/api/main.go" >> "$1"/cmd/api/main.go
echo "" >> "$1"/cmd/api/main.go
echo "package main" >> "$1"/cmd/api/main.go
echo "" >> "$1"/cmd/api/main.go
echo 'import "fmt"' >> "$1"/cmd/api/main.go
echo "" >> "$1"/cmd/api/main.go
echo "func main() {" >> "$1"/cmd/api/main.go
echo 'fmt.Println("Hello world!")' >> "$1"/cmd/api/main.go
echo "}" >> "$1"/cmd/api/main.go

echo "module $1.$2/mod" >> "$1"/go.mod

echo "I have created a *main.go* file for you to test the directory structure."
echo "Type *go run ./cmd/api* at the root directory of your project to test your project."
echo "Thank You"

