HOME=$(readlink -f ./airootfs/home/live)
[ -d $HOME/.local/share/ ] && mkdir -p $HOME/.local/share
printf "\n\n" | chezmoi -c chezmoi.yaml init --exclude=scripts,encrypted --apply --force --no-tty https://github.com/cyberkatze/dotfiles

