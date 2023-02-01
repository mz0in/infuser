#!/bin/bash

find /opt -mindepth 1 -maxdepth 1 -print0 | xargs -0 sudo rm -rf
rm -rf "$GITHUB_WORKSPACE" && mkdir "$GITHUB_WORKSPACE"

# some tools like $HOME a little too much
TO_CLEAN=(.cabal opt .tea)
for DIR in "${TO_CLEAN[@]}"; do
  if test -d "$HOME"/"$DIR"; then
    rm -rf "${HOME:?}"/"${DIR:?}" || true
  fi
done
