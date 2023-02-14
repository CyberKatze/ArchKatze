#!/usr/bin/env bash

RECIPES_DIR="airootfs/root/ArchScripts/recipes"
ALL_PACKAGES=""

# Delete this later, just add one package
export ALL_PACKAGES="curl"
# for recipe_file in $(find ${RECIPES_DIR} -name "*.sh")
# do
#     source ${recipe_file}
#     export ALL_PACKAGES="${ALL_PACKAGES} ${RECIPE_PKGS}"
# done
