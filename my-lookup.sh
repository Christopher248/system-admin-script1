#!/bin/bash

filename=$1
lastname=$2

grep -P "$lastname$" "$filename"
