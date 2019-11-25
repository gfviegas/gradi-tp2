FROM axiom/docker-luigi:latest-alpine

COPY . /code
WORKDIR /code

RUN pip install -r requirements.txt

CMD ["luigid"]
