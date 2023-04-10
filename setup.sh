#!/usr/bin/env bash
VERSION='3.4.0'
curl https://dlcdn.apache.org/kafka/${VERSION}/kafka_2.13-${VERSION}.tgz --output kafka_2.13-${VERSION}.tgz
tar -xzf kafka_2.13-${VERSION}.tgz
