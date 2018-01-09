#!/bin/bash

find ${1} -maxdepth 5 -name .git -type d -prune -print0 | xargs -0 -n1 dirname
