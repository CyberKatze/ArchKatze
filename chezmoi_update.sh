HOME=$(readlink -f ./airootfs/home/live)
printf "\n\n" | chezmoi -c chezmoi.yaml init --exclude=scripts,encrypted --apply --force --no-tty 

