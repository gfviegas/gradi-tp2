import luigi
import os

from .extract import ExtractEntityTask
from databases.datawarehouse import get_db

class ImportEntityTask(luigi.Task):
  entity = luigi.Parameter()

  def get_file(self):
    script_dir = os.path.dirname(__file__)
    input = '../output/warehouse_{}s.sql'.format(self.entity)
    return open(os.path.join(script_dir, input), 'r')

  def requires(self):
    return [ExtractEntityTask(entity=self.entity)]

  def output(self):
    return luigi.LocalTarget('output/import_warehouse_{}s.txt'.format(self.entity))

  def run(self):
    con, cur, db = get_db()
    file = self.get_file()

    columns = file.readline().split(',')
    cur.copy_from(file, self.entity, sep=',', columns=columns)
    con.commit()

    with self.output().open('w') as f:
      f.write('ENTIDADE: {}\n'.format(self.entity))

# Definição da task de exportar os dados do banco transacional
class ImportTask(luigi.Task):
  def requires(self):
    yield ImportEntityTask(entity='ano'),
    yield ImportEntityTask(entity='cliente'),
    yield ImportEntityTask(entity='seguro'),
    yield ImportEntityTask(entity='veiculo')

  def output(self):
    return luigi.LocalTarget('output/import.log')

  def run(self):
    yield ImportEntityTask(entity='sinistro')
