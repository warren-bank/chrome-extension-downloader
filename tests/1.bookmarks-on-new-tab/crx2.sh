#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PATH="${DIR}/../../bin:${PATH}"

crx2dl "jmggnmiangppjceogakhdmafabilpmof" "${DIR}/output/bookmarks-on-new-tab.sh.crx2"
