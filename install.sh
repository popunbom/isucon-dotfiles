#!/bin/bash

GIT_DIR=".dotfiles"

git clone "https://github.com/popunbom/isucon-dotfiles" ${GIT_DIR}

for FILE_PATH in $(find ${GIT_DIR} -maxdepth 1 -type f -name ".*"); do
  ln -sv "${FILE_PATH}" "${FILE_PATH#.dotfiles/}"
done
