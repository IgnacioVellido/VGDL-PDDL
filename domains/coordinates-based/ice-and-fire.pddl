
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
		exit - Door
		avatar - ShootAvatar
		; trap - Immovable
		ice - Immovable
		fire - Immovable
		feetwear - Resource
		iceshoes fireboots - feetwear
		; chip - Immovable
		ShootAvatar Immovable Door Resource - Object
	)

	; Predicates ----------------------------------------------------------------

	(:predicates
		(oriented-up ?o - Object)
		(oriented-down ?o - Object)
		(oriented-left ?o - Object)
		(oriented-right ?o - Object)
		(oriented-none ?o - Object)
		(got-resource-feetwear ?o1 - feetwear)
		; To maintain order
		(turn-avatar)
		(turn-sprites)
		(turn-interactions)
		; For tile connections
		(at ?o1 ?o2 - num ?o - Object)
		(object-dead ?o - Object)

		; MODIFICATION
		(is-wall ?o1 ?o2 - num)
		(is-trap ?o1 ?o2 - num)
		(is-ice ?o1 ?o2 - num)
		(is-fire ?o1 ?o2 - num)
		(next ?o1 ?o2 - num)
		(previous ?o1 ?o2 - num)
	)
  
	; Actions -------------------------------------------------------------------
  
	(:action AVATAR_ACTION_MOVE_UP
		:parameters (?a - ShootAvatar ?x - num ?y - num ?new_y - num)
		:precondition (and
						(turn-avatar)
						(or (oriented-up ?a) (oriented-none ?a))
						(at ?x ?y ?a)

						; MODIFICATION
						(not (is-wall ?x ?new_y))
						(not (is-trap ?x ?new_y))
						(previous ?y ?new_y)

						(or
							(and 
								(is-fire ?x ?new_y)
								(got-resource-feetwear fireboots)
							)
							(not (is-fire ?x ?new_y))
						)
						(or
							(and 
								(is-ice ?x ?new_y)
								(got-resource-feetwear iceshoes)
							)
							(not (is-ice ?x ?new_y))
						)
					)
		:effect (and
					(not (at ?x ?y ?a))
					(at ?x ?new_y ?a)
					(not (turn-avatar))
					(turn-sprites)
				)
	)

	(:action AVATAR_ACTION_MOVE_DOWN
		:parameters (?a - ShootAvatar ?x - num ?y - num ?new_y - num)
		:precondition (and
						(turn-avatar)
						(or (oriented-down ?a) (oriented-none ?a))
						(at ?x ?y ?a)
						
						(not (is-wall ?x ?new_y))
						(not (is-trap ?x ?new_y))
						(next ?y ?new_y)

						(or
							(and 
								(is-fire ?x ?new_y)
								(got-resource-feetwear fireboots)
							)
							(not (is-fire ?x ?new_y))
						)
						(or
							(and 
								(is-ice ?x ?new_y)
								(got-resource-feetwear iceshoes)
							)
							(not (is-ice ?x ?new_y))
						)
					)
		:effect (and
					(not (at ?x ?y ?a))
					(at ?x ?new_y ?a)
					(not (turn-avatar))
					(turn-sprites)
				)
	)

	(:action AVATAR_ACTION_MOVE_LEFT
		:parameters (?a - avatar ?x - num ?y - num ?new_x - num)
		:precondition (and
						(turn-avatar)
						(or (oriented-left ?a) (oriented-none ?a))
						(at ?x ?y ?a)

						(not (is-wall ?new_x ?y))
						(not (is-trap ?new_x ?y))
						(previous ?x ?new_x)

						(or
							(and 
								(is-fire ?new_x ?y)
								(got-resource-feetwear fireboots)
							)
							(not (is-fire ?new_x ?y))
						)
						(or
							(and 
								(is-ice ?new_x ?y)
								(got-resource-feetwear iceshoes)
							)
							(not (is-ice ?new_x ?y))
						)
					)
		:effect (and
					(not (at ?x ?y ?a))
					(at ?new_x ?y ?a)

					(not (turn-avatar))
					(turn-sprites)
				)
	)

	(:action AVATAR_ACTION_MOVE_RIGHT
		:parameters (?a - avatar ?x - num ?y - num ?new_x - num)
		:precondition (and
						(turn-avatar)
						(or (oriented-right ?a) (oriented-none ?a))
						(at ?x ?y ?a)

						; MODIFICATION
						(not (is-wall ?new_x ?y))
						(not (is-trap ?new_x ?y))
						(next ?x ?new_x)

						(or
							(and 
								(is-fire ?new_x ?y)
								(got-resource-feetwear fireboots)
							)
							(not (is-fire ?new_x ?y))
						)
						(or
							(and 
								(is-ice ?new_x ?y)
								(got-resource-feetwear iceshoes)
							)
							(not (is-ice ?new_x ?y))
						)
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

	; (:action AVATAR_ACTION_NIL
	; 	:parameters (?a - ShootAvatar)
	; 	:precondition (and
	; 					(turn-avatar)
	; 				)
	; 	:effect (and
	; 				(not (turn-avatar))
	; 				(turn-sprites)
	; 			)
	; )

	; (:action AVATAR_WALL_STEPBACK
	; 	:parameters (?o1 - avatar ?o2 - wall ?x ?y - num ?c_last - num)
	; 	:precondition (and
	; 					(turn-interactions)
	; 					(not (= ?o1 ?o2))
	; 					(at ?c ?o1)
	; 					(at ?c ?o2)
	; 					(last-at ?c_last ?o1)
	; 				)
	; 	:effect (and
	; 				(not (at ?c ?o1))
	; 				(at ?c_last ?o1)
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
					(not (at ?x ?y ?o2))
					(object-dead ?o2)
				)
	)

	; (:action AVATAR_TRAP_KILLSPRITE
	; 	:parameters (?o1 - avatar ?o2 - trap ?x ?y - num)
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

	; (:action CHIP_AVATAR_KILLSPRITE
	; 	:parameters (?o1 - chip ?o2 - avatar ?x ?y - num)
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

	(:action FEETWEAR_AVATAR_COLLECTRESOURCE
		:parameters (?o1 - feetwear ?o2 - avatar ?x ?y - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
					)
		:effect (and
					(object-dead ?o1)
					(not (at ?x ?y ?o1))
					(got-resource-feetwear ?o1)
				)
	)

	; (:action AVATAR_ICE_KILLIFOTHERHASLESS
	; 	:parameters (?o1 - avatar ?o2 - ice ?o3 - iceshoes ?x ?y - num)
	; 	:precondition (and
	; 					(turn-interactions)
	; 					(not (= ?o1 ?o2))
	; 					(at ?x ?y ?o1)
	; 					(at ?x ?y ?o2)
	; 					; There should only be one instance
	; 					(not (got-resource-feetwear ?o3))
	; 				)
	; 	:effect (and
	; 				(not (at ?x ?y ?o1))
	; 				(object-dead ?o1)
	; 			)
	; )

	; (:action AVATAR_FIRE_KILLIFOTHERHASLESS
	; 	:parameters (?o1 - avatar ?o2 - fire ?o3 - fireboots ?x ?y - num)
	; 	:precondition (and
	; 					(turn-interactions)
	; 					(not (= ?o1 ?o2))
	; 					(at ?x ?y ?o1)
	; 					(at ?x ?y ?o2)
	; 					(not (got-resource-feetwear ?o3))
	; 				)
	; 	:effect (and
	; 				(not (at ?x ?y ?o1))
	; 				(object-dead ?o1)
	; 			)
	; )

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
