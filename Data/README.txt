Para criar o banco GameMultiple:

Rode o script de criação
$ mysql -u root -p < ../multipleTables.sql

Copie os .csv para /var/lib/mysql/GameMultiple
$ sudo cp *.csv /var/lib/mysql/GameMultiple

Rode o script de inserção
$ mysql -u root -p < ../insertMultipleTables.sql

Para criar o banco GameSingle:

Rode o script de criação
$ mysql -u root -p < ../steamData.sql
$ mysql -u root -p < ../singleTable.sql

Copie os .csv para /var/lib/mysql/GameMultiple
$ sudo cp names.csv owners.csv /var/lib/mysql/GameSingle

Rode o script de inserção
$ mysql -u root -p < ../insertSingleTable.sql