
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
		cell - Immovable
		floor - Immovable
		avatar - OrientedAvatar
		gem - Immovable
		green - gem
		red - gem
		blue - gem
		key - Passive
		keym - Missile
		exit - Immovable
		door - Immovable
		boulder - Passive
		wall - Immovable
		Immovable Missile Passive OrientedAvatar - Object
	)

	; Constants -----------------------------------------------------------------

	(:constants
	)

	; Predicates ----------------------------------------------------------------

	(:predicates
		(oriented-up ?o - Object)
		(oriented-down ?o - Object)
		(oriented-left ?o - Object)
		(oriented-right ?o - Object)
		(oriented-none ?o - Object)
		(keym-moved ?x - Missile)
		(turn-keym-move)
		(finished-turn-keym-move)
		; To maintain order
		(turn-avatar)
		(turn-sprites)
		(turn-interactions)
		; For tile connections
		(connected-up ?c1 ?c2 - cell)
		(connected-down ?c1 ?c2 - cell)
		(connected-right ?c1 ?c2 - cell)
		(connected-left ?c1 ?c2 - cell)
		(at ?c - cell ?o - Object)
		(last-at ?c - cell ?o - Object)
		(object-dead ?o - Object)
	)
  
	; Actions -------------------------------------------------------------------
  
	(:action AVATAR_ACTION_MOVE_UP
		:parameters (?a - OrientedAvatar ?c - cell ?c_last - cell ?u - cell)
		:precondition (and
						(turn-avatar)
						(or (oriented-up ?a) (oriented-none ?a))
						(at ?c ?a)
						(last-at ?c_last ?a)
						(connected-up ?c ?u)
					)
		:effect (and
					(not (last-at ?c_last ?a))
					(last-at ?c ?a)
					(not (at ?c ?a))
					(at ?u ?a)
					(not (turn-avatar))
					(turn-sprites)
				)
	)

	(:action AVATAR_ACTION_MOVE_DOWN
		:parameters (?a - OrientedAvatar ?c - cell ?c_last - cell ?d - cell)
		:precondition (and
						(turn-avatar)
						(or (oriented-down ?a) (oriented-none ?a))
						(at ?c ?a)
						(last-at ?c_last ?a)
						(connected-down ?c ?d)
					)
		:effect (and
					(not (last-at ?c_last ?a))
					(last-at ?c ?a)
					(not (at ?c ?a))
					(at ?d ?a)
					(not (turn-avatar))
					(turn-sprites)
				)
	)

	(:action AVATAR_ACTION_MOVE_LEFT
		:parameters (?a - OrientedAvatar ?c - cell ?c_last - cell ?l - cell)
		:precondition (and
						(turn-avatar)
						(or (oriented-left ?a) (oriented-none ?a))
						(at ?c ?a)
						(last-at ?c_last ?a)
						(connected-left ?c ?l)
					)
		:effect (and
					(not (last-at ?c_last ?a))
					(last-at ?c ?a)
					(not (at ?c ?a))
					(at ?l ?a)
					(not (turn-avatar))
					(turn-sprites)
				)
	)

	(:action AVATAR_ACTION_MOVE_RIGHT
		:parameters (?a - OrientedAvatar ?c - cell ?c_last - cell ?r - cell)
		:precondition (and
						(turn-avatar)
						(or (oriented-right ?a) (oriented-none ?a))
						(at ?c ?a)
						(last-at ?c_last ?a)
						(connected-right ?c ?r)
					)
		:effect (and
					(not (last-at ?c_last ?a))
					(last-at ?c ?a)
					(not (at ?c ?a))
					(at ?r ?a)
					(not (turn-avatar))
					(turn-sprites)
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
					(turn-sprites)
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
					(turn-sprites)
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
					(turn-sprites)
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
					(turn-sprites)
				)
	)

	(:action AVATAR_ACTION_NIL
		:parameters (?a - OrientedAvatar)
		:precondition (and
						(turn-avatar)
					)
		:effect (and
					(not (turn-avatar))
					(turn-sprites)
				)
	)

	(:action KEYM_MOVE_UP
		:parameters (?x - keym ?c - cell ?c_last - cell ?u - cell)
		:precondition (and
						(turn-keym-move)
						(oriented-up ?x)
						(at ?c ?x)
						(last-at ?c_last ?x)
						(connected-up ?c ?u)
					)
		:effect (and
					(not (last-at ?c_last ?x))
					(last-at ?c ?x)
					(not (at ?c ?x))
					(at ?u ?x)
					(keym-moved ?x)
				)
	)

	(:action KEYM_MOVE_DOWN
		:parameters (?x - keym ?c - cell ?c_last - cell ?d - cell)
		:precondition (and
						(turn-keym-move)
						(oriented-down ?x)
						(at ?c ?x)
						(last-at ?c_last ?x)
						(connected-down ?c ?d)
					)
		:effect (and
					(not (last-at ?c_last ?x))
					(last-at ?c ?x)
					(not (at ?c ?x))
					(at ?d ?x)
					(keym-moved ?x)
				)
	)

	(:action KEYM_MOVE_LEFT
		:parameters (?x - keym ?c - cell ?c_last - cell ?l - cell)
		:precondition (and
						(turn-keym-move)
						(oriented-left ?x)
						(at ?c ?x)
						(last-at ?c_last ?x)
						(connected-left ?c ?l)
					)
		:effect (and
					(not (last-at ?c_last ?x))
					(last-at ?c ?x)
					(not (at ?c ?x))
					(at ?l ?x)
					(keym-moved ?x)
				)
	)

	(:action KEYM_MOVE_RIGHT
		:parameters (?x - keym ?c - cell ?c_last - cell ?r - cell)
		:precondition (and
						(turn-keym-move)
						(oriented-right ?x)
						(at ?c ?x)
						(last-at ?c_last ?x)
						(connected-right ?c ?r)
					)
		:effect (and
					(not (last-at ?c_last ?x))
					(last-at ?c ?x)
					(not (at ?c ?x))
					(at ?r ?x)
					(keym-moved ?x)
				)
	)

	(:action STOP_KEYM_MOVE
		:parameters ()
		:precondition (and
						(turn-keym-move)
						(forall (?x - keym) (or (object-dead ?x) (keym-moved ?x)))
					)
		:effect (and
					(forall (?x - keym) (not (keym-moved ?x)))
					(not (turn-keym-move))
					(finished-turn-keym-move)
				)
	)

	(:action KEYM_KEY_TRANSFORMTO
		:parameters (?x - keym ?y - Passive ?z - key ?c - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
						(object-dead ?z)
					)
		:effect (and
					(not (at ?c ?x))
					(object-dead ?x)
					(at ?c ?z)
					(last-at ?c ?z)
					(not (object-dead ?z))
					(when
                        (oriented-up ?y)
                        (oriented-up ?z)
                    )
                    (when
                        (oriented-down ?y)
                        (oriented-down ?z)
                    )
                    (when
                        (oriented-left ?y)
                        (oriented-left ?z)
                    )
                    (when
                        (oriented-right ?y)
                        (oriented-right ?z)
                    )
            
				)
	)

	(:action KEYM_WALL_TRANSFORMTO
		:parameters (?x - keym ?y - Immovable ?z - key ?c - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
						(object-dead ?z)
					)
		:effect (and
					(not (at ?c ?x))
					(object-dead ?x)
					(at ?c ?z)
					(last-at ?c ?z)
					(not (object-dead ?z))
					(when
                        (oriented-up ?y)
                        (oriented-up ?z)
                    )
                    (when
                        (oriented-down ?y)
                        (oriented-down ?z)
                    )
                    (when
                        (oriented-left ?y)
                        (oriented-left ?z)
                    )
                    (when
                        (oriented-right ?y)
                        (oriented-right ?z)
                    )
            
				)
	)

	(:action KEYM_GEM_TRANSFORMTO
		:parameters (?x - keym ?y - Immovable ?z - key ?c - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
						(object-dead ?z)
					)
		:effect (and
					(not (at ?c ?x))
					(object-dead ?x)
					(at ?c ?z)
					(last-at ?c ?z)
					(not (object-dead ?z))
					(when
                        (oriented-up ?y)
                        (oriented-up ?z)
                    )
                    (when
                        (oriented-down ?y)
                        (oriented-down ?z)
                    )
                    (when
                        (oriented-left ?y)
                        (oriented-left ?z)
                    )
                    (when
                        (oriented-right ?y)
                        (oriented-right ?z)
                    )
            
				)
	)

	(:action KEYM_BOULDER_TRANSFORMTO
		:parameters (?x - keym ?y - Passive ?z - key ?c - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
						(object-dead ?z)
					)
		:effect (and
					(not (at ?c ?x))
					(object-dead ?x)
					(at ?c ?z)
					(last-at ?c ?z)
					(not (object-dead ?z))
					(when
                        (oriented-up ?y)
                        (oriented-up ?z)
                    )
                    (when
                        (oriented-down ?y)
                        (oriented-down ?z)
                    )
                    (when
                        (oriented-left ?y)
                        (oriented-left ?z)
                    )
                    (when
                        (oriented-right ?y)
                        (oriented-right ?z)
                    )
            
				)
	)

	(:action AVATAR_WALL_STEPBACK
		:parameters (?x - avatar ?y - wall ?c - cell ?c_last - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
						(last-at ?c_last ?x)
					)
		:effect (and
					(not (at ?c ?x))
					(at ?c_last ?x)
				)
	)

	(:action AVATAR_DOOR_STEPBACK
		:parameters (?x - avatar ?y - door ?c - cell ?c_last - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
						(last-at ?c_last ?x)
					)
		:effect (and
					(not (at ?c ?x))
					(at ?c_last ?x)
				)
	)

	(:action BOULDER_AVATAR_BOUNCEFORWARD_UP
		:parameters (?x - boulder ?y - avatar ?c - cell ?u - cell ?c_last - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(oriented-up ?y)
						(at ?c ?x)
						(at ?c ?y)
						(last-at ?c_last ?x)
						(connected-up ?c ?u)
					)
		:effect (and
					(at ?u ?x)
					(not (at ?c ?x))
					(not (at ?c_last ?x))
					(last-at ?c ?x)
				)
	)

	(:action BOULDER_AVATAR_BOUNCEFORWARD_DOWN
		:parameters (?x - boulder ?y - avatar ?c - cell ?d - cell ?c_last - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(oriented-down ?y)
						(at ?c ?x)
						(at ?c ?y)
						(last-at ?c_last ?x)
						(connected-down ?c ?d)
					)
		:effect (and
					(at ?d ?x)
					(not (at ?c ?x))
					(not (at ?c_last ?x))
					(last-at ?c ?x)
				)
	)

	(:action BOULDER_AVATAR_BOUNCEFORWARD_LEFT
		:parameters (?x - boulder ?y - avatar ?c - cell ?l - cell ?c_last - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(oriented-left ?y)
						(at ?c ?x)
						(at ?c ?y)
						(last-at ?c_last ?x)
						(connected-left ?c ?l)
					)
		:effect (and
					(at ?l ?x)
					(not (at ?c ?x))
					(not (at ?c_last ?x))
					(last-at ?c ?x)
				)
	)

	(:action BOULDER_AVATAR_BOUNCEFORWARD_RIGHT
		:parameters (?x - boulder ?y - avatar ?c - cell ?r - cell ?c_last - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(oriented-right ?y)
						(at ?c ?x)
						(at ?c ?y)
						(last-at ?c_last ?x)
						(connected-right ?c ?r)
					)
		:effect (and
					(at ?r ?x)
					(not (at ?c ?x))
					(not (at ?c_last ?x))
					(last-at ?c ?x)
				)
	)

	(:action KEY_AVATAR_TRANSFORMTO
		:parameters (?x - key ?y - OrientedAvatar ?z - keym ?c - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
						(object-dead ?z)
					)
		:effect (and
					(not (at ?c ?x))
					(object-dead ?x)
					(at ?c ?z)
					(last-at ?c ?z)
					(not (object-dead ?z))
					(when
                        (oriented-up ?y)
                        (oriented-up ?z)
                    )
                    (when
                        (oriented-down ?y)
                        (oriented-down ?z)
                    )
                    (when
                        (oriented-left ?y)
                        (oriented-left ?z)
                    )
                    (when
                        (oriented-right ?y)
                        (oriented-right ?z)
                    )
            
				)
	)

	(:action AVATAR_KEY_STEPBACK
		:parameters (?x - avatar ?y - key ?c - cell ?c_last - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
						(last-at ?c_last ?x)
					)
		:effect (and
					(not (at ?c ?x))
					(at ?c_last ?x)
				)
	)

	(:action AVATAR_KEYM_STEPBACK
		:parameters (?x - avatar ?y - keym ?c - cell ?c_last - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
						(last-at ?c_last ?x)
					)
		:effect (and
					(not (at ?c ?x))
					(at ?c_last ?x)
				)
	)

	(:action DOOR_KEYM_KILLBOTH
		:parameters (?x - door ?y - keym ?c - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
					)
		:effect (and
					(not (at ?c ?x))
					(not (at ?c ?y))
					(object-dead ?x)
					(object-dead ?y)
				)
	)

	(:action GREEN_AVATAR_KILLSPRITE
		:parameters (?x - green ?y - avatar ?c - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
					)
		:effect (and
					(not (at ?c ?x))
					(object-dead ?x)
				)
	)

	(:action BLUE_AVATAR_KILLSPRITE
		:parameters (?x - blue ?y - avatar ?c - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
					)
		:effect (and
					(not (at ?c ?x))
					(object-dead ?x)
				)
	)

	(:action RED_AVATAR_KILLSPRITE
		:parameters (?x - red ?y - avatar ?c - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
					)
		:effect (and
					(not (at ?c ?x))
					(object-dead ?x)
				)
	)

	(:action EXIT_AVATAR_KILLSPRITE
		:parameters (?x - exit ?y - avatar ?c - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
					)
		:effect (and
					(not (at ?c ?x))
					(object-dead ?x)
				)
	)

	(:action END-TURN-INTERACTIONS
		:parameters ()
		:precondition (and
						(turn-interactions)
						(not 
				(exists (?x - Object ?y - Object ?c - cell) 
					(and
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
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
					(turn-interactions)
				)
	)


)
