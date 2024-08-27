#!/bin/bash

echo "Criando a infraestrutura..."

echo "Criando directorios"

mkdir /public /adm /ven /sec

echo "Criando grupos"

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando usuarios e adicionando ao grupo adm"

useradd carlos -c "Carlos" -m -s /bin/bash -p $(openssl passwd -6 senhaadm) -G GRP_ADM
useradd maria -c "Maria" -m -s /bin/bash -p $(openssl passwd -6 senhaadm) -G GRP_ADM
useradd joao -c "João" -m -s /bin/bash -p $(openssl passwd -6 senhaadm) -G GRP_ADM

echo "Criando usuarios e adicionando ao grupo de vendas"

useradd debora -c "Débora" -m -s /bin/bash -p $(openssl passwd -6 senhaven) -G GRP_VEN
useradd sebastiana -c "Sebastiana" -m -s /bin/bash -p $(openssl passwd -6 senhaven) -G GRP_VEN
useradd roberto -c "Roberto" -m -s /bin/bash -p $(openssl passwd -6 senhaven) -G GRP_VEN

echo "Criando usuarios e adicionando ao grupo de secretariado"

useradd josefina -c "Josefina" -m -s /bin/bash -p $(openssl passwd -6 senhasec) -G GRP_SEC
useradd amanda -c "Amanda" -m -s /bin/bash -p $(openssl passwd -6 senhasec) -G GRP_SEC
useradd rogerio -c "Rogerio" -m -s /bin/bash -p $(openssl passwd -6 senhasec) -G GRP_SEC

echo "Indicando as permissões"

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 777 /public
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec

echo "Finalizado!"
