
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
		avatar - OrientedAvatar
		; gem - Immovable
		; green - gem
		; red - gem
		; blue - gem
		key - key
		keym - Missile
		exit - Immovable
		door - Immovable
		boulder - Passive
		wall - Passive
		
		key Immovable Missile Passive OrientedAvatar - Object
	)

	; Predicates ----------------------------------------------------------------

	(:predicates
		(oriented-up ?o - Object)
		(oriented-down ?o - Object)
		(oriented-left ?o - Object)
		(oriented-right ?o - Object)
		(oriented-none ?o - Object)
		(keym-moved ?o1 - Missile)
		(turn-keym-move)
		(finished-turn-keym-move)
		; To maintain order
		(turn-avatar)
		(turn-sprites)
		(turn-interactions)
		; For tile connections
		(at ?x ?y - num ?o - Object)
		(object-dead ?o - Object)

		; MODIFICATION
		(is-wall ?x ?y - num)
		(is-door ?x ?y - num)
		; (is-boulder ?x ?y - num)
		(next ?x ?y - num)
		(previous ?x ?y - num)
	)
  
	; Actions -------------------------------------------------------------------
  
	(:action AVATAR_ACTION_MOVE_UP
		:parameters (?a - OrientedAvatar ?x - num ?y - num ?new_y - num)
		:precondition (and
						(turn-avatar)
						(or (oriented-up ?a) (oriented-none ?a))
						(at ?x ?y ?a)

						; MODIFICATION
						(not (is-wall ?x ?new_y))
						(not (is-door ?x ?new_y))
						(previous ?y ?new_y)
					)
		:effect (and
					; (not (last-at ?x ?old_y ?a))
					; (last-at ?x ?y ?a)
					(not (at ?x ?y ?a))
					(at ?x ?new_y ?a)
					(not (turn-avatar))
					; (turn-sprites)
					(not (turn-sprites))
					(turn-interactions)
				)
	)

	(:action AVATAR_ACTION_MOVE_DOWN
		:parameters (?a - OrientedAvatar ?x - num ?y - num ?new_y - num)
		:precondition (and
						(turn-avatar)
						(or (oriented-down ?a) (oriented-none ?a))
						(at ?x ?y ?a)
						(not (is-wall ?x ?new_y))
						(not (is-door ?x ?new_y))
						(next ?y ?new_y)
					)
		:effect (and
					; (not (last-at ?c_last ?a))
					; (last-at ?c ?a)
					(not (at ?x ?y ?a))
					(at ?x ?new_y ?a)
					(not (turn-avatar))
					; (turn-sprites)
					(not (turn-sprites))
					(turn-interactions)
				)
	)

	(:action AVATAR_ACTION_MOVE_LEFT
		:parameters (?a - avatar ?x - num ?y - num ?new_x - num)
		:precondition (and
						(turn-avatar)
						(or (oriented-left ?a) (oriented-none ?a))
						(at ?x ?y ?a)
						; (last-at ?c_last ?a)
						; (previous ?x ?new_x)

						; MODIFICATION
						(not (is-wall ?new_x ?y))
						(not (is-door ?new_x ?y))
						(previous ?x ?new_x)
					)
		:effect (and
					; (not (last-at ?c_last ?a))
					; (last-at ?c ?a)
					(not (at ?x ?y ?a))
					(at ?new_x ?y ?a)

					(not (turn-avatar))
					; (turn-sprites)
					(not (turn-sprites))
					(turn-interactions)
				)
	)

	(:action AVATAR_ACTION_MOVE_RIGHT
		:parameters (?a - OrientedAvatar ?x - num ?y - num ?new_x - num)
		:precondition (and
						(turn-avatar)
						(or (oriented-right ?a) (oriented-none ?a))
						(at ?x ?y ?a)
						; (last-at ?c_last ?a)
						; (next ?x ?new_x)

						; MODIFICATION
						(not (is-wall ?new_x ?y))
						(not (is-door ?new_x ?y))
						(next ?x ?new_x)
					)
		:effect (and
					; (not (last-at ?c_last ?a))
					; (last-at ?c ?a)
					(not (at ?x ?y ?a))
					(at ?new_x ?y ?a)

					(not (turn-avatar))
					(not (turn-sprites))
					; (turn-sprites)
					(turn-interactions)
				)
	)

	(:action AVATAR_ACTION_TURN_UP
		:parameters (?a - OrientedAvatar)
		:precondition (and
						(turn-avatar)
						(not (oriented-up ?a))
					)
		:effect (and
					
                    (when
                        (oriented-down ?a )
                        (not (oriented-down ?a))
                    )
					
                    (when
                        (oriented-right ?a )
                        (not (oriented-right ?a))
                    )
					
                    (when
                        (oriented-left ?a )
                        (not (oriented-left ?a))
                    )
					(oriented-up ?a)
					(not (turn-avatar))
					; (turn-sprites)
					(not (turn-sprites))
					(turn-interactions)
				)
	)

	(:action AVATAR_ACTION_TURN_DOWN
		:parameters (?a - OrientedAvatar)
		:precondition (and
						(turn-avatar)
						(not (oriented-down ?a))
					)
		:effect (and
					
                    (when
                        (oriented-left ?a )
                        (not (oriented-left ?a))
                    )
					
                    (when
                        (oriented-right ?a )
                        (not (oriented-right ?a))
                    )
					
                    (when
                        (oriented-up ?a )
                        (not (oriented-up ?a))
                    )
					(oriented-down ?a)
					(not (turn-avatar))
					; (turn-sprites)
					(not (turn-sprites))
					(turn-interactions)
				)
	)

	(:action AVATAR_ACTION_TURN_LEFT
		:parameters (?a - OrientedAvatar)
		:precondition (and
						(turn-avatar)
						(not (oriented-left ?a))
					)
		:effect (and
					
                    (when
                        (oriented-down ?a )
                        (not (oriented-down ?a))
                    )
					
                    (when
                        (oriented-right ?a )
                        (not (oriented-right ?a))
                    )
					
                    (when
                        (oriented-up ?a )
                        (not (oriented-up ?a))
                    )
					(oriented-left ?a)
					(not (turn-avatar))
					; (turn-sprites)
					(not (turn-sprites))
					(turn-interactions)
				)
	)

	(:action AVATAR_ACTION_TURN_RIGHT
		:parameters (?a - OrientedAvatar)
		:precondition (and
						(turn-avatar)
						(not (oriented-right ?a))
					)
		:effect (and
					
                    (when
                        (oriented-down ?a )
                        (not (oriented-down ?a))
                    )
					
                    (when
                        (oriented-left ?a )
                        (not (oriented-left ?a))
                    )
					
                    (when
                        (oriented-up ?a )
                        (not (oriented-up ?a))
                    )
					(oriented-right ?a)
					(not (turn-avatar))
					; (turn-sprites)
					(not (turn-sprites))
					(turn-interactions)
				)
	)

	(:action AVATAR_ACTION_NIL
		:parameters (?a - OrientedAvatar)
		:precondition (and
						(turn-avatar)
					)
		:effect (and
					(not (turn-avatar))
					; (turn-sprites)
					(not (turn-sprites))
					(turn-interactions)
				)
	)

	; -----------------------------------------------------------

	(:action KEYM_MOVE_UP
		:parameters (?o1 - keym ?x ?y - num ?new_y - num)
		:precondition (and
						(turn-keym-move)
						(not (keym-moved ?o1))
						(oriented-up ?o1)
						(at ?x ?y ?o1)
						(previous ?y ?new_y)
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(at ?x ?new_y ?o1)
					(keym-moved ?o1)
				)
	)

	(:action KEYM_MOVE_DOWN
		:parameters (?o1 - keym ?x ?y - num ?new_y - num)
		:precondition (and
						(turn-keym-move)
						(not (keym-moved ?o1))
						(oriented-down ?o1)
						(at ?x ?y ?o1)
						(next ?y ?new_y)						
					)
		:effect (and
					
					
					(not (at ?x ?y ?o1))
					(at ?x ?new_y ?o1)
					(keym-moved ?o1)
				)
	)

	(:action KEYM_MOVE_LEFT
		:parameters (?o1 - keym ?x ?y - num ?new_x - num)
		:precondition (and
						(turn-keym-move)
						(not (keym-moved ?o1))
						(oriented-left ?o1)
						(at ?x ?y ?o1)
						
						(previous ?x ?new_x)
					)
		:effect (and
					
					
					(not (at ?x ?y ?o1))
					(at ?new_x ?y ?o1)
					(keym-moved ?o1)
				)
	)

	(:action KEYM_MOVE_RIGHT
		:parameters (?o1 - keym ?x ?y - num ?new_x - num)
		:precondition (and
						(turn-keym-move)
						(not (keym-moved ?o1))
						(oriented-right ?o1)
						(at ?x ?y ?o1)
						
						(next ?x ?new_x)
					)
		:effect (and
					
					
					(not (at ?x ?y ?o1))
					(at ?new_x ?y ?o1)
					(keym-moved ?o1)
				)
	)

	(:action STOP_KEYM_MOVE
		:parameters ()
		:precondition (and
						(turn-keym-move)
						(forall (?o - keym) (or (object-dead ?o) (keym-moved ?o)))
					)
		:effect (and
					(forall (?o - keym) (not (keym-moved ?o)))
					(not (turn-keym-move))
					(finished-turn-keym-move)
				)
	)

	; (:action KEYM_KEY_TRANSFORMTO
	; 	:parameters (?o1 - keym ?o2 - key ?z - key ?x ?y - num)
	; 	:precondition (and
	; 					(turn-interactions)
	; 					(not (= ?o1 ?o2))
	; 					(at ?x ?y ?o1)
	; 					(at ?x ?y ?o2)
	; 					(object-dead ?z)
	; 				)
	; 	:effect (and
	; 				(not (at ?x ?y ?o1))
	; 				(object-dead ?o1)
	; 				(at ?x ?y ?z)
	; 				(not (object-dead ?z))
	; 				; (when
    ;                 ;     (oriented-up ?o2)
    ;                 ;     (oriented-up ?z)
    ;                 ; )
    ;                 ; (when
    ;                 ;     (oriented-down ?o2)
    ;                 ;     (oriented-down ?z)
    ;                 ; )
    ;                 ; (when
    ;                 ;     (oriented-left ?o2)
    ;                 ;     (oriented-left ?z)
    ;                 ; )
    ;                 ; (when
    ;                 ;     (oriented-right ?o2)
    ;                 ;     (oriented-right ?z)
    ;                 ; )
            
	; 			)
	; )

	; (:action KEYM_WALL_TRANSFORMTO
	; 	:parameters (?o1 - keym ?o2 - Immovable ?z - key ?x ?y - num)
	; 	:precondition (and
	; 					(turn-interactions)
	; 					(not (= ?o1 ?o2))
	; 					(at ?x ?y ?o1)
	; 					(at ?x ?y ?o2)
	; 					(object-dead ?z)
	; 				)
	; 	:effect (and
	; 				(not (at ?x ?y ?o1))
	; 				(object-dead ?o1)
	; 				(at ?x ?y ?z)
					
	; 				(not (object-dead ?z))
	; 				; (when
    ;                 ;     (oriented-up ?o2)
    ;                 ;     (oriented-up ?z)
    ;                 ; )
    ;                 ; (when
    ;                 ;     (oriented-down ?o2)
    ;                 ;     (oriented-down ?z)
    ;                 ; )
    ;                 ; (when
    ;                 ;     (oriented-left ?o2)
    ;                 ;     (oriented-left ?z)
    ;                 ; )
    ;                 ; (when
    ;                 ;     (oriented-right ?o2)
    ;                 ;     (oriented-right ?z)
    ;                 ; )
            
	; 			)
	; )

	; (:action KEYM_GEM_TRANSFORMTO
	; 	:parameters (?o1 - keym ?o2 - Immovable ?z - key ?x ?y - num)
	; 	:precondition (and
	; 					(turn-interactions)
	; 					(not (= ?o1 ?o2))
	; 					(at ?x ?y ?o1)
	; 					(at ?x ?y ?o2)
	; 					(object-dead ?z)
	; 				)
	; 	:effect (and
	; 				(not (at ?x ?y ?o1))
	; 				(object-dead ?o1)
	; 				(at ?c ?z)
					
	; 				(not (object-dead ?z))
	; 				(when
    ;                     (oriented-up ?o2)
    ;                     (oriented-up ?z)
    ;                 )
    ;                 (when
    ;                     (oriented-down ?o2)
    ;                     (oriented-down ?z)
    ;                 )
    ;                 (when
    ;                     (oriented-left ?o2)
    ;                     (oriented-left ?z)
    ;                 )
    ;                 (when
    ;                     (oriented-right ?o2)
    ;                     (oriented-right ?z)
    ;                 )
            
	; 			)
	; )

	; (:action KEYM_BOULDER_TRANSFORMTO
	; 	:parameters (?o1 - keym ?o2 - Passive ?z - key ?x ?y - num)
	; 	:precondition (and
	; 					(turn-interactions)
	; 					(not (= ?o1 ?o2))
	; 					(at ?x ?y ?o1)
	; 					(at ?x ?y ?o2)
	; 					(object-dead ?z)
	; 				)
	; 	:effect (and
	; 				(not (at ?x ?y ?o1))
	; 				(object-dead ?o1)
	; 				(at ?x ?y ?z)
					
	; 				(not (object-dead ?z))
	; 				; (when
    ;                 ;     (oriented-up ?o2)
    ;                 ;     (oriented-up ?z)
    ;                 ; )
    ;                 ; (when
    ;                 ;     (oriented-down ?o2)
    ;                 ;     (oriented-down ?z)
    ;                 ; )
    ;                 ; (when
    ;                 ;     (oriented-left ?o2)
    ;                 ;     (oriented-left ?z)
    ;                 ; )
    ;                 ; (when
    ;                 ;     (oriented-right ?o2)
    ;                 ;     (oriented-right ?z)
    ;                 ; )
            
	; 			)
	; )

	(:action KEYM_PASSIVE_TRANSFORMTO_UP
		; :parameters (?o1 - keym ?o2 - Passive ?z - key ?x ?y ?new_y - num)
		:parameters (?o1 - keym ?z - key ?x ?y ?new_y - num)
		:precondition (and
						(turn-interactions)
						; (not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						; (at ?x ?y ?o2)
						(is-wall ?x ?y)
						(object-dead ?z)

						(oriented-up ?o1)
						; Volvemos atrás, así que al revés
						(next ?y ?new_y)
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
					(at ?x ?new_y ?z)
					
					(not (object-dead ?z))			
				)
	)

	(:action KEYM_PASSIVE_TRANSFORMTO_DOWN
		; :parameters (?o1 - keym ?o2 - Passive ?z - key ?x ?y ?new_y - num)
		:parameters (?o1 - keym ?z - key ?x ?y ?new_y - num)
		:precondition (and
						(turn-interactions)
						; (not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						; (at ?x ?y ?o2)
						(is-wall ?x ?y)
						(object-dead ?z)

						(oriented-down ?o1)
						; Volvemos atrás, así que al revés
						(previous ?y ?new_y)
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
					(at ?x ?new_y ?z)
					
					(not (object-dead ?z))					
				)
	)

	(:action KEYM_PASSIVE_TRANSFORMTO_LEFT
		; :parameters (?o1 - keym ?o2 - Passive ?z - key ?x ?y ?new_x - num)
		:parameters (?o1 - keym ?z - key ?x ?y ?new_x - num)
		:precondition (and
						(turn-interactions)
						; (not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						; (at ?x ?y ?o2)
						(is-wall ?x ?y)
						(object-dead ?z)

						(oriented-left ?o1)
						; Volvemos atrás, así que al revés
						(next ?x ?new_x)
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
					(at ?new_x ?y ?z)
					
					(not (object-dead ?z))					
				)
	)

	(:action KEYM_PASSIVE_TRANSFORMTO_RIGHT
		; :parameters (?o1 - keym ?o2 - Passive ?z - key ?x ?y ?new_x - num)
		:parameters (?o1 - keym ?z - key ?x ?y ?new_x - num)
		:precondition (and
						(turn-interactions)
						; (not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						; (at ?x ?y ?o2)
						(is-wall ?x ?y)
						(object-dead ?z)

						(oriented-right ?o1)
						; Volvemos atrás, así que al revés
						(next ?x ?new_x)
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
					(at ?new_x ?y ?z)
					
					(not (object-dead ?z))					
				)
	)

	(:action BOULDER_AVATAR_BOUNCEFORWARD_UP
		:parameters (?o1 - boulder ?o2 - avatar ?x ?y - num ?new_y - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(oriented-up ?o2)
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						
						(previous ?y ?new_y)
					)
		:effect (and
					(at ?x ?new_y ?o1)
					(not (at ?x ?y ?o1))
					
					
				)
	)

	(:action BOULDER_AVATAR_BOUNCEFORWARD_DOWN
		:parameters (?o1 - boulder ?o2 - avatar ?x ?y - num ?new_y - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(oriented-down ?o2)
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						
						(next ?y ?new_y)
					)
		:effect (and
					(at ?x ?new_y ?o1)
					(not (at ?x ?y ?o1))
				)
	)

	(:action BOULDER_AVATAR_BOUNCEFORWARD_LEFT
		:parameters (?o1 - boulder ?o2 - avatar ?x ?y - num ?new_x - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(oriented-left ?o2)
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						
						(previous ?x ?new_x)
					)
		:effect (and
					(at ?new_x ?y ?o1)
					(not (at ?x ?y ?o1))
					
					
				)
	)

	(:action BOULDER_AVATAR_BOUNCEFORWARD_RIGHT
		:parameters (?o1 - boulder ?o2 - avatar ?x ?y - num ?new_x - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(oriented-right ?o2)
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						
						(next ?x ?new_x)
					)
		:effect (and
					(at ?new_x ?y ?o1)
					(not (at ?x ?y ?o1))
					
					
				)
	)

	; (:action KEY_AVATAR_TRANSFORMTO
	; 	:parameters (?o1 - key ?o2 - OrientedAvatar ?z - keym ?x ?y - num)
	; 	:precondition (and
	; 					(turn-interactions)
	; 					(not (= ?o1 ?o2))
	; 					(at ?x ?y ?o1)
	; 					(at ?x ?y ?o2)
	; 					(object-dead ?z)
	; 				)
	; 	:effect (and
	; 				(not (at ?x ?y ?o1))
	; 				(object-dead ?o1)
	; 				(at ?x ?y ?z)
					
	; 				(not (object-dead ?z))
	; 				(when
    ;                     (oriented-up ?o2)
    ;                     (oriented-up ?z)
    ;                 )
    ;                 (when
    ;                     (oriented-down ?o2)
    ;                     (oriented-down ?z)
    ;                 )
    ;                 (when
    ;                     (oriented-left ?o2)
    ;                     (oriented-left ?z)
    ;                 )
    ;                 (when
    ;                     (oriented-right ?o2)
    ;                     (oriented-right ?z)
    ;                 )            
	; 			)
	; )

	(:action KEY_AVATAR_TRANSFORMTO_UP
		:parameters (?o1 - key ?o2 - OrientedAvatar ?z - keym ?x ?y - num ?new_y - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						(object-dead ?z)

						(oriented-up ?o2)
						(previous ?y ?new_y)
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
					
					(not (object-dead ?z))					
					(at ?x ?new_y ?z)
					(oriented-up ?z)                    
				)
	)

	(:action KEY_AVATAR_TRANSFORMTO_DOWN
		:parameters (?o1 - key ?o2 - OrientedAvatar ?z - keym ?x ?y - num ?new_y - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						(object-dead ?z)

						(oriented-down ?o2)
						(next ?y ?new_y)
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
					
					(not (object-dead ?z))					
					(at ?x ?new_y ?z)
					(oriented-down ?z)                    
				)
	)

	(:action KEY_AVATAR_TRANSFORMTO_LEFT
		:parameters (?o1 - key ?o2 - OrientedAvatar ?z - keym ?x ?y - num ?new_x - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						(object-dead ?z)

						(oriented-left ?o2)
						(previous ?x ?new_x)
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
					
					(not (object-dead ?z))					
					(at ?new_x ?y ?z)
					(oriented-left ?z)                    
				)
	)

	(:action KEY_AVATAR_TRANSFORMTO_RIGHT
		:parameters (?o1 - key ?o2 - OrientedAvatar ?z - keym ?x ?y - num ?new_x - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						(object-dead ?z)

						(oriented-right ?o2)
						(next ?x ?new_x)
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
					
					(not (object-dead ?z))					
					(at ?new_x ?y ?z)
					(oriented-right ?z)                    
				)
	)

	; (:action AVATAR_KEY_STEPBACK
	; 	:parameters (?o1 - avatar ?o2 - key ?x ?y - num)
	; 	:precondition (and
	; 					(turn-interactions)
	; 					(not (= ?o1 ?o2))
	; 					(at ?x ?y ?o1)
	; 					(at ?x ?y ?o2)
						
	; 				)
	; 	:effect (and
	; 				(not (at ?x ?y ?o1))
	; 				(at ?c_last ?o1)
	; 			)
	; )

	; (:action AVATAR_KEYM_STEPBACK
	; 	:parameters (?o1 - avatar ?o2 - keym ?x ?y - num)
	; 	:precondition (and
	; 					(turn-interactions)
	; 					(not (= ?o1 ?o2))
	; 					(at ?x ?y ?o1)
	; 					(at ?x ?y ?o2)
						
	; 				)
	; 	:effect (and
	; 				(not (at ?x ?y ?o1))
	; 				(at ?c_last ?o1)
	; 			)
	; )

	(:action DOOR_KEYM_KILLBOTH
		:parameters (?o1 - door ?o2 - keym ?x ?y - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(not (at ?x ?y ?o2))
					(object-dead ?o1)
					(object-dead ?o2)
				)
	)

	; (:action GREEN_AVATAR_KILLSPRITE
	; 	:parameters (?o1 - green ?o2 - avatar ?x ?y - num)
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

	; (:action BLUE_AVATAR_KILLSPRITE
	; 	:parameters (?o1 - blue ?o2 - avatar ?x ?y - num)
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

	; (:action RED_AVATAR_KILLSPRITE
	; 	:parameters (?o1 - red ?o2 - avatar ?x ?y - num)
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

	; (:action GEM_AVATAR_KILLSPRITE
	; 	:parameters (?o1 - gem ?o2 - avatar ?x ?y - num)
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

	(:action EXIT_AVATAR_KILLSPRITE
		:parameters (?o1 - exit ?o2 - avatar ?x ?y - num)
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
					; (turn-avatar)
					; (not (turn-sprites))
					(not (turn-interactions))
					(turn-sprites)
					(not (turn-keym-move))
				)
	)

	(:action TURN-SPRITES
		:parameters ()
		:precondition (and
						(turn-sprites)
					)
		:effect (and
					(turn-keym-move)
					(not (turn-sprites))
				)
	)

	(:action END-TURN-SPRITES
		:parameters ()
		:precondition (and
						(finished-turn-keym-move)
					)
		:effect (and
					(not (finished-turn-keym-move))
					(not (turn-keym-move))
					; (turn-interactions)
					(turn-avatar)
				)
	)


)
