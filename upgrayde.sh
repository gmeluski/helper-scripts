#!/usr/bin/env bash

function upgrade_lib() {
  react-native unlink $1 && yarn upgrade $1@^$2 && react-native link $1
}

function get_version() {
  for line in $(yarn info $1 version --json)
  do
    version=$(echo "$line" | jq '.["data"]')
  done

  no_suffix="${version%\"}"
  clean_version="${no_suffix#\"}"
  echo $clean_version
}

version=$(get_version "$1")
upgrade_lib "$1" "$version"
