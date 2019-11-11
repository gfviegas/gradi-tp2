import luigi
import os

from .prepare import PrepareTask
from databases.transactional import get_db
from databases.datawarehouse import get_db as get_db_dw

# Task que lê o SQL de uma entidade do datawarehouse local e gera um comando
# copy para poder ser importado
class ExtractEntityTask(luigi.Task):
  entity = luigi.Parameter()

  def get_query(self):
    print('ENTIDADE: {}'.format(self.entity))
    script_dir = os.path.dirname(__file__)
    input = './sqls/export-transactional-{}s.sql'.format(self.entity)
    with open(os.path.join(script_dir, input), 'r') as f:
      return f.read()

  def requires(self):
    return []

  def output(self):
    return luigi.LocalTarget('output/warehouse_{}s.sql'.format(self.entity))

  def run(self):
    query = self.get_query()

    con, cur, db = get_db()
    copy_query = 'COPY ({0}) TO STDOUT WITH CSV HEADER'.format(query)

    with self.output().open('w') as f:
      cur.copy_expert(copy_query, f)
