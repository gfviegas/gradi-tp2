import luigi

from .prepare import PrepareTask
from databases.transactional import get_db

# Definição da task de exportar os dados do banco transacional
class ExtractTask(luigi.Task):
  def requires(self):
    return [PrepareTask()]

  def output(self):
    return luigi.LocalTarget('outputs/extract.sql')

  def run(self):
    con, cur, db = get_db()
    cur.execute("""SELECT table_name FROM information_schema.tables
       WHERE table_schema = 'public'""")

    with self.output().open('w') as f:
      for table in cur.fetchall():
        f.write("{}\n".format(table))
