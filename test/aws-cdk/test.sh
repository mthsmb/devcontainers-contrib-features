#!/bin/bash -i

set -e

source dev-container-features-test-lib

check "cdk --version" cdk --version

reportResults
