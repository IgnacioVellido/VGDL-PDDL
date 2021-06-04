
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
	)

	; Predicates ----------------------------------------------------------------

	(:predicates
		; Orientation
		(avatar-oriented-up)
		(avatar-oriented-down)
		(avatar-oriented-left)
		(avatar-oriented-right)
		(avatar-oriented-none)
		; Game turn order
		(turn-avatar)
		(turn-sprites)
		(turn-interactions)
		; Numerics
		(next ?x ?y - num)
		(previous ?x ?y - num)

		; Game specific
        (is-hole ?x ?y - num)
        (is-avatar ?x ?y - num)
        (is-mushroom ?x ?y - num)
        (is-key ?x ?y - num)
        (is-goal ?x ?y - num)
        (is-box ?x ?y - num)
		(is-wall ?x ?y - num)
		(got-resource-key ?n - num)
	)
  
	; Actions -------------------------------------------------------------------
  
	(:action AVATAR_ACTION_MOVE_UP
		:parameters (?x - num ?y - num ?new_y - num)
		:precondition (and
						(turn-avatar)
						(or (avatar-oriented-up) (avatar-oriented-none))
						(is-avatar ?x ?y)
						(previous ?y ?new_y)
						(not (is-wall ?x ?new_y))
						(not (is-hole ?x ?new_y))
					)
		:effect (and
					(not (is-avatar ?x ?y))
					(is-avatar ?x ?new_y)
					(not (turn-avatar))
					(turn-interactions)
					; Change orientation
					(when
                        (avatar-oriented-down)
                        (not (avatar-oriented-down))
                    )
					
                    (when
                        (avatar-oriented-right)
                        (not (avatar-oriented-right))
                    )
					
                    (when
                        (avatar-oriented-left)
                        (not (avatar-oriented-left))
                    )
					(avatar-oriented-up)
				)
	)

	(:action AVATAR_ACTION_MOVE_DOWN
		:parameters (?x - num ?y - num ?new_y - num)
		:precondition (and
						(turn-avatar)
						(or (avatar-oriented-down) (avatar-oriented-none))
						(is-avatar ?x ?y)
						(next ?y ?new_y)
						(not (is-wall ?x ?new_y))
						(not (is-hole ?x ?new_y))
					)
		:effect (and
					(not (is-avatar ?x ?y))
					(is-avatar ?x ?new_y)
					(not (turn-avatar))
					(turn-interactions)
					; Change orientation
					(when
                        (avatar-oriented-up)
                        (not (avatar-oriented-up))
                    )					
                    (when
                        (avatar-oriented-right)
                        (not (avatar-oriented-right))
                    )					
                    (when
                        (avatar-oriented-left)
                        (not (avatar-oriented-left))
                    )
					(avatar-oriented-down)
				)
	)

	(:action AVATAR_ACTION_MOVE_LEFT
		:parameters (?x - num ?y - num ?new_x - num)
		:precondition (and
						(turn-avatar)
						(or (avatar-oriented-left) (avatar-oriented-none))
						(is-avatar ?x ?y)
						(previous ?x ?new_x)
						(not (is-wall ?new_x ?y))
						(not (is-hole ?new_x ?y))
					)
		:effect (and
					(not (is-avatar ?x ?y))
					(is-avatar ?new_x ?y)
					(not (turn-avatar))
					(turn-interactions)
					; Change orientation
                    (when
                        (avatar-oriented-up)
                        (not (avatar-oriented-up))
                    )
					(when
                        (avatar-oriented-down)
                        (not (avatar-oriented-down))
                    )					
                    (when
                        (avatar-oriented-right)
                        (not (avatar-oriented-right))
                    )					
					(avatar-oriented-left)
				)
	)

	(:action AVATAR_ACTION_MOVE_RIGHT
		:parameters (?x - num ?y - num ?new_x - num)
		:precondition (and
						(turn-avatar)
						(or (avatar-oriented-right) (avatar-oriented-none))
						(is-avatar ?x ?y)
						(next ?x ?new_x)
						; Stepback, kill, undoall 
						(not (is-wall ?new_x ?y))
						(not (is-hole ?new_x ?y))
					)
		:effect (and
					(not (is-avatar ?x ?y))
					(is-avatar ?new_x ?y)
					(not (turn-avatar))
					(turn-interactions)
					; Change orientation
                    (when
                        (avatar-oriented-up)
                        (not (avatar-oriented-up))
                    )					
					(when
                        (avatar-oriented-down)
                        (not (avatar-oriented-down))
                    )					
                    (when
                        (avatar-oriented-left)
                        (not (avatar-oriented-left))
                    )
					(avatar-oriented-right)
				)
	)

	(:action BOX_AVATAR_BOUNCEFORWARD_UP
		:parameters (?x - num ?y - num ?new_y - num)
		:precondition (and
						(turn-interactions)
						(avatar-oriented-up)
						(is-box ?x ?y)
						(is-avatar ?x ?y)
						(previous ?y ?new_y)
						(not (is-wall ?x ?new_y))
                        (not (is-box ?x ?new_y))
                        (not (is-mushroom ?x ?new_y))
					)
		:effect (and
					(is-box ?x ?new_y)
					(not (is-box ?x ?y))
				)
	)

	(:action BOX_AVATAR_BOUNCEFORWARD_DOWN
		:parameters (?x - num ?y - num ?new_y - num)
		:precondition (and
						(turn-interactions)
						(avatar-oriented-down)
						(is-box ?x ?y)
						(is-avatar ?x ?y)
						(next ?y ?new_y)
						(not (is-wall ?x ?new_y))
                        (not (is-box ?x ?new_y))
                        (not (is-mushroom ?x ?new_y))
					)
		:effect (and
					(is-box ?x ?new_y)
					(not (is-box ?x ?y))
				)
	)

	(:action BOX_AVATAR_BOUNCEFORWARD_LEFT
		:parameters (?x - num ?y - num ?new_x - num)
		:precondition (and
						(turn-interactions)
						(avatar-oriented-left)
                        (is-box ?x ?y)
						(is-avatar ?x ?y)
						(previous ?x ?new_x)
						(not (is-wall ?new_x ?y))
                        (not (is-box ?new_x ?y))
                        (not (is-mushroom ?new_x ?y))
					)
		:effect (and
					(is-box ?new_x ?y)
					(not (is-box ?x ?y))
				)
	)

	(:action BOX_AVATAR_BOUNCEFORWARD_RIGHT
		:parameters (?x - num ?y - num ?new_x - num)
		:precondition (and
						(turn-interactions)
						(avatar-oriented-right)

						(is-box ?x ?y)
						(is-avatar ?x ?y)

						(next ?x ?new_x)

                        ; Undo all
						(not (is-wall ?new_x ?y))
                        (not (is-box ?new_x ?y))
                        (not (is-mushroom ?new_x ?y))
					)
		:effect (and
					(is-box ?new_x ?y)
					(not (is-box ?x ?y))
				)
	)

	(:action BOX_HOLE_KILLBOTH
		:parameters (?x - num ?y - num)
		:precondition (and
						(turn-interactions)
						(is-box ?x ?y)
						(is-hole ?x ?y)
					)
		:effect (and
					(not (is-hole ?x ?y))
                    (not (is-box ?x ?y))
				)
	)

	(:action KEY_AVATAR_COLLECTRESOURCE
		:parameters (?x - num ?y - num ?r - num ?r_next - num)
		:precondition (and
						(turn-interactions)
						(is-key ?x ?y)
						(is-avatar ?x ?y)
						(got-resource-key ?r)
						(next ?r ?r_next)
					)
		:effect (and
					(not (is-key ?x ?y))
					(not (got-resource-key ?r))
					(got-resource-key ?r_next)
				)
	)

	(:action GOAL_AVATAR_KILLIFOTHERHASMORE
		:parameters (?x - num ?y - num)
		:precondition (and
						(turn-interactions)
						(is-goal ?x ?y)
						(is-avatar ?x ?y)
						(got-resource-key n1)
					)
		:effect (and
					(not (is-goal ?x ?y))
				)
	)

	(:action MUSHROOM_AVATAR_KILLSPRITE
		:parameters (?x - num ?y - num)
		:precondition (and
						(turn-interactions)
						(is-mushroom ?x ?y)
						(is-avatar ?x ?y)
					)
		:effect (and
					(not (is-mushroom ?x ?y))
				)
	)

	(:action END-TURN-INTERACTIONS
		:parameters ()
		:precondition (and
						(turn-interactions)
                        ; (not (exists (?x ?y - num)
                        ;         (and
                        ;             (is-goal ?x ?y)
                        ;             (is-avatar ?x ?y)
                        ;         )
                        ;     )
                        ; )
						; (not (exists (?x ?y - num) 
                        ;         (and
                        ;             (is-box ?x ?y)
                        ;             (is-avatar ?x ?y)
                        ;         )
                        ;     )
                        ; )
						; (not (exists (?x ?y - num) 
                        ;         (and
                        ;             (is-key ?x ?y)
                        ;             (is-avatar ?x ?y)
                        ;         )
                        ;     )
                        ; )
						; (not (exists (?x ?y - num) 
                        ;         (and
                        ;             (is-hole ?x ?y)
                        ;             (is-box ?x ?y)
                        ;         )
                        ;     )
                        ; )
						; (not (exists (?x ?y - num) 
                        ;         (and
                        ;             (is-mushroom ?x ?y)
                        ;             (is-avatar ?x ?y)
                        ;         )
                        ;     )
                        ; )
						(not (exists (?x ?y - num) 
								(or
									(and
										(is-mushroom ?x ?y)
										(is-avatar ?x ?y)
									)
									(and
										(is-hole ?x ?y)
										(is-box ?x ?y)
									)
									(and
										(is-key ?x ?y)
										(is-avatar ?x ?y)
									)									
									(and
										(is-box ?x ?y)
										(is-avatar ?x ?y)
									)
									(and
										(is-goal ?x ?y)
										(is-avatar ?x ?y)
									)
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