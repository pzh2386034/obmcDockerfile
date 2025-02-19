#! /bin/bash

cd /home/openbmc-2.12.0
source setup tririverv3 /tmp/build
ln -sf /workdir downloads
touch conf/sanity.conf
bitbake obmc-phosphor-image
cp tmp/deploy/images/tririverv3/tririverv3_bmc_openbmc_*_all.tar /tmp/release/tririverv3
