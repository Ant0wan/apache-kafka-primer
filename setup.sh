#!/usr/bin/env bash
set -o errexit
set -o xtrace
set -o pipefail

VERSION='3.4.0'
WORKDIR='/opt/kafka'
USER='kafka'
GROUP='kafka'

sudo adduser --gecos --no-create-home --disabled-password "$USER"
sudo install -d -m 0755 -o "$USER" -g "$GROUP" "$WORKDIR"

curl https://dlcdn.apache.org/kafka/${VERSION}/kafka_2.13-${VERSION}.tgz --output kafka_2.13-${VERSION}.tgz
tar -xzf kafka_2.13-${VERSION}.tgz
sudo mv kafka_2.13-${VERSION}/* ${WORKDIR}
sudo chown -R $USER:$GROUP ${WORKDIR}
rm -rf kafka_2.13-${VERSION}.tgz kafka_2.13-${VERSION}

# Not needed
sudo runuser -l "$USER" -c "
pushd ${WORKDIR} || exit 1
ls -la
export PATH=$PATH:/opt/java/jre1.8.0_361/bin/
popd || exit 1
"
