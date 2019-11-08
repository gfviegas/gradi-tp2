# Configurando o projeto

Coloque o arquivo de inserts do banco transacional, que não são versionados devido ao seu tamanho, em `./copy-maker/input` com os nomes originais.
Execute o comando `docker-compose run copy python3 main.py` para gerar os arquivos de inserção no banco de dados transcional. Aguarde este comando finalizar.

Suba o banco com `docker-compose up transactional`. Se for a primeira execução, os dados já serão inseridos, se a etapa anterior foi realizada corretamente.


## Subindo sistema PGAdmin

Execute `docker-compose up admin` para subir o PGAdmin e obter uma interface gráfica no browser para gerenciar os BDs.
As credenciais no login são: email `gradi@ufv.br` e senha `admin123`.

A conexão com o banco transacional segue as configurações:
 - **Host**: `transactional`
 - **User**: `admin`
 - **Senha**: `admin123`
 - **DB**: `seguradora`
