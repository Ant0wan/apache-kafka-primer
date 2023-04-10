#!/usr/bin/env bash
set -o errexit
set -o xtrace
set -o pipefail

VERSION='3.4.0'
WORKDIR='/opt/kafka'
USER='kafka'
GROUP='kafka'

sudo adduser --no-create-home --disabled-password "$USER"
sudo install -d -m 0755 -o "$USER" -g "$GROUP" "$WORKDIR"

curl https://dlcdn.apache.org/kafka/${VERSION}/kafka_2.13-${VERSION}.tgz --output ${WORKDIR}/kafka_2.13-${VERSION}.tgz
tar -xzf ${WORKDIR}/kafka_2.13-${VERSION}.tgz
rm -rf ${WORKDIR}/kafka_2.13-${VERSION}.tgz

pushd ${WORKDIR}/kafka_2.13-${VERSION}/ || exit 1
export PATH=$PATH:/opt/java/jre1.8.0_361/bin/
popd || exit 1

