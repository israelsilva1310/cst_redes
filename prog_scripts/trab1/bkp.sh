#!/bin/bash

echo "Digite a data desejada para verificação: "
read -r dtconsulta
sleep 0.2
echo "qual quantidade aceitavel de spam"
read -r maxspam
sleep 0.2
echo "Pesquisando..."
sleep 0.5
cd /home/"$USER"/prog_scripts/trab1/quarentena/"$dtconsulta"/spam/ || exit

spam=$(find /home/"$USER"/prog_scripts/trab1/quarentena/"$dtconsulta"/spam/ | wc -l)

#echo $spam

if [ "$spam" -lt "$maxspam" ]; then
  echo 'NORMAL '
else
  while true; do
    echo -e "\e[?5h\e[33;5;1m A L E R T A"
    find /home/"$USER"/prog_scripts/trab1/quarentena/"$dtconsulta"/spam/ | wc -l
    echo "SPAM EM EXCESSO: "
    sleep 0.5
    printf \\e[?5l
    read -r -s -n1 -t1 && printf \\e[?5l && break
  done
fi
exit
