#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PATH="${DIR}/../../bin:${PATH}"

crxdl "jmggnmiangppjceogakhdmafabilpmof" "${DIR}/output/bookmarks-on-new-tab.sh.crx3"
