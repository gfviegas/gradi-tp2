# Configurando o projeto

Coloque o arquivo de inserts do banco transacional, que não são versionados devido ao seu tamanho, em `./postgresql/transacional/init` com os nomes:

- 02-insert-montadoras.sql
- 03-insert-modelos.sql
- 04-insert-clientes.sql
- 05-insert-carros.sql
- 06-insert-seguros.sql
- 07-insert-sinistros.sql


Suba o banco com `docker-compose up transactional`. Se for a primeira execução, vá tomar um café e aguardar uns bons 10 a 20 minutos.


## Subindo sistema PGAdmin

Execute `docker-compose up admin` para subir o PGAdmin e obter uma interface gráfica no browser para gerenciar os BDs.
As credenciais no login são: email `gradi@ufv.br` e senha `admin123`.

A conexão com o banco transacional segue as configurações:
 - **Host**: `transactional`
 - **User**: `admin`
 - **Senha**: `admin123`
 - **DB**: `seguradora`
