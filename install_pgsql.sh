#!/bin/sh

sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt buster-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
sudo apt update
sudo apt install postgresql-13 -y
sudo passwd -d postgres
su - -c "psql -c $'ALTER USER postgres WITH PASSWORD \'123456\';'" postgres
sudo sed -i 's@127.0.0.1/32@0.0.0.0/0@g' /etc/postgresql/13/main/pg_hba.conf

sudo pg_ctlcluster 13 main start
sudo /etc/init.d/postgresql restart postgresql

