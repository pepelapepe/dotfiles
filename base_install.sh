#!/bin/bash

ln -sf /usr/share/zoneinfo/Europe/Rome /etc/localtime
hwclock --systohc
sed -i '171s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=us" >> /etc/vconsole.conf
echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts

pacman -S grub efibootmgr os-prober ntfs-3g gvfs gvfs-mtp dhcpcd base-devel linux-lts-headers xdg-utils bash-completion reflector

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable dhcpcd.service
systemctl enable reflector.timer
systemctl enable fstrim.timer

useradd -m pepe
usermod -aG wheel pepe
echo "pepe ALL=(ALL) ALL" >> /etc/sudoers.d/pepe

printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"
