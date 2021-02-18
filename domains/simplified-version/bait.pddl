
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
		hole - Immovable
		avatar - MovingAvatar
		mushroom - Immovable
		key - Resource
		goal - Immovable
		box - Passive
		wall - Immovable
		MovingAvatar Immovable Passive Resource - Object
	)

	; Predicates ----------------------------------------------------------------

	(:predicates
		; Orientation
		(oriented-up ?o - Object)
		(oriented-down ?o - Object)
		(oriented-left ?o - Object)
		(oriented-right ?o - Object)
		(oriented-none ?o - Object)
		; Game turn order
		(turn-avatar)
		(turn-sprites)
		(turn-interactions)
		; Numerics
		(next ?x ?y - num)
		(previous ?x ?y - num)
		; Position
		(at ?x ?y - num ?o - Object)
		(object-dead ?o - Object)
		; Game specific
		(is-wall ?x ?y - num)
		(is-hole ?x ?y - num)
		(got-resource-key ?n - num)
	)
  
	; Actions -------------------------------------------------------------------
  
	(:action AVATAR_ACTION_MOVE_UP
		:parameters (?a - MovingAvatar ?x - num ?y - num ?new_y - num)
		:precondition (and
						(turn-avatar)
						(or (oriented-up ?a) (oriented-none ?a))
						(at ?x ?y ?a)
						(previous ?y ?new_y)
						(not (is-wall ?x ?new_y))
						(not (is-hole ?x ?new_y))
					)
		:effect (and
					(not (at ?x ?y ?a))
					(at ?x ?new_y ?a)
					(not (turn-avatar))
					(turn-interactions)
					; Change orientation
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
				)
	)

	(:action AVATAR_ACTION_MOVE_DOWN
		:parameters (?a - MovingAvatar ?x - num ?y - num ?new_y - num)
		:precondition (and
						(turn-avatar)
						(or (oriented-down ?a) (oriented-none ?a))
						(at ?x ?y ?a)
						(next ?y ?new_y)
						(not (is-wall ?x ?new_y))
						(not (is-hole ?x ?new_y))
					)
		:effect (and
					(not (at ?x ?y ?a))
					(at ?x ?new_y ?a)
					(not (turn-avatar))
					(turn-interactions)
					; Change orientation
					(when
                        (oriented-up ?a )
                        (not (oriented-up ?a))
                    )					
                    (when
                        (oriented-right ?a )
                        (not (oriented-right ?a))
                    )					
                    (when
                        (oriented-left ?a )
                        (not (oriented-left ?a))
                    )
					(oriented-down ?a)
				)
	)

	(:action AVATAR_ACTION_MOVE_LEFT
		:parameters (?a - MovingAvatar ?x - num ?y - num ?new_x - num)
		:precondition (and
						(turn-avatar)
						(or (oriented-left ?a) (oriented-none ?a))
						(at ?x ?y ?a)
						(previous ?x ?new_x)
						(not (is-wall ?new_x ?y))
						(not (is-hole ?new_x ?y))
					)
		:effect (and
					(not (at ?x ?y ?a))
					(at ?new_x ?y ?a)
					(not (turn-avatar))
					(turn-interactions)
					; Change orientation
                    (when
                        (oriented-up ?a )
                        (not (oriented-up ?a))
                    )
					(when
                        (oriented-down ?a )
                        (not (oriented-down ?a))
                    )					
                    (when
                        (oriented-right ?a )
                        (not (oriented-right ?a))
                    )					
					(oriented-left ?a)
				)
	)

	(:action AVATAR_ACTION_MOVE_RIGHT
		:parameters (?a - MovingAvatar ?x - num ?y - num ?new_x - num)
		:precondition (and
						(turn-avatar)
						(or (oriented-right ?a) (oriented-none ?a))
						(at ?x ?y ?a)
						(next ?x ?new_x)
						(not (is-wall ?new_x ?y))
						(not (is-hole ?new_x ?y))
					)
		:effect (and
					(not (at ?x ?y ?a))
					(at ?new_x ?y ?a)
					(not (turn-avatar))
					(turn-interactions)
					; Change orientation
                    (when
                        (oriented-up ?a )
                        (not (oriented-up ?a))
                    )					
					(when
                        (oriented-down ?a )
                        (not (oriented-down ?a))
                    )					
                    (when
                        (oriented-left ?a )
                        (not (oriented-left ?a))
                    )
					(oriented-right ?a)
				)
	)

	(:action BOX_AVATAR_BOUNCEFORWARD_UP
		:parameters (?o1 - box ?o2 - avatar ?x - num ?y - num ?new_y - num)
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

	(:action BOX_AVATAR_BOUNCEFORWARD_DOWN
		:parameters (?o1 - box ?o2 - avatar ?x - num ?y - num ?new_y - num)
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

	(:action BOX_AVATAR_BOUNCEFORWARD_LEFT
		:parameters (?o1 - box ?o2 - avatar ?x - num ?y - num ?new_x - num)
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

	(:action BOX_AVATAR_BOUNCEFORWARD_RIGHT
		:parameters (?o1 - box ?o2 - avatar ?x - num ?y - num ?new_x - num)
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

	(:action BOX_HOLE_KILLBOTH
		:parameters (?o1 - box ?o2 - hole ?x - num ?y - num)
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

	(:action AVATAR_KEY_COLLECTRESOURCE
		:parameters (?o1 - avatar ?o2 - key ?x - num ?y - num ?r - num ?r_next - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						(got-resource-avatar ?r)
						(next ?r ?r_next)
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
					(not (got-resource-avatar ?r))
					(got-resource-avatar ?r_next)
				)
	)

	(:action GOAL_AVATAR_KILLIFOTHERHASMORE
		:parameters (?o1 - goal ?o2 - avatar ?x - num ?y - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						(got-resource-key n1)
					)
		:effect (and
					(object-dead ?o1)
					(not (at ?x ?y ?o1))
				)
	)

	(:action MUSHROOM_AVATAR_KILLSPRITE
		:parameters (?o1 - mushroom ?o2 - avatar ?x - num ?y - num)
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
						(not (exists (?o1 - mushroom ?o2 - avatar ?x ?y - num) 
                                (and
                                    (not (= ?o1 ?o2))
                                    (at ?x ?y ?o1)
                                    (at ?x ?y ?o2)
                                )
                            )
                        )
						(not (exists (?o1 - box ?o2 - hole ?x ?y - num) 
                                (and
                                    (not (= ?o1 ?o2))
                                    (at ?x ?y ?o1)
                                    (at ?x ?y ?o2)
                                )
                            )
                        )
						(not (exists (?o1 - goal ?o2 - avatar ?x ?y - num) 
                                (and
                                    (not (= ?o1 ?o2))
                                    (at ?x ?y ?o1)
                                    (at ?x ?y ?o2)
                                )
                            )
                        )
						(not (exists (?o1 - avatar ?o2 - key ?x ?y - num) 
                                (and
                                    (not (= ?o1 ?o2))
                                    (at ?x ?y ?o1)
                                    (at ?x ?y ?o2)
                                )
                            )
                        )
						(not (exists (?o1 - box ?o2 - avatar ?x ?y - num) 
                                (and
                                    (not (= ?o1 ?o2))
                                    (at ?x ?y ?o1)
                                    (at ?x ?y ?o2)
                                )
                            )
                        )
					)
		:effect (and
					(turn-sprites)
					(not (turn-interactions))
				)
	)

	(:action TURN-SPRITES
		:parameters ()
		:precondition (and
						(turn-sprites)
					)
		:effect (and
					(not (turn-sprites))
				)
	)

	(:action END-TURN-SPRITES
		:parameters ()
		:precondition (and
						(not (turn-interactions))
					)
		:effect (and
					(turn-avatar)
				)
	)

)