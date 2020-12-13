import os, sys, argparse

# Youtube template
templateYoutube = '''\\documentclass[]{YoutubeScript}

%% Paquetes
\\usepackage[spanish]{babel}
\\usepackage[utf8x]{inputenc}
\\usepackage[T1]{fontenc}

%%###### INSTRUCCIONES PARA REFERENCIAS, IMAGENES Y VIDEOS
%% Divide el guion en escenas (\scene).
%% Añade descripciones cuando consideres adecuado (\desc{}).
%%
%% Usa \\addref{Un texto}{un link} para agregar referencias y mostrarla en el texto
%% \\addtorefs{Un texto}{un link} para sólo agregar  a las referencias
%% \\addtolinks{un texto}{un link} para agregar a la sección de "para saber más"
%%
%% Cuando agregues una imagen con referencia:
%% \\figr{nombre}{descripcion}{texto de la referencia}{link}
%% \\vidr{nombre}{descripcion}{texto de la referencia}{link}
%% Puedes agregar referencias o comentarios con un %% al principio de la línea, y no aparecerán en el guon
%%#########################################################################

%% Pon un titulo
\\title{%s}

%% Agrega nombre del canal, mail de contacto y redes
\\channel{Ciencia XL}
\\mail{cienciaxl@gmail.com}
\\followus{Instagram: @xuancern\\\\ Facebook: facebook.com/cienciaxl}

%% Escribe un resumen
\\resumen{Aqui va un resumen}

%% Si quieres, pon una miniatura aqui
%%\\miniatura{miniatura.png}

%% Si quieres, pon una imagen para cerrar el video aqui... aunque no es necesario
%%\\imgclose{imagenFinal.png}

\\begin{document}
\\buildtitlepage

\\scene
Esto es una primera escena

\\intro

\\scene
Esto es una segunda escena

\\desc{Esto es una explicacion}

\\scene

\\buildlastpage
\\end{document}
'''

# TikTok template
templateTikTok = '''\\documentclass[]{TiktokScript}

%% Paquetes
\\usepackage[spanish]{babel}
\\usepackage[utf8x]{inputenc}
\\usepackage[T1]{fontenc}

%% Pon un título
\\title{%s}
\\channel{Ciencia XL}

\\begin{document}
\\buildtitlepage

\\scene
Breve intro diciendo que vas a contar

\\desc{Una descripcion...}

\\scene
\\scene
\\scene

\\end{document}
'''


if __name__ == '__main__':
  parser = argparse.ArgumentParser(description='Crea un nuevo guion')
  parser.add_argument('--mode',  '-m' , default='youtube'            , help = 'Elige entre: youtube, tiktok')
  parser.add_argument('--out',   '-o' , default='plantillaGuion'     , help = 'Nomber del .tex')
  parser.add_argument('--title', '-t' , default='Aqui va el titulo'  , help = 'Elige un titulo, si quieres')


  args = parser.parse_args()
  texname = args.out
  title = args.title
  mode = args.mode
  if texname.endswith('.tex'): outname = outname[:-4]

  if mode.lower() == 'youtube':
    text = templateYoutube % title
  elif mode.lower() == 'tiktok':
    text = templateTikTok % title
  else:
    print("ERROR: mode '%s' not available"%mode)
    exit()

  outname = texname+'.tex'
  if os.path.isfile(outname):
    print('WARNING: %s already exists... moving to %s.old'%(outname, outname))
    os.system('mv %s %s.old'%(outname, outname))
  with open(outname, 'w') as f:
    f.write(text)

  print('Nuevo guion: %s'%outname)
