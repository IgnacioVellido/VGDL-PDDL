;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; PDDL domain for a VGDL game
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain VGDLGame)  
	(:requirements
		:adl
		:negative-preconditions
	)

	; Types ---------------------------------------------------------------------

	(:types
		num
		water - Immovable
		catapult - Immovable
		southfacing - catapult
		northfacing - catapult
		eastfacing - catapult
		westfacing - catapult

		avatar - moving

		north - bullet
		south - bullet
		east - bullet
		west - bullet
		goal - Immovable
		
		avatarStype Immovable bullet moving - Object
	)


	; Predicates ----------------------------------------------------------------

	(:predicates
		(oriented-up ?o - Object)
		(oriented-down ?o - Object)
		(oriented-left ?o - Object)
		(oriented-right ?o - Object)
		(oriented-none ?o - Object)
		; To maintain order
		(turn-avatar)
		(turn-sprites)
		(turn-interactions)
		; For tile connections
		(at ?x ?y - num ?o - Object)
		
		(turn-bullet-move)
		(bullet-moved ?o - bullet)
		(is-wall ?x ?y - num)
		(is-water ?x ?y - num)
		(next ?x ?y - num)
		(previous ?x ?y - num)
		(object-dead ?o - Object)
		(finished-turn-bullet-move)
		(hola)
	)
  
	; Actions -------------------------------------------------------------------
  
	(:action AVATAR_ACTION_MOVE_UP
		:parameters (?a - avatar ?x ?y - num ?new_y - num)
		:precondition (and
						(turn-avatar)
						(or (oriented-up ?a) (oriented-none ?a))
						(at ?x ?y ?a)
						
						(not (is-wall ?x ?new_y))
						(not (is-water ?x ?new_y))
						(previous ?y ?new_y)
					)
		:effect (and
					
					
					(not (at ?x ?y ?a))
					(at ?x ?new_y ?a)
					(not (turn-avatar))
					(turn-sprites)
				)
	)

	(:action AVATAR_ACTION_MOVE_DOWN
		:parameters (?a - avatar ?x ?y - num ?new_y - num)
		:precondition (and
						(turn-avatar)
						(or (oriented-down ?a) (oriented-none ?a))
						(at ?x ?y ?a)
						
						(not (is-wall ?x ?new_y))
						(not (is-water ?x ?new_y))
						(next ?y ?new_y)	
					)
		:effect (and
					
					
					(not (at ?x ?y ?a))
					(at ?x ?new_y ?a)
					(not (turn-avatar))
					(turn-sprites)
				)
	)

	(:action AVATAR_ACTION_MOVE_LEFT
		:parameters (?a - avatar ?x ?y - num ?new_x - num)
		:precondition (and
						(turn-avatar)
						(or (oriented-left ?a) (oriented-none ?a))
						(at ?x ?y ?a)
						
						(not (is-wall ?new_x ?y))
						(not (is-water ?new_x ?y))
						(previous ?x ?new_x)
					)
		:effect (and
					
					
					(not (at ?x ?y ?a))
					(at ?new_x ?y ?a)
					(not (turn-avatar))
					(turn-sprites)
				)
	)

	(:action AVATAR_ACTION_MOVE_RIGHT
		:parameters (?a - avatar ?x ?y - num ?new_x - num)
		:precondition (and
						(turn-avatar)
						(or (oriented-right ?a) (oriented-none ?a))
						(at ?x ?y ?a)
						
						(not (is-wall ?new_x ?y))
						(not (is-water ?new_x ?y))
						(next ?x ?new_x)
					)
		:effect (and
					
					
					(not (at ?x ?y ?a))
					(at ?new_x ?y ?a)
					(not (turn-avatar))
					(turn-sprites)
				)
	)

	; (:action AVATAR_ACTION_NIL
	; 	:parameters (?a - avatar)
	; 	:precondition (and
	; 					(turn-avatar)
	; 				)
	; 	:effect (and
	; 				(not (turn-avatar))
	; 				(turn-sprites)
	; 			)
	; )

	; NO ESTÁ BIEN, HACE FALTA LA POSICIÓN ANTERIOR
	(:action BULLET_WALL_TRANSFORMTO
		:parameters (?o1 - bullet ?o2 - Immovable ?z - avatar ?x ?y - num); ?prev_x ?prev_y ?next_x ?next_y - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						(object-dead ?z)

						; (next ?x ?next_x)
						; (next ?y ?next_y)
						; (previous ?x ?prev_x)
						; (previous ?y ?prev_y)
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
					
					(not (object-dead ?z))
					(at ?x ?y ?z)					

					; (when
                    ;     (oriented-up ?o2)
                    ;     ; (oriented-up ?z)
					; 	(at ?x ?next_y)
                    ; )
                    ; (when
                    ;     (oriented-down ?o2)
                    ;     (at ?x ?prev_y)
                    ; )
                    ; (when
                    ;     (oriented-left ?o2)
                    ;     (at ?next_x ?y)
                    ; )
                    ; (when
                    ;     (oriented-right ?o2)
                    ;     (at ?prev_x ?y)
                    ; )

					(oriented-none ?z)
					(hola)
				)
	)

	(:action bullet_MOVE_UP
		:parameters (?o - bullet ?x ?y - num ?new_y - num)
		:precondition (and
						(turn-bullet-move)
						(oriented-up ?o)
						(at ?x ?y ?o)
						(previous ?y ?new_y)
					)
		:effect (and
					(not (at ?x ?y ?o))
					(bullet-moved ?o)

					(when (is-wall ?x ?new_y) (hola))
					(when (not(is-wall ?x ?new_y) (at ?x ?new_y ?o))
				)
	)

	(:action bullet_MOVE_DOWN
		:parameters (?o - bullet ?x ?y - num ?new_y - num)
		:precondition (and
						(turn-bullet-move)
						(oriented-down ?o)
						(at ?x ?y ?o)
						(next ?y ?new_y)
					)
		:effect (and
					(not (at ?x ?y ?o))
					(at ?x ?new_y ?o)
					(bullet-moved ?o)
				)
	)

	(:action bullet_MOVE_LEFT
		:parameters (?o - bullet ?x ?y - num ?new_x - num)
		:precondition (and
						(turn-bullet-move)
						(oriented-left ?o)
						(at ?x ?y ?o)
						(previous ?x ?new_x)
					)
		:effect (and
					(not (at ?x ?y ?o))
					(at ?new_x ?y ?o)
					(bullet-moved ?o)
				)
	)

	(:action bullet_MOVE_RIGHT
		:parameters (?o - bullet ?x ?y - num ?new_x - num)
		:precondition (and
						(turn-bullet-move)
						(oriented-right ?o)
						(at ?x ?y ?o)
						(next ?x ?new_x)
					)
		:effect (and
					(not (at ?x ?y ?o))
					(at ?new_x ?y ?o)
					(bullet-moved ?o)
				)
	)

	(:action STOP_bullet_MOVE
		:parameters ()
		:precondition (and
						(turn-bullet-move)
						(forall (?o - bullet) (or (object-dead ?o) (bullet-moved ?o)))
					)
		:effect (and
					(forall (?o - bullet) (not (bullet-moved ?o)))
					(not (turn-bullet-move))
					(finished-turn-bullet-move)
				)
	)

	(:action AVATAR_WESTFACING_TRANSFORMTO
		:parameters (?o1 - avatar ?o2 - westfacing ?z - west ?x ?y - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						(object-dead ?z)
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
					(at ?x ?y ?z)
					
					(not (object-dead ?z))
					(oriented-left ?z)
					; (when
                    ;     (oriented-up ?o2)
                    ;     (oriented-up ?z)
                    ; )
                    ; (when
                    ;     (oriented-down ?o2)
                    ;     (oriented-down ?z)
                    ; )
                    ; (when
                    ;     (oriented-left ?o2)
                    ;     (oriented-left ?z)
                    ; )
                    ; (when
                    ;     (oriented-right ?o2)
                    ;     (oriented-right ?z)
                    ; )
            (not (at ?x ?y ?o2))
					(object-dead ?o2)
				)
	)

	(:action AVATAR_EASTFACING_TRANSFORMTO
		:parameters (?o1 - avatar ?o2 - eastfacing ?z - east ?x ?y - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						(object-dead ?z)
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
					(at ?x ?y ?z)
					
					(not (object-dead ?z))
					(oriented-right ?z)
					; (when
                    ;     (oriented-up ?o2)
                    ;     (oriented-up ?z)
                    ; )
                    ; (when
                    ;     (oriented-down ?o2)
                    ;     (oriented-down ?z)
                    ; )
                    ; (when
                    ;     (oriented-left ?o2)
                    ;     (oriented-left ?z)
                    ; )
                    ; (when
                    ;     (oriented-right ?o2)
                    ;     (oriented-right ?z)
                    ; )
            (not (at ?x ?y ?o2))
					(object-dead ?o2)
				)
	)

	(:action AVATAR_SOUTHFACING_TRANSFORMTO
		:parameters (?o1 - avatar ?o2 - southfacing ?z - south ?x ?y - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						(object-dead ?z)
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
					(at ?x ?y ?z)
					
					(not (object-dead ?z))
					(oriented-down ?z)

					(not (at ?x ?y ?o2))
					(object-dead ?o2)
					; (when
                    ;     (oriented-up ?o2)
                    ;     (oriented-up ?z)
                    ; )
                    ; (when
                    ;     (oriented-down ?o2)
                    ;     (oriented-down ?z)
                    ; )
                    ; (when
                    ;     (oriented-left ?o2)
                    ;     (oriented-left ?z)
                    ; )
                    ; (when
                    ;     (oriented-right ?o2)
                    ;     (oriented-right ?z)
                    ; )
            
				)
	)

	(:action AVATAR_NORTHFACING_TRANSFORMTO
		:parameters (?o1 - avatar ?o2 - northfacing ?z - north ?x ?y - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						(object-dead ?z)
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
					(at ?x ?y ?z)
					
					(not (object-dead ?z))
					(oriented-up ?z)

					(not (at ?x ?y ?o2))
					(object-dead ?o2)
					; (when
                    ;     (oriented-up ?o2)
                    ;     (oriented-up ?z)
                    ; )
                    ; (when
                    ;     (oriented-down ?o2)
                    ;     (oriented-down ?z)
                    ; )
                    ; (when
                    ;     (oriented-left ?o2)
                    ;     (oriented-left ?z)
                    ; )
                    ; (when
                    ;     (oriented-right ?o2)
                    ;     (oriented-right ?z)
                    ; )
            
				)
	)

	; (:action CATAPULT_AVATAR_KILLSPRITE
	; 	:parameters (?o1 - catapult ?o2 - avatar ?x ?y - num)
	; 	:precondition (and
	; 					(turn-interactions)
	; 					(not (= ?o1 ?o2))
	; 					(at ?x ?y ?o1)
	; 					(at ?x ?y ?o2)
	; 				)
	; 	:effect (and
	; 				(not (at ?x ?y ?o1))
	; 				(object-dead ?o1)
	; 			)
	; )

	(:action GOAL_AVATAR_KILLSPRITE
		:parameters (?o1 - goal ?o2 - avatar ?x ?y - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
				)
	)

	(:action END-TURN-INTERACTIONS
		:parameters ()
		:precondition (and
						(turn-interactions)
						(not 
				(exists (?o1 - Object ?o2 - Object ?x ?y - num) 
					(and
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
					)
				)
			)
					)
		:effect (and
					; Restart turn
					(turn-avatar)
					(not (turn-sprites))
					(not (turn-interactions))
				)
	)

	(:action TURN-SPRITES
		:parameters ()
		:precondition (and
						(turn-sprites)
					)
		:effect (and
					(turn-bullet-move)
					(not (turn-sprites))
				)
	)

	(:action END-TURN-SPRITES
		:parameters ()
		:precondition (and
						(finished-turn-bullet-move)
					)
		:effect (and
					(not (finished-turn-bullet-move))
					(turn-interactions)
				)
	)


)
