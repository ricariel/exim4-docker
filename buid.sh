#!/bin/bash
docker buildx build -t ricariel/exim --push --platform=linux/amd64,linux/arm64 .
