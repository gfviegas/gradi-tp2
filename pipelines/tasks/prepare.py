import luigi

from databases.datawarehouse import get_db

# Definição da task de preparar o BD do Datawarehouse para receber dados
class PrepareTask(luigi.Task):
  def requires(self):
    return []

  def output(self):
    return luigi.LocalTarget('output/prepare.txt')

  def run(self):
    con, cur, db = get_db()
    cur.execute("""SELECT table_name FROM information_schema.tables
       WHERE table_schema = 'public'""")
    with self.output().open('w') as f:
      for table in cur.fetchall():
        f.write("{}\n".format(table))
