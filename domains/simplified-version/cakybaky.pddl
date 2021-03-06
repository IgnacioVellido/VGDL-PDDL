
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
		chef - Chaser
		table - Immovable
		inc - Resource
		inca - inc
		incb - inc
		incc - inc
		incd - inc
		ince - inc
		incf - inc
		avatar - OrientedAvatar
		wall - Immovable
		OrientedAvatar Immovable Chaser Resource - Object
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
		(is-table ?x ?y - num)
		(is-chef ?x ?y - num)
		(got-resource-inc ?n - num)
		(got-resource-inca ?n - num)
		(got-resource-incb ?n - num)
		(got-resource-incc ?n - num)
		(got-resource-incd ?n - num)
		(got-resource-ince ?n - num)
		(got-resource-incf ?n - num)
	)
  
	; Actions -------------------------------------------------------------------
  
	(:action AVATAR_ACTION_MOVE_UP
		:parameters (?a - OrientedAvatar ?x - num ?y - num ?new_y - num)
		:precondition (and
						(turn-avatar)
						(or (oriented-up ?a) (oriented-none ?a))
						(at ?x ?y ?a)
						(previous ?y ?new_y)
						(not (is-wall ?x ?new_y))
						(not (is-table ?x ?new_y))
						(not (is-chef ?x ?new_y))
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
		:parameters (?a - OrientedAvatar ?x - num ?y - num ?new_y - num)
		:precondition (and
						(turn-avatar)
						(or (oriented-down ?a) (oriented-none ?a))
						(at ?x ?y ?a)
						(next ?y ?new_y)
						(not (is-wall ?x ?new_y))
						(not (is-table ?x ?new_y))
						(not (is-chef ?x ?new_y))
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
		:parameters (?a - OrientedAvatar ?x - num ?y - num ?new_x - num)
		:precondition (and
						(turn-avatar)
						(or (oriented-left ?a) (oriented-none ?a))
						(at ?x ?y ?a)
						(previous ?x ?new_x)
						(not (is-wall ?new_x ?y))
						(not (is-table ?new_x ?y))
						(not (is-chef ?new_x ?y))
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
		:parameters (?a - OrientedAvatar ?x - num ?y - num ?new_x - num)
		:precondition (and
						(turn-avatar)
						(or (oriented-right ?a) (oriented-none ?a))
						(at ?x ?y ?a)
						(next ?x ?new_x)
						(not (is-wall ?new_x ?y))
						(not (is-table ?new_x ?y))
						(not (is-chef ?new_x ?y))
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
					(turn-interactions)
				)
	)

	(:action INCA_AVATAR_COLLECTRESOURCE
		:parameters (?o1 - inca ?o2 - avatar ?x - num ?y - num ?r - num ?r_next - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						(got-resource-inca ?r)
						(next ?r ?r_next)
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
					(not (got-resource-inca ?r))
					(got-resource-inca ?r_next)
				)
	)

	(:action INCB_AVATAR_COLLECTRESOURCEIFHELD
		:parameters (?o1 - incb ?o2 - avatar ?x - num ?y - num ?r - num ?r_next - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						(got-resource-incb ?r)
						(next ?r ?r_next)
						(not (got-resource-inca n0))
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
					(not (got-resource-incb ?r))
					(got-resource-incb ?r_next)
				)
	)

	(:action INCC_AVATAR_COLLECTRESOURCEIFHELD
		:parameters (?o1 - incc ?o2 - avatar ?x - num ?y - num ?r - num ?r_next - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						(got-resource-incc ?r)
						(next ?r ?r_next)
						(not (got-resource-incb n0))
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
					(not (got-resource-incc ?r))
					(got-resource-incc ?r_next)
				)
	)

	(:action INCD_AVATAR_COLLECTRESOURCEIFHELD
		:parameters (?o1 - incd ?o2 - avatar ?x - num ?y - num ?r - num ?r_next - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						(got-resource-incd ?r)
						(next ?r ?r_next)
						(not (got-resource-incc n0))
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
					(not (got-resource-incd ?r))
					(got-resource-incd ?r_next)
				)
	)

	(:action INCE_AVATAR_COLLECTRESOURCEIFHELD
		:parameters (?o1 - ince ?o2 - avatar ?x - num ?y - num ?r - num ?r_next - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						(got-resource-ince ?r)
						(next ?r ?r_next)
						(not (got-resource-incd n0))
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
					(not (got-resource-ince ?r))
					(got-resource-ince ?r_next)
				)
	)

	(:action INCF_AVATAR_COLLECTRESOURCEIFHELD
		:parameters (?o1 - incf ?o2 - avatar ?x - num ?y - num ?r - num ?r_next - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						(got-resource-incf ?r)
						(next ?r ?r_next)
						(not (got-resource-ince n0))
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
					(not (got-resource-incf ?r))
					(got-resource-incf ?r_next)
				)
	)

	(:action END-TURN-INTERACTIONS
		:parameters ()
		:precondition (and
						(turn-interactions)
						(not (exists (?o1 - ince ?o2 - avatar ?x ?y - num) 
                                (and
                                    (not (= ?o1 ?o2))
                                    (at ?x ?y ?o1)
                                    (at ?x ?y ?o2)
                                )
                            )
                        )
						(not (exists (?o1 - incb ?o2 - avatar ?x ?y - num) 
                                (and
                                    (not (= ?o1 ?o2))
                                    (at ?x ?y ?o1)
                                    (at ?x ?y ?o2)
                                )
                            )
                        )
						(not (exists (?o1 - incc ?o2 - avatar ?x ?y - num) 
                                (and
                                    (not (= ?o1 ?o2))
                                    (at ?x ?y ?o1)
                                    (at ?x ?y ?o2)
                                )
                            )
                        )
						(not (exists (?o1 - incd ?o2 - avatar ?x ?y - num) 
                                (and
                                    (not (= ?o1 ?o2))
                                    (at ?x ?y ?o1)
                                    (at ?x ?y ?o2)
                                )
                            )
                        )
						(not (exists (?o1 - incf ?o2 - avatar ?x ?y - num) 
                                (and
                                    (not (= ?o1 ?o2))
                                    (at ?x ?y ?o1)
                                    (at ?x ?y ?o2)
                                )
                            )
                        )
						(not (exists (?o1 - inca ?o2 - avatar ?x ?y - num) 
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