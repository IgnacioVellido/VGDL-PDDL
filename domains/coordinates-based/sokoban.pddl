
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
		hole - Immovable
		avatar - MovingAvatar
		box - Passive
		; wall - Immovable
		Immovable MovingAvatar Passive - Object

		; MODIFICATION
		num
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
		; To maintain order
		(turn-avatar)
		(turn-sprites)
		(turn-interactions)
		; For tile connections
		(at ?x ?y - num ?o - Object)
		(object-dead ?o - Object)

		; MODIFICATION
		(is-wall ?x ?y - num)
		(next ?x ?y - num)
		(previous ?x ?y - num)
	)
  
	; Actions -------------------------------------------------------------------
  
	(:action AVATAR_ACTION_MOVE_UP
		:parameters (?a - MovingAvatar ?x - num ?y - num ?new_y - num)
		:precondition (and
						(turn-avatar)
						(or (oriented-up ?a) (oriented-none ?a))
						(at ?x ?y ?a)

						; MODIFICATION
						(not (is-wall ?x ?new_y))
						(previous ?y ?new_y)
					)
		:effect (and
					; (not (last-at ?x ?old_y ?a))
					; (last-at ?x ?y ?a)
					(not (at ?x ?y ?a))
					(at ?x ?new_y ?a)
					(not (turn-avatar))
					(turn-sprites)
				)
	)

	(:action AVATAR_ACTION_MOVE_DOWN
		:parameters (?a - MovingAvatar ?x - num ?y - num ?new_y - num)
		:precondition (and
						(turn-avatar)
						(or (oriented-down ?a) (oriented-none ?a))
						(at ?x ?y ?a)
						; (last-at ?c_last ?a)
						; (connected-down ?c ?d)

						; MODIFICATION
						(not (is-wall ?x ?new_y))
						(next ?y ?new_y)
					)
		:effect (and
					; (not (last-at ?c_last ?a))
					; (last-at ?c ?a)
					(not (at ?x ?y ?a))
					(at ?x ?new_y ?a)
					(not (turn-avatar))
					(turn-sprites)
				)
	)

	(:action AVATAR_ACTION_MOVE_LEFT
		:parameters (?a - MovingAvatar ?x - num ?y - num ?new_x - num)
		:precondition (and
						(turn-avatar)
						(or (oriented-left ?a) (oriented-none ?a))
						(at ?x ?y ?a)
						; (last-at ?c_last ?a)
						; (connected-left ?c ?l)

						; MODIFICATION
						(not (is-wall ?new_x ?y))
						(previous ?x ?new_x)
					)
		:effect (and
					; (not (last-at ?c_last ?a))
					; (last-at ?c ?a)
					(not (at ?x ?y ?a))
					(at ?new_x ?y ?a)

					(not (turn-avatar))
					(turn-sprites)
				)
	)

	(:action AVATAR_ACTION_MOVE_RIGHT
		:parameters (?a - MovingAvatar ?x - num ?y - num ?new_x - num)
		:precondition (and
						(turn-avatar)
						(or (oriented-right ?a) (oriented-none ?a))
						(at ?x ?y ?a)
						; (last-at ?c_last ?a)
						; (connected-right ?c ?r)

						; MODIFICATION
						(not (is-wall ?new_x ?y))
						(next ?x ?new_x)
					)
		:effect (and
					; (not (last-at ?c_last ?a))
					; (last-at ?c ?a)
					(not (at ?x ?y ?a))
					(at ?new_x ?y ?a)

					(not (turn-avatar))
					(turn-sprites)
				)
	)

	(:action AVATAR_ACTION_NIL
		:parameters (?a - MovingAvatar)
		:precondition (and
						(turn-avatar)
					)
		:effect (and
					(not (turn-avatar))
					(turn-sprites)
				)
	)

	; MODIFICATION
	; (:action AVATAR_WALL_STEPBACK
	; 	:parameters (?x - avatar ?y - wall ?c - num)
	; 	:precondition (and
	; 					(turn-interactions)
	; 					(not (= ?o1 ?o2))
	; 					(at ?x ?y ?o1)
	; 					(at ?x ?y ?o2)
	; 					; (last-at ?c_last ?x)
	; 				)
	; 	:effect (and
	; 				(not (at ?x ?y ?o1))
	; 				(at ?c_last ?x)
	; 			)
	; )

	(:action BOX_AVATAR_BOUNCEFORWARD_RIGHT
		:parameters (?o1 - box ?o2 - avatar ?x - num ?y - num ?new_x - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(or (oriented-right ?o2) (oriented-none ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						; (last-at ?c_last ?x)
						; (connected-up ?c ?u)
						(next ?x ?new_x)
					)
		:effect (and
					(at ?new_x ?y ?o1)
					(not (at ?x ?y ?o1))
					; (not (at ?c_last ?x))
					; (last-at ?c ?x)
				)
	)

	(:action BOX_AVATAR_BOUNCEFORWARD_LEFT
		:parameters (?o1 - box ?o2 - avatar ?x - num ?y - num ?new_x - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(or (oriented-left ?o2) (oriented-none ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						; (last-at ?c_last ?x)
						(previous ?x ?new_x)
					)
		:effect (and
					(at ?new_x ?y ?o1)
					(not (at ?x ?y ?o1))
					; (not (at ?c_last ?x))
					; (last-at ?c ?x)
				)
	)

	(:action BOX_AVATAR_BOUNCEFORWARD_DOWN
		:parameters (?o1 - box ?o2 - avatar ?x - num ?y - num ?new_y - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(or (oriented-down ?o2) (oriented-none ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						; (last-at ?c_last ?x)
						(next ?y ?new_y)
					)
		:effect (and
					(at ?x ?new_y ?o1)
					(not (at ?x ?y ?o1))
					; (not (at ?c_last ?x))
					; (last-at ?c ?x)
				)
	)

	(:action BOX_AVATAR_BOUNCEFORWARD_UP
		:parameters (?o1 - box ?o2 - avatar ?x - num ?y - num ?new_y - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(or (oriented-up ?o2) (oriented-none ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						; (last-at ?c_last ?x)
						(previous ?y ?new_y)
					)
		:effect (and
					(at ?x ?new_y ?o1)
					(not (at ?x ?y ?o1))
					; (not (at ?c_last ?x))
					; (last-at ?c ?x)
				)
	)

	(:action BOX_HOLE_KILLSPRITE
		:parameters (?o1 - box ?o2 - hole ?x ?y - num)
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
					(not (turn-sprites))
				)
	)

	(:action END-TURN-SPRITES
		:parameters ()
		:precondition (and
					)
		:effect (and
					(turn-interactions)
				)
	)


)
