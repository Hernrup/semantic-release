#!/usr/bin/env bash
if test -f "./setup.py"; then
  echo "setup.py exists, updating version"
  sed -i "s/VERSION\s*=\s*[\"'][0-9.a-z]*[\"']/VERSION = '${1}'/g" ./setup.py
fi
