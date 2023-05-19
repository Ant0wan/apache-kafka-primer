#!/usr/bin/env bash
set -o errexit
set -o xtrace

VERSION='3.4.0'
WORKDIR='/opt/kafka'
USER='kafka'
GROUP='kafka'

sudo adduser --gecos --no-create-home --disabled-password "$USER"
sudo install -d -m 0755 -o "$USER" -g "$GROUP" "$WORKDIR"
sudo usermod -d "$WORKDIR" "$USER"

curl https://dlcdn.apache.org/kafka/${VERSION}/kafka_2.13-${VERSION}.tgz --output kafka_2.13-${VERSION}.tgz
tar -xzf kafka_2.13-${VERSION}.tgz
sudo mv kafka_2.13-${VERSION}/* ${WORKDIR}
sudo chown -R $USER:$GROUP ${WORKDIR}
rm -rf kafka_2.13-${VERSION}.tgz kafka_2.13-${VERSION}

test_access() {
 sudo runuser -l "$USER" -c "
	pushd ${WORKDIR} || exit 1
	ls -la
	export PATH=$PATH:/opt/java/jre1.8.0_361/bin/
        which java
	popd || exit 1
	"
}
test_access
