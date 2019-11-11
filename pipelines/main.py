import luigi
from tasks import *
import os, shutil

for f in os.listdir('output'):
  file_path = os.path.join('output', f)
  try:
    if os.path.isfile(file_path):
      os.unlink(file_path)
  except Exception as e:
    print(e)

if __name__ == '__main__':

  luigi.run()
