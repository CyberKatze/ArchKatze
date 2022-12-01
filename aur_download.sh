#!/bin/bash
repo_dir="./aur_repo"
pkgs="./aur_packages"

get_version(){
  local ver=$(grep -m 1 "pkgver" $1)
  echo "${ver#*=}"

}

verlt() {
  [[ $1 != $2 && $1 = $(echo -e "$1\n$2" | sort -V | head -n1) ]]
}

packages() {
  awk  '/^[^#].*/ {print $0}' $pkgs
}

Download() {
  [ ! -d $repo_dir/tmp ] && mkdir "$repo_dir/tmp"
  for p in $(packages)
  do
    printf "\e[32;1m Downloading '$p'...\e[0m \n"
    pushd $repo_dir
    [ ! -d "$p" ] && mkdir "$p"
    # Make a temporary directory for package and download package there

    printf "create temp"
    pushd "tmp"
    yay -G $p
    popd
    # Check if we have the package or not
    if [ -e "$p/PKGBUILD" ]
    then 
      remote_ver=$(get_version "tmp/$p/PKGBUILD")
      local_ver=$(get_version "$p/PKGBUILD")
      # Check if local_ver need update or not
      if verlt $local_ver $remote_ver
      then
        rm -rf $p
        mv tmp/$p $p
        pushd $p 
        makepkg -c
        popd
      else
        printf "\e[35;1m Package is up to date \e[0m \n"
        echo "---------------------------------------------------------- "
      fi

    else
        rm -rf $p
        mv tmp/$p $p
        pushd $p 
        makepkg -c
        popd
    fi
  popd
  done
}

Download

