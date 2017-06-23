#!/bin/bash
function Linha()
{
  printf "\n================================================\n"
}
function Sinal()
{
  printf "\n-> "
}

function Distro()
{
  printf "1.Arch Linux ou baseadas\n"
  printf "2.Debian ou baseadas\n"
  printf "3.Ubuntu ou baseadas\n"
  printf "4.RedHat ou baseadas\n"

  Sinal
  read $Dist
  Linha

      if [ "$Dist" == "$1" ]; then
          clear
          printf "WBot: Então voce usa Arch, boa escolha!\n"
          printf "WBot: Irei atualiza-lo para você\n"
          sudo pacman -Syyuu

          printf "Gostaria de instalar o Nmap [s/n]?\n"
          Sinal
          read $N
          declare y
          y="s"
              if [ "$N" = "$Y" ]; then
                  sudo pacman -S nmap
              fi
      fi
}

clear
printf "WBot: Olá $USER, como esta você? xD\n"
printf "WBot: Me diga qual distribuição você esta usando nesse momento, por favor?\n"
Linha

Distro
