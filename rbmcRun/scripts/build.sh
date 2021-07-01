#!/bin/bash

set -xeo pipefail

# Support docker run --init parameter which obsoletes the use of dumb-init,
# but support dumb-init for those that still use it without --init
test=romulus

git clone git@github.com:robotframework/robotframework.git
cd robotframework
# git checkout -b  61964d00e
robot --variable BROWSER:Firefox --outputdir results /usr/share

robot -v OPENBMC_HOST:127.0.0.1 redfish/extended/test_basic_ci.robot --outputdir results ${HOME}