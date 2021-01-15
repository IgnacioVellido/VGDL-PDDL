(define (domain VGDLGame)  
	(:requirements
		:adl
		:negative-preconditions
	)

	(:types
		Object
        cell
        avatar

        ; Objetos del juego aquí, opciones:
		; - Manualmente
        ; - Leer objetos left-most objects en descripción VGDL
        ; - Añadir objetos devueltos por GVGAI
	)

    (:predicates
        ; Orientaciones
        (oriented-up ?o - Object)
		(oriented-down ?o - Object)
		(oriented-left ?o - Object)
		(oriented-right ?o - Object)
		(oriented-none ?o - Object)
		
		; Conexiones entre celdas
		(connected-up ?c1 ?c2 - cell)
		(connected-down ?c1 ?c2 - cell)
		(connected-right ?c1 ?c2 - cell)
		(connected-left ?c1 ?c2 - cell)

        ; Posición
		(at ?c - cell ?o - Object)
    )

    (:action DO_NOTHING
        :parameters ()
        :precondition (and )
        :effect (and )
    )
)