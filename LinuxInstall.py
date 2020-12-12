import os, sys

# Folder where latex looks for .cls and .sty files in linux
pathToFolder = '~/texmf/tex/latex/local/'

def MoveFileToFolder(fname, pathToFolder, verbose=False):
  if not os.path.isdir(pathToFolder):
    os.system('mkdir -p %s'%pathToFolder)

  if not (os.path.isfile(fname) or os.path.isdir(fname)):
    print('ERROR: file "%s" not found... execute this script from the directory where "%s" is'%(fname,fname))
    return

  if verbose: print('Moving %s to %s'%(fname, pathToFolder))
  os.system('cp -r %s %s'%(fname, pathToFolder))

if __name__ == '__main__':
  # Let's copy all .cls and .sty files in the directory
  for f in os.listdir('.'):
    if not f.endswith('.cls') or f.endswith('.sty'): continue
    MoveFileToFolder(f, pathToFolder, True)
  # Let's also move the folder containing all the logos
  MoveFileToFolder('myLogos', pathToFolder, True)
