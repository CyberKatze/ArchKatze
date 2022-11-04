#!/bin/bash


get_version(){
  local ver=$(echo -e "$1" | grep -m 1 "pkgver")
  echo "${ver#*=}"

}
verlt() {
  [[ $1 != $2 && $1 = $(echo -e "$1\n$2" | sort -V | head -n1) ]]
}

new="$(yay -Gp neovim)"
get_version "$new"

if verlt 2 2
then
  echo "yes"
else
  echo "no"
fi


