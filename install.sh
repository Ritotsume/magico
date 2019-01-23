#!/bin/bash

# read -r -d '' logo <<'EOF'
IFS='' read -r -d '' logo <<'EOF'
Bem vindo ao script de instalação do:
                       _           
 _ __ ___   __ _  __ _(_) ___ ___  
| '_ ` _ \ / _` |/ _` | |/ __/ _ \ 
| | | | | | (_| | (_| | | (_| (_) |
|_| |_| |_|\__,_|\__, |_|\___\___/ 
                 |___/             
EOF

echo "$logo"

cache="/tmp/magico-cache"

echo "Instalando dependencias..."
sudo pacman -S jq jshon git --noconfirm 1> /dev/null 2> /dev/null

echo "Clonando o magico..."
[ -d $cache ] && rm -rf $cache 
mkdir -p $cache 
git clone https://aur.archlinux.org/magico $cache
cd $cache

echo "Instalando o magico..."
makepkg -si --noconfirm 1> /dev/null 2> /dev/null

clear
echo "Tudo pronto!"

exit