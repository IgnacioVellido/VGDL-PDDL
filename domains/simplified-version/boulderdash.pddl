
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
		wall - Immovable
		sword - Flicker
		exitdoor - Door
		diamond - Resource
		boulder - Immovable
		moving - movingStype
		avatar - ShootAvatar
		enemy - RandomNPC
		crab - enemy
		butterfly - enemy
		Door movingStype Immovable Flicker RandomNPC ShootAvatar Resource - Object
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
		(is-boulder ?x ?y - num)
		(is-butterfly ?x ?y - num)
		(is-crab ?x ?y - num)
		(turn-sword-disappear)
		(finished-turn-sword-disappear)
		(got-resource-diamond ?n - num)
	)
  
	; Actions -------------------------------------------------------------------
  
	(:action AVATAR_ACTION_MOVE_UP
		:parameters (?a - ShootAvatar ?x - num ?y - num ?new_y - num)
		:precondition (and
						(turn-avatar)
						(or (oriented-up ?a) (oriented-none ?a))
						(at ?x ?y ?a)
						(previous ?y ?new_y)
						(not (is-wall ?x ?new_y))
						(not (is-boulder ?x ?new_y))
						(not (is-butterfly ?x ?new_y))
						(not (is-crab ?x ?new_y))
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
		:parameters (?a - ShootAvatar ?x - num ?y - num ?new_y - num)
		:precondition (and
						(turn-avatar)
						(or (oriented-down ?a) (oriented-none ?a))
						(at ?x ?y ?a)
						(next ?y ?new_y)
						(not (is-wall ?x ?new_y))
						(not (is-boulder ?x ?new_y))
						(not (is-butterfly ?x ?new_y))
						(not (is-crab ?x ?new_y))
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
		:parameters (?a - ShootAvatar ?x - num ?y - num ?new_x - num)
		:precondition (and
						(turn-avatar)
						(or (oriented-left ?a) (oriented-none ?a))
						(at ?x ?y ?a)
						(previous ?x ?new_x)
						(not (is-wall ?new_x ?y))
						(not (is-boulder ?new_x ?y))
						(not (is-butterfly ?new_x ?y))
						(not (is-crab ?new_x ?y))
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
		:parameters (?a - ShootAvatar ?x - num ?y - num ?new_x - num)
		:precondition (and
						(turn-avatar)
						(or (oriented-right ?a) (oriented-none ?a))
						(at ?x ?y ?a)
						(next ?x ?new_x)
						(not (is-wall ?new_x ?y))
						(not (is-boulder ?new_x ?y))
						(not (is-butterfly ?new_x ?y))
						(not (is-crab ?new_x ?y))
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

	(:action AVATAR_ACTION_TURN_UP
		:parameters (?a - ShootAvatar)
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
					(turn-interactions)
				)
	)

	(:action AVATAR_ACTION_TURN_DOWN
		:parameters (?a - ShootAvatar)
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
					(turn-interactions)
				)
	)

	(:action AVATAR_ACTION_TURN_LEFT
		:parameters (?a - ShootAvatar)
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
					(turn-interactions)
				)
	)

	(:action AVATAR_ACTION_TURN_RIGHT
		:parameters (?a - ShootAvatar)
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
					(turn-interactions)
				)
	)

	(:action AVATAR_ACTION_USE_UP
		:parameters (?a - ShootAvatar ?p - sword ?x - num ?y - num ?new_y - num)
		:precondition (and
						(turn-avatar)
						(at ?x ?y ?a)
						(oriented-up ?a)
						(previous ?y ?new_y)
					)
		:effect (and
					(at ?x ?new_y ?p)
					(not (turn-avatar))
					(turn-interactions)
				)
	)

	(:action AVATAR_ACTION_USE_DOWN
		:parameters (?a - ShootAvatar ?p - sword ?x - num ?y - num ?new_y - num)
		:precondition (and
						(turn-avatar)
						(at ?x ?y ?a)
						(oriented-down ?a)
						(next ?y ?new_y)
					)
		:effect (and
					(at ?x ?new_y ?p)
					(not (turn-avatar))
					(turn-interactions)
				)
	)

	(:action AVATAR_ACTION_USE_LEFT
		:parameters (?a - ShootAvatar ?p - sword ?x - num ?y - num ?new_x - num)
		:precondition (and
						(turn-avatar)
						(at ?x ?y ?a)
						(oriented-left ?a)
						(previous ?x ?new_x)
					)
		:effect (and
					(at ?new_x ?y ?p)
					(not (turn-avatar))
					(turn-interactions)
				)
	)

	(:action AVATAR_ACTION_USE_RIGHT
		:parameters (?a - ShootAvatar ?p - sword ?x - num ?y - num ?new_x - num)
		:precondition (and
						(turn-avatar)
						(at ?x ?y ?a)
						(oriented-right ?a)
						(next ?x ?new_x)
					)
		:effect (and
					(at ?new_x ?y ?p)
					(not (turn-avatar))
					(turn-interactions)
				)
	)

	(:action SWORD_DISAPPEAR
		:parameters (?o - sword ?x - num ?y - num)
		:precondition (and
						(turn-sword-disappear)
						(at ?x ?y ?o)
					)
		:effect (and
					(not (at ?x ?y ?o))
					(object-dead ?o)
				)
	)

	(:action STOP_SWORD_DISSAPEAR
		:parameters ()
		:precondition (and
						(turn-sword-disappear)
						(forall (?o - sword) (object-dead ?o))
					)
		:effect (and
					(not (turn-sword-disappear))
					(finished-turn-sword-disappear)
				)
	)

	(:action BOULDER_SWORD_KILLSPRITE
		:parameters (?o2 - sword ?x - num ?y - num)
		:precondition (and
						(turn-interactions)
						(is-boulder ?x ?y)
						(at ?x ?y ?o2)
					)
		:effect (and
					(not (is-boulder ?x ?y))
				)
	)

	(:action DIAMOND_AVATAR_COLLECTRESOURCE
		:parameters (?o1 - diamond ?o2 - avatar ?x - num ?y - num ?r - num ?r_next - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						(got-resource-diamond ?r)
						(next ?r ?r_next)
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
					(not (got-resource-diamond ?r))
					(got-resource-diamond ?r_next)
				)
	)

	(:action EXITDOOR_AVATAR_KILLIFOTHERHASMORE
		:parameters (?o1 - exitdoor ?o2 - avatar ?x - num ?y - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						(got-resource-diamond n4)
					)
		:effect (and
					(object-dead ?o1)
					(not (at ?x ?y ?o1))
				)
	)

	(:action END-TURN-INTERACTIONS
		:parameters ()
		:precondition (and
						(turn-interactions)
						(not (exists (?o1 - diamond ?o2 - avatar ?x ?y - num) 
                                (and
                                    (not (= ?o1 ?o2))
                                    (at ?x ?y ?o1)
                                    (at ?x ?y ?o2)
                                )
                            )
                        )
						(not (exists (?o1 - boulder ?o2 - sword ?x ?y - num) 
                                (and
                                    (not (= ?o1 ?o2))
                                    (at ?x ?y ?o1)
                                    (at ?x ?y ?o2)
                                )
                            )
                        )
						(not (exists (?o1 - exitdoor ?o2 - avatar ?x ?y - num) 
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
					(turn-sword-disappear)
					(not (turn-sprites))
				)
	)

	(:action END-TURN-SPRITES
		:parameters ()
		:precondition (and
						(finished-turn-sword-disappear)
						(not (turn-interactions))
					)
		:effect (and
					(not (finished-turn-sword-disappear))
					(turn-avatar)
				)
	)

)