#!/bin/bash

file_path="$(cd $(dirname "$(dirname "$0")"); pwd -P)/js/promptPick.js"
$file_path ask 'Pick branch' "$(git branch | grep -v '*')"