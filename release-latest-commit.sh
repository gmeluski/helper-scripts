#!/usr/bin/env bash

RELEASE_VERSION=2.6.5-stable

function sync_release() {
  git checkout ${RELEASE_VERSION}
  git pull origin ${RELEASE_VERSION}
}

function update_master() {
  git fetch
  git checkout master
  git pull origin master
}

function get_master_hash() {
  git rev-parse master
}

function cherry_pick_latest() {
  git cherry-pick $1
}

update_master
sync_release
MASTER_HASH=$(get_master_hash)
cherry_pick_latest "$MASTER_HASH"
git push origin ${RELEASE_VERSION}

