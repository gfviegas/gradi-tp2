import os
import pandas as pd

buffersize = 2**16
types = ['montadora', 'modelo', 'cliente', 'carro', 'seguro', 'sinistro']

def insertToCSV(line):
  col_data = line.split('VALUES(')[1].split(');')[0].split(', ')
  return ','.join(col_data).replace('\'', '')

def createOutputFiles():
  for t in types:
    if not os.path.exists('./output/{}.sql'.format(t)):
      with open('./output/{}.csv'.format(t), 'w'): pass

def processFile(type):
  input_path = 'input/{}3.txt'.format(type)
  output_path = 'output/{}.csv'.format(type)

  output = open(output_path, 'a+')

  with open(input_path) as f:
    while True:
      lines_buffer = f.readlines(buffersize)

      if not lines_buffer:
        break
      for line in lines_buffer:
        line_result = insertToCSV(line)
        output.write('{}\n'.format(line_result))

  output.close()


if __name__ == '__main__':
  createOutputFiles()

  for t in types:
    processFile(t)
