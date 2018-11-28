Para criar o banco:

Rode o script de criação
$ mysql -u root -p < ../multipleTables.sql

Copie os .csv para /var/lib/mysql/GameMultiple
$ sudo cp *.csv /var/lib/mysql/GameMultiple

Rode o script de inserção
$ mysql -u root -p < ../insertMultipleTables.sql