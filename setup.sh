#!/usr/bin/env bash
VERSION='3.4.0'
curl https://dlcdn.apache.org/kafka/${VERSION}/kafka_2.13-${VERSION}.tgz --output kafka_2.13-${VERSION}.tgz
tar -xzf kafka_2.13-${VERSION}.tgz
rm -rf kafka_2.13-${VERSION}.tgz
pushd kafka_2.13-${VERSION}/ || exit 1
export PATH=$PATH:/opt/java/jre1.8.0_361/bin/
popd || exit 1
