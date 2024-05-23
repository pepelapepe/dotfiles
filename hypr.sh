#!/bin/bash

# Install hyprland dependencies
yay -S gdb ninja gcc cmake meson libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite xorg-xinput libxrender pixman wayland-protocols cairo pango seatd libxkbcommon xcb-util-wm xorg-xwayland libinput libliftoff libdisplay-info cpio tomlplusplus hyprlang hyprcursor

#Install Essentials
yay -S kitty dolphin cliphist wofi xdg-desktop-portal-hyprland

# Build Hyprland
git clone --recursive https://github.com/hyprwm/Hyprland
cd Hyprland
make all && sudo make install
