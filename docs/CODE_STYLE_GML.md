# CODE STYLE GML

Este proyecto no usa Prettier. El estilo se valida con reglas simples y consistentes para GameMaker Language.

## Reglas

1. Indentacion con tabulaciones, no espacios al inicio de linea.
2. No dejar espacios al final de linea.
3. Usar saltos de linea LF.
4. Mantener comentarios claros y breves en espanol.
5. Evitar bloques demasiado grandes: preferir funciones pequenas y enfocadas.

## Convenciones recomendadas

1. Variables temporales con prefijo _ (por ejemplo: _enemy, _map).
2. Nombres descriptivos para funciones y eventos.
3. Colocar una linea en blanco entre bloques logicos.
4. Evitar magia numerica cuando aplique: agregar comentario corto o constante.

## Verificacion

Ejecuta la tarea de VS Code llamada GML Style Check.

Esta tarea revisa todos los archivos .gml y marca:

1. Espacios al final de linea.
2. Saltos de linea CRLF.
3. Indentacion inicial con espacios.
