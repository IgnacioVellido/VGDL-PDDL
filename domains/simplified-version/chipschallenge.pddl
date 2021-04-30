
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
		mud - Immovable
		fire - Immovable
		redkey - Resource
		bluekey - Resource
		greenkey - Resource
		yellowkey - Resource
		reddoor - Immovable
		bluedoor - Immovable
		greendoor - Immovable
		yellowdoor - Immovable
		flippers - Resource
		fireboots - Resource
		crate - Passive
		gate - Immovable
		exit - Immovable
		chip - Resource
		avatar - MovingAvatar
		wall - Immovable
		Passive Immovable MovingAvatar Resource - Object
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
		(is-water ?x ?y - num)
		(is-fire ?x ?y - num)
		(is-gate ?x ?y - num)
		(is-reddoor ?x ?y - num)
		(is-greendoor ?x ?y - num)
		(is-bluedoor ?x ?y - num)
		(is-yellowdoor ?x ?y - num)
		(got-resource-redkey ?n - num)
		(got-resource-bluekey ?n - num)
		(got-resource-greenkey ?n - num)
		(got-resource-yellowkey ?n - num)
		(got-resource-flippers ?n - num)
		(got-resource-fireboots ?n - num)
		(got-resource-chip ?n - num)
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
						(or
                            (and 
                                (is-water ?x ?new_y)
                                (not (got-resource-flippers n0))
                            )
                            (not (is-water ?x ?new_y))
                        )
						(or
                            (and 
                                (is-fire ?x ?new_y)
                                (not (got-resource-fireboots n0))
                            )
                            (not (is-fire ?x ?new_y))
                        )
						(or
                            (not (is-gate ?x ?new_y))
                            (and 
                                (is-gate ?x ?new_y)
                                (got-resource-chip n11)
                            )
                        )
						(or
                            (not (is-reddoor ?x ?new_y))
                            (and 
                                (is-reddoor ?x ?new_y)
                                (got-resource-redkey n1)
                            )
                        )
						(or
                            (not (is-greendoor ?x ?new_y))
                            (and 
                                (is-greendoor ?x ?new_y)
                                (got-resource-greenkey n1)
                            )
                        )
						(or
                            (not (is-bluedoor ?x ?new_y))
                            (and 
                                (is-bluedoor ?x ?new_y)
                                (got-resource-bluekey n1)
                            )
                        )
						(or
                            (not (is-yellowdoor ?x ?new_y))
                            (and 
                                (is-yellowdoor ?x ?new_y)
                                (got-resource-yellowkey n1)
                            )
                        )
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
						(or
                            (and 
                                (is-water ?x ?new_y)
                                (not (got-resource-flippers n0))
                            )
                            (not (is-water ?x ?new_y))
                        )
						(or
                            (and 
                                (is-fire ?x ?new_y)
                                (not (got-resource-fireboots n0))
                            )
                            (not (is-fire ?x ?new_y))
                        )
						(or
                            (not (is-gate ?x ?new_y))
                            (and 
                                (is-gate ?x ?new_y)
                                (got-resource-chip n11)
                            )
                        )
						(or
                            (not (is-reddoor ?x ?new_y))
                            (and 
                                (is-reddoor ?x ?new_y)
                                (got-resource-redkey n1)
                            )
                        )
						(or
                            (not (is-greendoor ?x ?new_y))
                            (and 
                                (is-greendoor ?x ?new_y)
                                (got-resource-greenkey n1)
                            )
                        )
						(or
                            (not (is-bluedoor ?x ?new_y))
                            (and 
                                (is-bluedoor ?x ?new_y)
                                (got-resource-bluekey n1)
                            )
                        )
						(or
                            (not (is-yellowdoor ?x ?new_y))
                            (and 
                                (is-yellowdoor ?x ?new_y)
                                (got-resource-yellowkey n1)
                            )
                        )
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
						(or
                            (and 
                                (is-water ?new_x ?y)
                                (not (got-resource-flippers n0))
                            )
                            (not (is-water ?new_x ?y))
                        )
						(or
                            (and 
                                (is-fire ?new_x ?y)
                                (not (got-resource-fireboots n0))
                            )
                            (not (is-fire ?new_x ?y))
                        )
						(or
                            (not (is-gate ?new_x ?y))
                            (and 
                                (is-gate ?new_x ?y)
                                (got-resource-chip n11)
                            )
                        )
						(or
                            (not (is-reddoor ?new_x ?y))
                            (and 
                                (is-reddoor ?new_x ?y)
                                (got-resource-redkey n1)
                            )
                        )
						(or
                            (not (is-greendoor ?new_x ?y))
                            (and 
                                (is-greendoor ?new_x ?y)
                                (got-resource-greenkey n1)
                            )
                        )
						(or
                            (not (is-bluedoor ?new_x ?y))
                            (and 
                                (is-bluedoor ?new_x ?y)
                                (got-resource-bluekey n1)
                            )
                        )
						(or
                            (not (is-yellowdoor ?new_x ?y))
                            (and 
                                (is-yellowdoor ?new_x ?y)
                                (got-resource-yellowkey n1)
                            )
                        )
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
						(or
                            (and 
                                (is-water ?new_x ?y)
                                (not (got-resource-flippers n0))
                            )
                            (not (is-water ?new_x ?y))
                        )
						(or
                            (and 
                                (is-fire ?new_x ?y)
                                (not (got-resource-fireboots n0))
                            )
                            (not (is-fire ?new_x ?y))
                        )
						(or
                            (not (is-gate ?new_x ?y))
                            (and 
                                (is-gate ?new_x ?y)
                                (got-resource-chip n11)
                            )
                        )
						(or
                            (not (is-reddoor ?new_x ?y))
                            (and 
                                (is-reddoor ?new_x ?y)
                                (got-resource-redkey n1)
                            )
                        )
						(or
                            (not (is-greendoor ?new_x ?y))
                            (and 
                                (is-greendoor ?new_x ?y)
                                (got-resource-greenkey n1)
                            )
                        )
						(or
                            (not (is-bluedoor ?new_x ?y))
                            (and 
                                (is-bluedoor ?new_x ?y)
                                (got-resource-bluekey n1)
                            )
                        )
						(or
                            (not (is-yellowdoor ?new_x ?y))
                            (and 
                                (is-yellowdoor ?new_x ?y)
                                (got-resource-yellowkey n1)
                            )
                        )
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

	(:action CRATE_AVATAR_BOUNCEFORWARD_UP
		:parameters (?o1 - crate ?o2 - avatar ?x - num ?y - num ?new_y - num)
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

	(:action CRATE_AVATAR_BOUNCEFORWARD_DOWN
		:parameters (?o1 - crate ?o2 - avatar ?x - num ?y - num ?new_y - num)
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

	(:action CRATE_AVATAR_BOUNCEFORWARD_LEFT
		:parameters (?o1 - crate ?o2 - avatar ?x - num ?y - num ?new_x - num)
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

	(:action CRATE_AVATAR_BOUNCEFORWARD_RIGHT
		:parameters (?o1 - crate ?o2 - avatar ?x - num ?y - num ?new_x - num)
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

	(:action WATER_CRATE_TRANSFORMTO
		:parameters (?o1 - crate ?x - num ?y - num ?z - mud)
		:precondition (and
						(turn-interactions)
						(at ?x ?y ?o1)
						(is-water ?x ?y)
						(object-dead ?z)
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
					(not (is-water ?x ?y))
					(at ?x ?y ?z)
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

	(:action MUD_AVATAR_KILLSPRITE
		:parameters (?o1 - mud ?o2 - avatar ?x - num ?y - num)
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

	(:action GATE_AVATAR_KILLIFOTHERHASMORE
		:parameters (?o1 - avatar ?x - num ?y - num)
		:precondition (and
						(turn-interactions)
						(at ?x ?y ?o1)
						(is-gate ?x ?y)
						(got-resource-chip n11)
					)
		:effect (and
					(not (is-gate ?x ?y))
				)
	)

	(:action CHIP_AVATAR_COLLECTRESOURCE
		:parameters (?o1 - chip ?o2 - avatar ?x - num ?y - num ?r - num ?r_next - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						(got-resource-chip ?r)
						(next ?r ?r_next)
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
					(not (got-resource-chip ?r))
					(got-resource-chip ?r_next)
				)
	)

	(:action REDKEY_AVATAR_COLLECTRESOURCE
		:parameters (?o1 - redkey ?o2 - avatar ?x - num ?y - num ?r - num ?r_next - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						(got-resource-redkey ?r)
						(next ?r ?r_next)
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
					(not (got-resource-redkey ?r))
					(got-resource-redkey ?r_next)
				)
	)

	(:action BLUEKEY_AVATAR_COLLECTRESOURCE
		:parameters (?o1 - bluekey ?o2 - avatar ?x - num ?y - num ?r - num ?r_next - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						(got-resource-bluekey ?r)
						(next ?r ?r_next)
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
					(not (got-resource-bluekey ?r))
					(got-resource-bluekey ?r_next)
				)
	)

	(:action GREENKEY_AVATAR_COLLECTRESOURCE
		:parameters (?o1 - greenkey ?o2 - avatar ?x - num ?y - num ?r - num ?r_next - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						(got-resource-greenkey ?r)
						(next ?r ?r_next)
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
					(not (got-resource-greenkey ?r))
					(got-resource-greenkey ?r_next)
				)
	)

	(:action YELLOWKEY_AVATAR_COLLECTRESOURCE
		:parameters (?o1 - yellowkey ?o2 - avatar ?x - num ?y - num ?r - num ?r_next - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						(got-resource-yellowkey ?r)
						(next ?r ?r_next)
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
					(not (got-resource-yellowkey ?r))
					(got-resource-yellowkey ?r_next)
				)
	)

	(:action FIREBOOTS_AVATAR_COLLECTRESOURCE
		:parameters (?o1 - fireboots ?o2 - avatar ?x - num ?y - num ?r - num ?r_next - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						(got-resource-fireboots ?r)
						(next ?r ?r_next)
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
					(not (got-resource-fireboots ?r))
					(got-resource-fireboots ?r_next)
				)
	)

	(:action FLIPPERS_AVATAR_COLLECTRESOURCE
		:parameters (?o1 - flippers ?o2 - avatar ?x - num ?y - num ?r - num ?r_next - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						(got-resource-flippers ?r)
						(next ?r ?r_next)
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
					(not (got-resource-flippers ?r))
					(got-resource-flippers ?r_next)
				)
	)

	(:action REDDOOR_AVATAR_KILLIFOTHERHASMORE
		:parameters (?o1 - avatar ?x - num ?y - num)
		:precondition (and
						(turn-interactions)
						(at ?x ?y ?o1)
						(is-reddoor ?x ?y)
						(got-resource-redkey n1)
					)
		:effect (and
					(not (is-reddoor ?x ?y))
				)
	)

	(:action GREENDOOR_AVATAR_KILLIFOTHERHASMORE
		:parameters (?o1 - avatar ?x - num ?y - num)
		:precondition (and
						(turn-interactions)
						(at ?x ?y ?o1)
						(is-greendoor ?x ?y)
						(got-resource-greenkey n1)
					)
		:effect (and
					(not (is-greendoor ?x ?y))
				)
	)

	(:action BLUEDOOR_AVATAR_KILLIFOTHERHASMORE
		:parameters (?o1 - avatar ?x - num ?y - num)
		:precondition (and
						(turn-interactions)
						(at ?x ?y ?o1)
						(is-bluedoor ?x ?y)
						(got-resource-bluekey n1)
					)
		:effect (and
					(not (is-bluedoor ?x ?y))
				)
	)

	(:action YELLOWDOOR_AVATAR_KILLIFOTHERHASMORE
		:parameters (?o1 - avatar ?x - num ?y - num)
		:precondition (and
						(turn-interactions)
						(at ?x ?y ?o1)
						(is-yellowdoor ?x ?y)
						(got-resource-yellowkey n1)
					)
		:effect (and
					(not (is-yellowdoor ?x ?y))
				)
	)

	(:action EXIT_AVATAR_KILLSPRITE
		:parameters (?o1 - exit ?o2 - avatar ?x - num ?y - num)
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
						(not (exists (?o1 - crate ?o2 - avatar ?x ?y - num) 
                                (and
                                    (not (= ?o1 ?o2))
                                    (at ?x ?y ?o1)
                                    (at ?x ?y ?o2)
                                )
                            )
                        )
						(not (exists (?o1 - mud ?o2 - avatar ?x ?y - num) 
                                (and
                                    (not (= ?o1 ?o2))
                                    (at ?x ?y ?o1)
                                    (at ?x ?y ?o2)
                                )
                            )
                        )
						(not (exists (?o1 - crate ?x ?y - num) 
                                (and
                                    (is-water ?x ?y)
                                    (at ?x ?y ?o1)
                                )
                            )
                        )
						(not (exists (?o1 - redkey ?o2 - avatar ?x ?y - num) 
                                (and
                                    (not (= ?o1 ?o2))
                                    (at ?x ?y ?o1)
                                    (at ?x ?y ?o2)
                                )
                            )
                        )
						(not (exists (?o1 - avatar ?x ?y - num) 
                                (and
                                    (is-yellowdoor ?x ?y)
                                    (at ?x ?y ?o1)
                                )
                            )
                        )
						(not (exists (?o1 - yellowkey ?o2 - avatar ?x ?y - num) 
                                (and
                                    (not (= ?o1 ?o2))
                                    (at ?x ?y ?o1)
                                    (at ?x ?y ?o2)
                                )
                            )
                        )
						(not (exists (?o1 - fireboots ?o2 - avatar ?x ?y - num) 
                                (and
                                    (not (= ?o1 ?o2))
                                    (at ?x ?y ?o1)
                                    (at ?x ?y ?o2)
                                )
                            )
                        )
						(not (exists (?o1 - avatar ?x ?y - num) 
                                (and
                                    (is-bluedoor ?x ?y)
                                    (at ?x ?y ?o1)
                                )
                            )
                        )
						(not (exists (?o1 - exit ?o2 - avatar ?x ?y - num) 
                                (and
                                    (not (= ?o1 ?o2))
                                    (at ?x ?y ?o1)
                                    (at ?x ?y ?o2)
                                )
                            )
                        )
						(not (exists (?o1 - greenkey ?o2 - avatar ?x ?y - num) 
                                (and
                                    (not (= ?o1 ?o2))
                                    (at ?x ?y ?o1)
                                    (at ?x ?y ?o2)
                                )
                            )
                        )
						(not (exists (?o1 - avatar ?x ?y - num) 
                                (and
                                    (is-gate ?x ?y)
                                    (at ?x ?y ?o1)
                                )
                            )
                        )
						(not (exists (?o1 - chip ?o2 - avatar ?x ?y - num) 
                                (and
                                    (not (= ?o1 ?o2))
                                    (at ?x ?y ?o1)
                                    (at ?x ?y ?o2)
                                )
                            )
                        )
						(not (exists (?o1 - bluekey ?o2 - avatar ?x ?y - num) 
                                (and
                                    (not (= ?o1 ?o2))
                                    (at ?x ?y ?o1)
                                    (at ?x ?y ?o2)
                                )
                            )
                        )
						(not (exists (?o1 - avatar ?x ?y - num) 
                                (and
                                    (is-greendoor ?x ?y)
                                    (at ?x ?y ?o1)
                                )
                            )
                        )
						(not (exists (?o1 - flippers ?o2 - avatar ?x ?y - num) 
                                (and
                                    (not (= ?o1 ?o2))
                                    (at ?x ?y ?o1)
                                    (at ?x ?y ?o2)
                                )
                            )
                        )
						(not (exists (?o1 - avatar ?x ?y - num) 
                                (and
                                    (is-reddoor ?x ?y)
                                    (at ?x ?y ?o1)
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