#!/bin/sh

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


echo "Instalando o SpamAssassin!...Aguarde..."

sudo apt-get update

apt-get install spamassassin spamc

echo "Avançando..."

echo "Criando Grupo"
groupadd spamd

echo "Avançando...."

echo "Adicionando Usuario..."
useradd -g spamd -s /bin/false -d /var/log/spamassassin spamd

echo "Criando diretorios..."
mkdir /var/log/spamassassin

echo "modificando as Permissoes..."
chown spamd:spamd /var/log/spamassassin

echo "Configurando o SpamAssassin...."

nano /etc/default/spamassassin

