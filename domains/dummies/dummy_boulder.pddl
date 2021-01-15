(define (domain VGDLGame)  
	(:requirements
		:adl
		:negative-preconditions
	)

	(:types
		num
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
		
        ; Conexiones
		(next ?x ?y - num)
		(previous ?x ?y - num)

        ; Posición
		(at ?x ?y - num ?o - Object)
    )

    (:action DO_NOTHING
        :parameters ()
        :precondition (and )
        :effect (and )
    )
)