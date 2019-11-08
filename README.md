# Configurando o projeto

Coloque o arquivo de inserts do banco transacional em `./postgresql/transacional/init` com o nome `02-inserts.sql`.
Suba o banco com `docker-compose up transactional`.


## Subindo sistema PGAdmin

Execute `docker-compose up admin` para subir o PGAdmin e obter uma interface gráfica no browser para gerenciar os BDs.
As credenciais no login são: email `gradi@ufv.br` e senha `admin123`.

A conexão com o banco transacional segue as configurações:
 - **Host**: `transactional`
 - **User**: `admin`
 - **Senha**: `admin123`
 - **DB**: `seguradora`
