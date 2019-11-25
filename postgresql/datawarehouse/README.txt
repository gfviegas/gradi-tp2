## Executando Metabase pelo Docker

Execute o comando no terminal:
	docker run -d -p 3000:3000 --name metabase metabase/metabase

ou... se der algo errado...
docker run -d -p 3000:3000 --net=host --name metabase metabase/metabase

Entre em localhost:3000


