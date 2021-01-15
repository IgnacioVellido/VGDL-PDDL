(define (domain VGDLGame)  
	(:requirements
		:adl
		:negative-preconditions
	)

	(:types
        cell
        avatar - Object

        ; Objetos del juego aquí
        ; background 
		wall - Object
		sword - Object
		dirt - Object
		exitdoor - Object
		diamond - Object
		boulder - Object
		crab - Object
		butterfly - Object
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