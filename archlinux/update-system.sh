#!/bin/bash

echo ":: Iniciando la actualización del sistema ($(date)) ::"

# Actualizar Arch Linux
sudo pacman -Syu --noconfirm

echo ":: Actualización de Arch Linux completada ::"

echo ":: Iniciando la actualización de AUR con paru ($(date)) ::"

# Actualizar paru
sudo paru -Syu --noconfirm

echo ":: Actualización de AUR con paru completada ::"
