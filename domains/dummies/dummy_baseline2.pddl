(define (domain VGDLGame)  
	(:requirements
		:adl
		:negative-preconditions
	)

	(:types
		Object
        num
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