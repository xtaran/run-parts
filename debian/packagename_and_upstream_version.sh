#!/bin/sh

DELIM=${1:-_}

# dpkg-parsechangelog option -S requires dpkg >= 1.17
echo `dh_listpackages`$DELIM`dpkg-parsechangelog -SVersion | sed -e 's/-[^-]*$//'`
