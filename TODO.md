Resultados
(Si no pone nada en FD es A*)

M = Madagascar
- Sokoban
  - 0
    - M:
    - FF:
    - FD:
  - 1
    - M: 111.04 (1 sola caja)
    - FF: 
    - FD:
  - 2
    - M: 26.05 (1 sola)
    - FF: 
    - FD:
  - 3
    - M: 0.11 (todas)
    - FF: 
    - FD:
  - 4
    - M: 0.17 (todas)
    - FF:
    - FD:
- Butterflies
  - 0
    - M: No
    - FF: No
    - FD: 26.3114s (LAMA) 1.36175s (A*)
  - 1
    - M: 
    - FF: 
    - FD: 116.763s (A*)
  - 2
    - M: 
    - FF: 
    - FD: 77.3373s (A*)
  - 3
    - M: 
    - FF: 
    - FD: 26.8458s (A*)
  - 4
    - M:
    - FF:
    - FD: 1.12755s (A+)
- Boulderdash
  - 0
    - M:
    - FF:
    - FD:
  - 1
    - M: 
    - FF: 
    - FD:
  - 2
    - M: 
    - FF: 
    - FD:
  - 3
    - M: 
    - FF: 
    - FD:
  - 4
    - M:
    - FF:
    - FD:
- Zelda
  - 0
    - M:
    - FF:
    - FD: 0.0276586s
  - 1
    - M: 
    - FF: 
    - FD: 0.0815101s
  - 2
    - M: 
    - FF: 
    - FD: 0.0617192s
  - 3
    - M: 
    - FF: 
    - FD: 0.0354332s
  - 4
    - M: 9.15
    - FF:
    - FD: 0.0234705s
- Ice-and-fire
- 0
    - M: 136.00
    - FF: Sin memoria
    - FD: 0.0273426s
  - 1
    - M: 152.00
    - FF: Sin memoria
    - FD: 0.0274877s
  - 2
    - M: 396.73
    - FF: Sin memoria
    - FD: 0.0299897s
  - 3
    - M: 550.14
    - FF: Sin memoria
    - FD: 0.0302521s
  - 4
    - M: Timeout
    - FF: Sin memoria
    - FD: 0.0364139s
  
EN LA CARPETA VGDL ESTÁN
- GVGAI.TXT: Versión a usar en gvgai
- ??. txt: Versión para el parser
Si alguna vez se quisiera genera los problemas habría que tener en cuenta que no está floor

Boulderchase es boulderdash pero los enemigos persigue, quitarlo
Iceandfire sin chip
En butterflies para el dominio es solo búsqueda de caminos, pero como está la arquitectura de Vladis se generan nuevos enemigos

En boulderdash las rocas tienen is-boulder (para los movimientos) y at (para la interacción con sword)

Añadidos nuevos juegos hasta crossfire

TO DO:
VGDL descriptions
- Objetos con los que no superponerse ahora tiene stepback
- Retocar Zelda VGDL ✅
- A lo mejor interesa retocar todos los VGDL para que haya un formato concreto (sin floor, wall siempre es muro, stepback para las colisiones...) ✅
  - Retocar los existentes para adaptarlos a la arquitectura
    - Quitar objetos innecesarios
    - Quitar jerarquía innecesaria
  - La arquitectura debe leer la versión simplificada, pero GVGAI debería poder seguir usando la suya

Domains
- El (not exists) de end_turn_interaction debe ser por cada par de objetos con interacciones ✅
- Añadir orientation a moves ✅
- Añadir tipo num ✅
- Quitar tipo cell ✅
- Quitar last-at ✅
- Quitar step-back. Cada stepback se añade como (is-...), no puede colisionar en action moves
  - Lo mismo con killsprite
- Quitar los action NIL en los que no haya enemigos ni objetos
- Quitar acciones que implican solo objetos reactivos (npcs)
- Alterar orden sprite -> interactions por interactions -> sprite ✅
- (at ?cell) -> (at ?x ?y - num) ✅
- Predicados (next ) y (previous) ✅
- Reducir efectos innecesarios en acciones (turn-sprites en avatar_action por ej) ✅
- Añadir a ACTION_ new_x o new_y ✅
- Cambiar ?x representando objeto por ?o, en interacciones por ?o1 y ?o2. Dejar ?x e ?y para coordenadas ✅
- ¿¿ Quitar interacciones innecesarias (ver cuáles) ??
- Quitar objeto wall ?? 
  - O quitar todo objeto con stepback/killsprite
  - O leerlo y añadirlo al movimiento ✅
    - __NOTA__: Todo objeto con stepback con el avatar debe tener predicado (is- nx ny). Si no tiene ninguna utilidad más no incluírlo
      - idem. con killsprite
- Una vez terminado: Quitar comentarios # DONE

Config
- Que no se incluyan:
  - turn-sprites ✅
  - turn-interactions ✅
  - got-resource (Parece que es cosa de la arquitectura de Vladis)
- El límite viene incluído en VGDL
- Si se deja resource como números, incluir (got-resource-... n0)

