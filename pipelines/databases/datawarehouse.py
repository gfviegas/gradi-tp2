import psycopg2

con = cur = db = None

def connect():
  global con, cur, db

  try:
    con = psycopg2.connect(
      user="admin",
      password = "admin123",
      host = "datawarehouse",
      port = "5432",
      database = "warehouse"
    )
    cur = con.cursor()
    db = cur.execute
  except psycopg2.DatabaseError as e:
    if con:
      con.rollback()
    print(e)

def get_db():
    if not (con and cur and db):
      connect()
    return (con, cur, db)
