
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
		sword - Flicker
		exitdoor - Door
		diamond - Resource
		boulder - Missile
		avatar - ShootAvatar
		Resource Missile Flicker Door Immovable ShootAvatar - Object
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
		(sword-disappeared ?x - Flicker)
		(turn-sword-disappear)
		(finished-turn-sword-disappear)
		; (got-resource-diamond ?x - diamond)
		(got-resource-diamond ?d - num)
		; To maintain order
		(turn-avatar)
		(turn-sprites)
		(turn-interactions)
		; For tile connections
		(at ?x ?y - num ?o - Object)
		(object-dead ?o - Object)

		; MODIFICATION
		(is-wall ?x ?y - num)
		(is-boulder ?x ?y - num)
		(next ?x ?y - num)
		(previous ?x ?y - num)
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
						(not (is-boulder ?x ?new_y))
						(previous ?y ?new_y)
					)
		:effect (and
					; (not (last-at ?x ?old_y ?a))
					; (last-at ?x ?y ?a)
					(not (at ?x ?y ?a))
					(at ?x ?new_y ?a)
					(not (turn-avatar))
					; (turn-sprites)
					(turn-interactions)
				)
	)

	(:action AVATAR_ACTION_MOVE_DOWN
		:parameters (?a - ShootAvatar ?x - num ?y - num ?new_y - num)
		:precondition (and
						(turn-avatar)
						(or (oriented-down ?a) (oriented-none ?a))
						(at ?x ?y ?a)
						(not (is-wall ?x ?new_y))
						(not (is-boulder ?x ?new_y))
						(next ?y ?new_y)
					)
		:effect (and
					; (not (last-at ?c_last ?a))
					; (last-at ?c ?a)
					(not (at ?x ?y ?a))
					(at ?x ?new_y ?a)
					(not (turn-avatar))
					; (turn-sprites)
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
						(not (is-boulder ?new_x ?y))
						(previous ?x ?new_x)
					)
		:effect (and
					; (not (last-at ?c_last ?a))
					; (last-at ?c ?a)
					(not (at ?x ?y ?a))
					(at ?new_x ?y ?a)

					(not (turn-avatar))
					; (turn-sprites)
					(turn-interactions)
				)
	)

	(:action AVATAR_ACTION_MOVE_RIGHT
		:parameters (?a - ShootAvatar ?x - num ?y - num ?new_x - num)
		:precondition (and
						(turn-avatar)
						(or (oriented-right ?a) (oriented-none ?a))
						(at ?x ?y ?a)
						; (last-at ?c_last ?a)
						; (next ?x ?new_x)

						; MODIFICATION
						(not (is-wall ?new_x ?y))
						(not (is-boulder ?new_x ?y))
						(next ?x ?new_x)
					)
		:effect (and
					; (not (last-at ?c_last ?a))
					; (last-at ?c ?a)
					(not (at ?x ?y ?a))
					(at ?new_x ?y ?a)

					(not (turn-avatar))
					; (turn-sprites)
					(turn-interactions)
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
					; (turn-sprites)
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
					; (turn-sprites)
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
					; (turn-sprites)
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
					; (turn-sprites)
					(turn-interactions)
				)
	)

	(:action AVATAR_ACTION_USE_UP
		:parameters (?a - ShootAvatar ?p - sword ?x ?y - num ?new_y - num)
		:precondition (and
						(turn-avatar)
						(at ?x ?y ?a)
						(oriented-up ?a)
						(previous ?y ?new_y)
					)
		:effect (and
					(at ?x ?new_y ?p)
					(not(object-dead ?p))
					(not (turn-avatar))
					; (turn-sprites)
					(turn-interactions)
				)
	)

	(:action AVATAR_ACTION_USE_DOWN
		:parameters (?a - ShootAvatar ?p - sword ?x ?y - num ?new_y - num)
		:precondition (and
						(turn-avatar)
						(at ?x ?y ?a)
						(oriented-down ?a)
						(next ?y ?new_y)
					)
		:effect (and
					(at ?x ?new_y ?p)
					(not(object-dead ?p))
					(not (turn-avatar))
					; (turn-sprites)
					(turn-interactions)
				)
	)

	(:action AVATAR_ACTION_USE_LEFT
		:parameters (?a - ShootAvatar ?p - sword ?x ?y - num ?new_x - num)
		:precondition (and
						(turn-avatar)
						(at ?x ?y ?a)
						(oriented-left ?a)
						(previous ?x ?new_x)
					)
		:effect (and
					(at ?new_x ?y ?p)
					(not(object-dead ?p))
					(not (turn-avatar))
					; (turn-sprites)
					(turn-interactions)
				)
	)

	(:action AVATAR_ACTION_USE_RIGHT
		:parameters (?a - ShootAvatar ?p - sword ?x ?y - num ?new_x - num)
		:precondition (and
						(turn-avatar)
						(at ?x ?y ?a)
						(oriented-right ?a)
						(next ?x ?new_x)
					)
		:effect (and
					(at ?new_x ?y ?p)
					(not(object-dead ?p))
					(not (turn-avatar))
					; (turn-sprites)
					(turn-interactions)
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

	(:action SWORD_DISAPPEAR
		:parameters (?o - sword ?x ?y - num)
		:precondition (and
						(turn-sword-disappear)
						(at ?x ?y ?o)
					)
		:effect (and
					(not (at ?x ?y ?o))
					(object-dead ?o)
					(sword-disappeared ?o)
				)
	)

	(:action STOP_SWORD_DISSAPEAR
		:parameters ()
		:precondition (and
						(turn-sword-disappear)
						(forall (?o - sword) (or (object-dead ?o) (sword-disappeared ?o)))
					)
		:effect (and
					(forall (?o - sword) (not (sword-disappeared ?o)))
					(not (turn-sword-disappear))
					(finished-turn-sword-disappear)
				)
	)

	; (:action DIAMOND_AVATAR_COLLECTRESOURCE
	; 	:parameters (?o1 - diamond ?o2 - avatar ?x ?y - num)
	; 	:precondition (and
	; 					(turn-interactions)
	; 					(not (= ?o1 ?o2))
	; 					(at ?x ?y ?o1)
	; 					(at ?x ?y ?o2)
	; 				)
	; 	:effect (and
	; 				(object-dead ?o1)
	; 				(got-resource-diamond ?o1)
	; 			)
	; )

	(:action BOULDER_SWORD_KILLSPRITE
		:parameters (?o1 - boulder ?o2 - sword ?x ?y - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
					; VER QUÉ HACER CON ESTO
					(not (is-boulder ?x ?y))
				)
	)

	(:action DIAMOND_AVATAR_COLLECTRESOURCE
		:parameters (?o1 - diamond ?o2 - avatar ?x ?y - num ?d ?d_next - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)

						(got-resource-diamond ?d)
						(next ?d ?d_next)
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
					(not (got-resource-diamond ?d))
					(got-resource-diamond ?d_next)
				)
	)

	(:action EXITDOOR_AVATAR_KILLIFOTHERHASMORE
		:parameters (?o1 - exitdoor ?o2 - avatar ?x ?y - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						(got-resource-diamond n5)
					)
		:effect (and
					(not (at ?x ?y ?o1))
					(object-dead ?o1)
				)
	)

	; (:action EXITDOOR_AVATAR_KILLIFOTHERHASMORE
	; 	:parameters (?o1 - exitdoor ?o2 - avatar ?x ?y - num ?r0 - diamond ?r1 - diamond ?r2 - diamond)
	; 	; ?r3 - diamond ?r4 - diamond)
	; 	; ?r5 - diamond ?r6 - diamond ?r7 - diamond ?r8 - diamond)
	; 	:precondition (and
	; 					(turn-interactions)
	; 					(not (= ?o1 ?o2))
	; 					(at ?x ?y ?o1)
	; 					(at ?x ?y ?o2)
	; 					(got-resource-diamond ?r0)
	; 					(got-resource-diamond ?r1)
	; 					(got-resource-diamond ?r2)
	; 					; (got-resource-diamond ?r3)
	; 					; (got-resource-diamond ?r4)
	; 					; (got-resource-diamond ?r5)
	; 					; (got-resource-diamond ?r6)
	; 					; (got-resource-diamond ?r7)
	; 					; (got-resource-diamond ?r8)
	; 				)
	; 	:effect (and
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
					; (turn-avatar)
					(turn-sprites)
					; (not (turn-sprites))
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
					)
		:effect (and
					(not (finished-turn-sword-disappear))
					; (turn-interactions)
					(turn-avatar)
				)
	)
)
