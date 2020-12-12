import os, sys

args = sys.argv[1:]

if len(args) == 0:
  print(">> Uso: python Compila.py guion.tex ")
  exit()

lname = args[0] if args[0].endswith('.tex') else args[0]+'.tex'
if not os.path.isfile(lname):
  print('ERROR: "%s" not found'%lname)
  print(">> Uso: python Compila.py guion.tex ")
  exit()

basename = lname[:-4]
oname = basename+'.pdf'
if not os.path.isdir('pdf'): os.mkdir('pdf')
os.system("pdflatex %s"%(args[0]))
if os.path.isfile(basename+'.aux'): os.remove(basename+".aux")
if os.path.isfile(basename+'.log'): os.remove(basename+".log")
if os.path.isfile(basename+'.out'): os.remove(basename+".out")
os.system('mv %s pdf/'%oname)

print('Created pdf file: pdf/%s'%oname)
