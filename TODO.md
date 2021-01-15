TO DO:
VGDL descriptions
- Objetos con los que no superponerse ahora tiene stepback
- Retocar Zelda VGDL ✅
- A lo mejor interesa retocar todos los VGDL para que haya un formato concreto (sin floor, wall siempre es muro, stepback para las colisiones...)
```
- Retocar los existentes para adaptarlos a la arquitectura
  - Quitar objetos innecesarios
  - Quitar jerarquía innecesaria
(La arquitectura debe leer de la carpeta Simplified, pero GVGAI debería poder seguir usando la suya)
```

Domains
- Añadir tipo num
- Quitar tipo cell
- Quitar last-at
- Quitar step-back. Cada stepback se añade como (is-...), no puede colisionar en action moves
- Quitar los action NIL en los que no haya enemigos ni objetos
- Quitar acciones que implican objetos reactivos (npcs)
- Alterar orden sprite -> interactions por interactions -> sprite
- (at ?cell) -> (at ?x ?y - num)
- Predicados (next ) y (previous)
- Reducir efectos innecesarios en acciones (turn-sprites en avatar_action por ej)
- Añadir a ACTION_ new_x o new_y
- Cambiar ?x representando objeto por ?o, en interacciones por ?o1 y ?o2. Dejar ?x e ?y para coordenadas
- ¿¿ Quitar interacciones innecesarias (ver cuáles) ??

Config
- Que no se incluyan:
  - turn-sprites ✅
  - turn-interactions ✅
  - got-resource (Parece que es cosa de la arquitectura de Vladis)


Problems
- Incluir oriented (ahora mismo no sale)
- Quitar los floor y background
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