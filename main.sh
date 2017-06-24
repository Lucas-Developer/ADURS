#!/bin/bash

function Nome()
{
    printf "  █████╗ ██████╗ ██╗   ██╗██████╗ ███████╗\n"
    printf " ██╔══██╗██╔══██╗██║   ██║██╔══██╗██╔════╝\n"
    printf " ███████║██║  ██║██║   ██║██████╔╝███████╗\n"
    printf " ██╔══██║██║  ██║██║   ██║██╔══██╗╚════██║\n"
    printf " ██║  ██║██████╔╝╚██████╔╝██║  ██║███████║\n"
    printf " ╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚══════╝\n"
    printf "Versão = 0.7\n"
}

#Função que imprime uma linha
function Linha()
{
  printf "\n=================================================================\n"
}

#Função que indica um sinal de espera para entrada do usuario
function Sinal()
{
  printf "\n-> "
}

#Se a distribuição for Arch Linux ou baseadas
#Criado por Wrench | https://github.com/WrenchCoder
function Arch()
{
      clear
      printf "WBot: Então voce usa Arch, boa escolha!\n"
      printf "WBot: Irei atualiza-lo para você\n"
      sudo pacman -Syyuu #Atualização completa do sistema

      #Pergunta ao usuario se deseja instalar o Nmap e se sim, o instala.
      clear
      printf "\n::Gostaria de instalar o Nmap [s/n]?\n"
      Sinal
      read N
          if (( "$N" == "s" || "$N" == "S")); then
              sudo pacman -S nmap
          fi

      #Pergunta ao usuario se deseja instalar o Proxychains e se sim, o instala
      clear
      printf "\n::Gostaria de instalar o Proxychains [s/n]?\n"
      Sinal
      read P
          if (( "$P" == "s" || "$P" == "S" )); then
              sudo pacman -S proxychains
          fi

      #Pergunta ao usuario se deseja instalar o Tor e se sim, o instala
      clear
      printf "\n::Gostaria de instalar o Tor [s/n]?\n"
      Sinal
      read T
          if (( "$T" == "s" || "$T" == "S" )); then
              sudo pacman -S tor
          fi

      #Pergunta ao usuario se deseja instalar o Tor-Browser e se sim, o instala
      clear
      printf "\n::Gostaria de instalar o Tor-Browser [s/n]?\n"
      Sinal
      read TB
          if (( "$TB" == "s" || "$TB" == "S" )); then
              yaourt -S tor-browser
          fi
}

#Se a distribuição for Debian ou baseadas
#Feito por Lucas | https://github.com/Lucas-Developer
function Debian()
{
  if (( "$Dist" == 2 )); then
      clear

      #Sincroniza com os repositorios/Atualiza os pacotes/Atualiza a distribuição/Remove pacotes desnecessarios
      sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y

      #Interface gráfica para o IPTables
      sudo apt-get install fwbuilder

      #Nmap é uma ferramenta de código aberto para exploração de rede e auditoria de segurança.
      sudo apt-get install nmap && apt-get install zenmap

      #Um poderoso analisador de pacotes. Ele permite que você capture o tráfego em uma rede de computadores. Ele permite você examinar dados de uma rede e detalhar apenas o pacote que você precisa analisar.
      sudo apt-get -y install wireshark wireshark-common wireshark-dev

      #Tor é um software livre e de código aberto que proporciona o anonimato pessoal ao navegar na Internet e em atividades online
      sudo add-apt-repository -y ppa:webupd8team/tor-browser && sudo apt-get update && sudo apt-get install tor-browser

      #Proxychains é um programa para forçar outros programas a usar um servidor proxy
      sudo apt-get install tor && apt-get install proxychains

      #O GPA é um Front-End para o GPG
      sudo apt install gpa

      #O Pidgin é um programa livre e de código aberto (FOSS) que organiza diferentes contas de mensagens instantâneas (MI) em uma única interface. O plugin Off-the-Record (OTR) é usado com o Pidgin para assegurar a comunicação autenticada e segura entre pessoas que o utilizam.
      sudo apt-get install pidgin && apt-get install pidgin-otr

      #O OpenVPN é um software livre e open-source para criar redes privadas virtuais do tipo ponto-a-ponto ou server-to-multiclient através de túneis criptografados entre computadores.
      sudo apt install openvpn

      #Rede overlay anônima. É destinada a proteger comunicações da vigilância e monitoramento por terceiros, tais como provedores de acesso à internet.
      sudo apt-add-repository ppa:i2p-maintainers/i2p && apt-get update && apt-get install i2p

      #Criptografia de disco de código aberto
      sudo apt install cryptsetup

      #Kismet é um sistema de detecção de intrusos para rede sem fio. Kismet identifica redes promiscuamente, detectando redes ocultas maliciosas!
      sudo apt-get install kismet

      #Tanto o rkhunter quanto o lynis oferecem recursos de auditoria, ou seja, apenas verificam o estado do sistema; buscando por vulnerabilidades presentes.
      sudo apt-get install rkhunter && apt-get install lynis

      #Permitindo Tráfego de Entrada em Portas Específicas; Bloqueando Tráfego; Salvando o Iptables
      sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT && iptables -A INPUT -p tcp --dport 80 -j ACCEPT && iptables -I INPUT 1 -i lo -j ACCEPT && iptables -P INPUT DROP &&  apt-get install iptables-persistent
  fi
}

#Função que imprime um menu que pergunta ao usuario a distribuição na qual ele deseja aplicar o script
function Distro()
{
  Linha
  printf "WBot: Olá $USER, como esta você? xD\n"
  printf "WBot: Me diga qual distribuição você esta usando nesse momento, por favor?\n"
  Linha

  printf "1.Arch Linux ou baseadas\n"
  printf "2.Debian ou baseadas\n"
  printf "3.Ubuntu ou baseadas\n"
  printf "4.RedHat ou baseadas\n"

  Sinal
  read Dist
  Linha

  #Se for Arch Linux
  if (( "$Dist" == 1 )); then
    Arch
  fi

  #Se for Debian
  if (( "$Dist" == 2 )); then
    Debian
  fi

  #Outras distribuições continuam aqui
}

clear
Nome

Distro
