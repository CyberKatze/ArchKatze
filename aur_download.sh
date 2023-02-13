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

aur_download() {
  [ ! -d $repo_dir/tmp ] && mkdir "$repo_dir/tmp"
  for p in $(packages)
  do
    pck_name=${p%%=*}
    pck_url=${p##*=}
    printf "\e[32;1m Downloading '$pck_name'...\e[0m \n"
    pushd $repo_dir
    [ ! -d "$pck_name" ] && mkdir "$pck_name"
    # Make a temporary directory for package and download package there

    printf "create temp"
    git clone $pck_url ./tmp/$pck_name
    # Check if we have the package or not
    if [ -e "$pck_name/PKGBUILD" ]
    then 
      remote_ver=$(get_version "tmp/$pck_name/PKGBUILD")
      local_ver=$(get_version "$pck_name/PKGBUILD")
      # Check if local_ver need update or not
      if verlt $local_ver $remote_ver
      then
        rm -rf $pck_name
        mv tmp/$pck_name $pck_name
        pushd $pck_name 
        makepkg -cs --noconfirm
        popd
      else
        printf "\e[35;1m Package is up to date \e[0m \n"
        echo "---------------------------------------------------------- "
      fi

    else
        rm -rf $pck_name
        mv tmp/$pck_name $pck_name
        pushd $pck_name 
        makepkg -cs --noconfirm
        popd
    fi
  popd
  done
}

aur_download

