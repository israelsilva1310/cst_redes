#!/bin/bash

# Configuracoes iniciais
#Questões – Questão 2

#– Numa determinada empresa foi implantada uma solução de código livre para
#tratamento de mensagens e-mails de tipo “spam”. A solução anti-spam adotada foi
#o Spamassassin, implantado em um servidor Linux.

#● Espera-se que o administrador da rede da empresa saiba quantos spams são
#detectados diariamente pelo controle anti-spam.

#● Além disso, quando houver mais de um determinado número de spams
#detectados em um mesmo dia, o administrador da rede da empresa deve ser
#notificado com um aviso urgente.

#● Como podemos solucionar esse problema? [continua no próximo slide...]

#– Restrições
#● O número limite de spams deverá ser passado pelo terminal, como parâmetro.

#● O dia a ser analisado também deverá ser passado pelo terminal.

#Informações adicionais

#● O Spamassassin é um programa utilizado para controle de spams. Para cada dia do ano que esse programa esteja em 
#atividade, é criado automaticamente um diretório de quarentena, onde as mensagens bloqueadas por serem suspeitas são armazenadas.

#– Exemplos de nomes de diretórios: 20061009, 20080621, 20091126 (ano +mês + dia).
#– Dentro de cada um desses diretórios, há outro diretório chamado “spam”.

#● Dentro desse diretório, há um arquivo para cada spam encontrado.

#– Dica
#● Contar quantos spams foram encontrados em um dia é fácil: Basta ir no diretório referente ao dia, acessar o diretório 
#“spam” e contar o número de arquivos presentes no diretório.



#######    Codigo ##############                    
echo "Digite a data desejada para verificação: "
read dtconsulta
sleep 0.5
echo "qual quantidade aceitavel de spam"
read maxspam

if [ -z $dtconsulta ]
	then
		echo "Você não digitou uma data!"
	else
		echo "pesquisando, $dtconsulta"
		sleep 0.850
fi

echo "Configurando o filtro!...Aguarde..."
sleep 0.15
echo "Avançando...checando pastas"

contador=0
while [ $contador -lt $maxspam ];
do
    #echo O valor atual do contador é: $contador
	touch > /home/$USER/prog_scripts/$dtconsulta/spam/spam{$contador}.txt
    let contador=contador+1
done
#touch > /home/$USER/prog_scripts/$dtconsulta/spam/spam{$contador}.txt

if [ -e "/home/$USER/prog_scripts/$dtconsulta" ]
	then
		echo " O diretorio $dtconsulta já existe, Atualizando aquivo do dia..."
sleep 1

ls -la /home/$USER/prog_scripts/$dtconsulta/spam/

contador=0
while [ $contador -lt $maxspam ];
do
    #echo O valor atual do contador é: $contador
	touch > /home/$USER/prog_scripts/$dtconsulta/spam/spam{$contador}.txt
    let contador=contador+1
done
#touch > /home/$USER/prog_scripts/$dtconsulta/spam/spam{$contador}.txt

sleep 0.25

echo "A quantidade atual de spam é: "ls -la|grep -e "^-"|wc -l /home/$USER/prog_scripts/$dtconsulta/spam/
else

echo " O diretorio $dtconsulta não existe... criando agora!"
mkdir -p /home/$USER/prog_scripts/$dtconsulta

mkdir -p /home/$USER/prog_scripts/$dtconsulta/spam

touch /home/$USER/prog_scripts/$dtconsulta/spam/spam{1.."$maxspam"}.txt

ls -l /home/$USER/prog_scripts/$dtconsulta/spam/
fi
exit

while true; do
    echo -e "\e[?5h\e[33;5;1m A L E R T A $(date) ls -la|grep -e "^-"|wc -l"
    sleep 0.1
    printf \\e[?5l
    read -s -n1 -t1 && printf \\e[?5l && break
done

echo "Avançando...."
sleep 0.15

echo "Total de spam na data $dtconsulta : "

sleep 0.10
ls -l /home/$USER/prog_scripts/$dtconsulta/spam/
sleep 0.25
echo A quantidade atual de spam é: ls -la|grep -e "^-"|wc -l /home/$USER/prog_scripts/$dtconsulta/spam/