<!-- - cellVariable -> numVariable (El prefijo) -->
- cellVariable fuera
- connections fuera
- 


Problems
- Incluir oriented (ahora mismo no sale)
- Quitar los floor y background
- Toda casilla que no tenga nada encima no incluirla como floor ni background
- Quitar los cell
- Quitar los wall, sustituir por (is-wall)
- Quitar objetos extra (diamantes, misiles) y solo añadir 1
- Incluir N instancias num por el máximo de las coordenadas del nivel (n0 n1 ... - num)
  - Predicados (next ) (previous ) con estas instancias
  - En boulderdash hace falta (got-resource n0), mirar si añadirlo a todos los juegos
  - (at nx ny )
  - (is-... nx ny)

---

?? Si uno de los objetos implicados es reactivo, quitarlo? (siempre que no sea kill.., para los clone por ejemplo)

Niveles vladis (pruebas rápidas, poco tiempo):
Ejecuciones con MpC
- Sokoban
  - 0   No resuelve
  - 1   60p, 8.17s
  - 2   53p, 1.80s
  - 3   27p, 0.17s
  - 4   37p, 0.17s
- Ice-and-fire (sin monedas)
  - 0   125p, 16.81s
  - 1   65p, 0.17s
  - 2   259p, 31.49s
  - 3   139p, 16.63s
  - 4   253p, 17.66s (Con ayuda)
- Zelda (hay que redefinir el VGDL, pero debería poderse)
  (Se le ha puesto una pequeña ayuda en el goal, en vez de object-dead a secas, también un at y un got-resource)
(Con posibilidad de usar sword tarda mucho, sino va bien)
  - 0   70p, 64.27s
  - 1   No resuelve
  - 2   No resuelve
  - 3   147p, 153.12s
  - 4   167p, 97.97s
- Butterflies (es reactivo por lo que se deberían ir generando más butterflies)
(resultados con y sin quitar las acciones de lo que no interesa)
  - 0   106p, 40.57s / 53.56s
  - 1   250p, 511.95s / 443.96s
  - 2   114p, 37.89s
  - 3   128p, 67.02s / 57.27s
  - 4   79p, 29.60s / 36.68s
- Boulderdash (reduciendo el tamaño y/o bajando nº gemas necesarias)
(Sin ir a la puerta va bien, conseguir gemas las consigue)
(Dividiendo quizás en dos ejecuciones?)
(Como en zelda, hay que cambiar orden sprites-interactions)
Resultados de coger 5 gemas
  - 6   100p, 3.07s
  - 9   109p, 26.44s
  - 14   33p, 1.56s
  - 16   No resuelve (4 diamantes cerca, + de 1 lejos)
  - 20   83p, 8.55s
- Brainman
(Rocas que se mueven (a lo Sokoban) y llave a la que empujar, sin gemas)
(puede dar fallo al empujar una gema hacia un muro colindante)
# (No sé muy bien como generar este dominio automáticamente, pero se resuelve)
(Destruir puertas con las llaves lo hace bien, más allá ni idea)
  - 0   
  - 1   
  - 2   
  - 3   
  - 4   

---------------------------------

Es probable que todos se vuelvan viables controlando un poco los tamaños, se podría justificar bien siempre y cuando sean medianamente grandes. Recordad que también contaríamos con la parte de Vladis para defender el paper.
Juegos que funcionan (tiempo Madagascar MpC):
- Sokoban: uno sí, falta regenerar niveles para probar
- Butterflies (faltan añadir objetos de más para el clone, pero el juego es reactivo así que no va a haber problema)
  - 52s, 542s
- Iceandfire (mejor dividir en subobjetivos: got-resource..., con objetivo completo no resuelve)
- Boulderdash: Nivel normal entero NO. 
- Boulderdash simplificado: No dirt, sin diamantes adicionales, sin enemigos, uso de pala. 
Problema con Interacción salida, muchos objetos implicados. Reduciendo a 3 y 13 en el dominio ya sale 1.5 millones de ground actions. Reducir a niveles 13x13 estaría bien. Habría que indicar en el paper las limitaciones de la planificación al usar muchos objetos.

Se puede usar falsos fluents (los definidos para las celdas) para representar el objetivo con ellos, se reduce mucho la complejidad y podría resolver más fácil (coger gemas coge)
- Zelda

1. Celdas fuera
2. Nueva clase "num" con instancias de 0 al max(nº filas, nº columnas) del nivel
3. En vez de (at c_2_4 ?objeto), pasar a (at c2 c4 ?objeto)
4. Nuevos predicados (next ?num ?num) y (previous ...) para indicar qué nº va detrás de cuál
5. Muros fuera, poner predicado (is-wall ?num ?num)
6. (last-at ...) fuera


Quitar las casillas de celda, añadir conectividad usando números pero no numérica (clase number, predicado (at 1 2)) (se deberían reducir celdas a la mitad)

- Se añaden números
- Se añaden predicados next y previous de números
- Se quitan muros, se añaden como predicado
