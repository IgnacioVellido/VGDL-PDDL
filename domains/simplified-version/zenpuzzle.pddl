
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
		isincenter - Flicker
		avatar - MovingAvatar
		ground - Immovable
		walked - Immovable
		rock - Immovable
		Immovable Flicker MovingAvatar - Object
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
		(is-rock ?x ?y - num)
		(is-walked ?x ?y - num)
		(is-wall ?x ?y - num)
		(turn-isincenter-disappear)
		(finished-turn-isincenter-disappear)
	)
  
	; Actions -------------------------------------------------------------------
  
	(:action AVATAR_ACTION_MOVE_UP
		:parameters (?a - MovingAvatar ?x - num ?y - num ?new_y - num)
		:precondition (and
						(turn-avatar)
						(or (oriented-up ?a) (oriented-none ?a))
						(at ?x ?y ?a)
						(previous ?y ?new_y)
						(not (is-rock ?x ?new_y))
						(not (is-walked ?x ?new_y))
						(not (is-wall ?x ?new_y))
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
						(not (is-rock ?x ?new_y))
						(not (is-walked ?x ?new_y))
						(not (is-wall ?x ?new_y))
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
						(not (is-rock ?new_x ?y))
						(not (is-walked ?new_x ?y))
						(not (is-wall ?new_x ?y))
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
						(not (is-rock ?new_x ?y))
						(not (is-walked ?new_x ?y))
						(not (is-wall ?new_x ?y))
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

	(:action ISINCENTER_DISAPPEAR
		:parameters (?o - isincenter ?x - num ?y - num)
		:precondition (and
						(turn-isincenter-disappear)
						(at ?x ?y ?o)
					)
		:effect (and
					(not (at ?x ?y ?o))
					(object-dead ?o)
				)
	)

	(:action STOP_ISINCENTER_DISSAPEAR
		:parameters ()
		:precondition (and
						(turn-isincenter-disappear)
						(forall (?o - isincenter) (object-dead ?o))
					)
		:effect (and
					(not (turn-isincenter-disappear))
					(finished-turn-isincenter-disappear)
				)
	)

	(:action GROUND_AVATAR_TRANSFORMTO
		:parameters (?o1 - ground ?o2 - MovingAvatar ?z - walked ?x - num ?y - num)
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

	(:action WALKED_AVATAR_TRANSFORMTO
		:parameters (?o1 - walked ?o2 - MovingAvatar ?z - isincenter ?x - num ?y - num)
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

	(:action END-TURN-INTERACTIONS
		:parameters ()
		:precondition (and
						(turn-interactions)
						(not (exists (?o1 - walked ?o2 - avatar ?x ?y - num) 
                                (and
                                    (not (= ?o1 ?o2))
                                    (at ?x ?y ?o1)
                                    (at ?x ?y ?o2)
                                )
                            )
                        )
						(not (exists (?o1 - ground ?o2 - avatar ?x ?y - num) 
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
					(turn-isincenter-disappear)
					(not (turn-sprites))
				)
	)

	(:action END-TURN-SPRITES
		:parameters ()
		:precondition (and
						(finished-turn-isincenter-disappear)
						(not (turn-interactions))
					)
		:effect (and
					(not (finished-turn-isincenter-disappear))
					(turn-avatar)
				)
	)

)