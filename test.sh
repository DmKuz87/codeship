#!/bin/bash
TEST="$( echo "test/HELLO-1" | tr '[:upper:]' '[:lower:]')"
echo ${TEST#'test/'}