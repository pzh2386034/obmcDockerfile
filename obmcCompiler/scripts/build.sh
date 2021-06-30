#!/bin/bash

set -xeo pipefail

# Support docker run --init parameter which obsoletes the use of dumb-init,
# but support dumb-init for those that still use it without --init
test=romulus

git clone git@github.com:openbmc/openbmc.git 
cd openbmc
git checkout -b  61964d00e
. setup romulus
touch conf/sanity.conf
bitbake obmc-phosphor-image

ln -s tmp/deploy/images/${test}/obmc-phosphor-image-${test}.static.mtd /opt/obmc-phosphor-image-${test}.static.mtd 