## Plantillas de latex para guiones de YouTube, TikTok...

Descárgate el código:

    git clone https://github.com/CienciaXL/LatexScripts.git

Para instalar (de momento solo disponible en linux), ejecuta el script:

    python LatexScripts/LinuxInstall.py

Si quieres cambiar el logo del canal, substituye *myLogos/channelLogo.png* con el logo de tu canal y vuelve a ejecutar el instalador.

Para crear un nuevo guion, ejecuta:

    python LatexScripts/NewLatex.py -m youtube -o MiNuevoGuion -t "Esto es un nuevo titulo"

Todos los argumentos son opcionales. Por ahora, puedes elegir entre youtube y tiktok (youtube por defecto).
El nombre del canal, contacto, redes, etc se pueden cambiar al comienzo del script.

### Otros scripts

El script *Compila.py* sirve para compilar un .tex de manera limpia, guardando el resultado en una carpeta *pdf*. Se ejecuta con:

    python LatexScripts/Compila.py guion.tex

El script *ScriptToTeleprompt.py* sirve para crear un .txt con el texto fuera de un bloque de llaves, preparado para usar un teleprompter. Se ejectuta con:

    python LatexScripts/ScriptToTeleprompt.py guion.tex

### Contáctanos

Si quieres hacernos alguna pregunta o comentario, contáctanos a *cienciaxl@gmail.com* o en nuestras redes.
