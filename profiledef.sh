#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="archKatze"
iso_label="archKatze_$(date +%Y%m)"
iso_publisher="Arch Katze <https://cyberkatze.tech>"
iso_application="Arch Linux Live/Rescue CD"
iso_version="$(date +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito'
	   'uefi-ia32.grub.esp' 'uefi-x64.systemd-boot.esp'
	   'uefi-ia32.grub.eltorito' 'uefi-x64.systemd-boot.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/etc/gshadow"]="0:0:400"
  ["/etc/passwd"]="0:0:644"
  ["/etc/group"]="0:0:644"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"
  ["/root/install.sh"]="0:0:755"
  ["/root/ArchScripts/config.sh"]="0:0:755"
  ["/root/ArchScripts/expand_cowsize.sh"]="0:0:755"
  ["/root/ArchScripts/arch_install.sh"]="0:0:755"
  ["/root/ArchScripts/yay_install.sh"]="0:0:755"
  ["/home/live/"]="1000:1000:755"
)
