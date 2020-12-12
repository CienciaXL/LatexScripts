import os, sys

arg = sys.argv[1:]
if len(arg) == 0: 
  print(' >> Uso: python ScriptToTeleprompt.py guion.tex')
  exit()


fname = arg[0] if arg[0].endswith('.tex') else arg[0]+'.tex'
outname = fname[:-4]+'.txt'
if not os.path.isfile(fname):
  print('EROR: file "%s" not found'%fname)
  exit()

if not os.path.isdir('teleprompt'): os.mkdir('teleprompt')

with open(fname) as f:
  fout = open(outname,"w")
  for l in f.read().splitlines():
    if   l.startswith('\\scene'): fout.write('\n\n\n')
    elif l.startswith('%') or l.startswith('\\'): continue
    elif l == '' or l.replace(' ','') == '': continue
    else:
      fout.write(l+'\n')

fout.close() 
os.system('mv %s teleprompt/'%(outname))
print('Created teleprompt file: teleprompt/%s'%outname)
