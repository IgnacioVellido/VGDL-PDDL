
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
		goal - Door
		; key - Immovable
		sword - OrientedFlicker
		movable - movableStype
		avatar - ShootAvatar
		key - Resource
		; nokey - avatar
		; withkey - avatar
		monsterQuick - enemy
		monsterNormal - enemy
		monsterSlow - enemy
		
		enemy ShootAvatar Immovable Door OrientedFlicker movableStype Resource - Object
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
		(sword-disappeared ?o1 - sword)
		(turn-sword-disappear)
		(finished-turn-sword-disappear)
		; To maintain order
		(turn-avatar)
		(turn-sprites)
		(turn-interactions)
		; For tile connections
		(at ?x ?y - num ?o - Object)
		(object-dead ?o - Object)

		; MODIFICATION
		(got-resource-key ?k - key)
		(is-wall ?x ?y - num)
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

						; MODIFICATION
						(not (is-wall ?x ?new_y))
						(next ?y ?new_y)
					)
		:effect (and
					(not (at ?x ?y ?a))
					(at ?x ?new_y ?a)
					
					(not (turn-avatar))					
					(turn-interactions)
				)
	)

	(:action AVATAR_ACTION_MOVE_LEFT
		:parameters (?a - avatar ?x - num ?y - num ?new_x - num)
		:precondition (and
						(turn-avatar)
						(or (oriented-left ?a) (oriented-none ?a))
						(at ?x ?y ?a)

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

	; (:action AVATAR_ACTION_USE_UP
	; 	:parameters (?a - ShootAvatar ?p - sword ?x ?y - num ?new_y - num)
	; 	:precondition (and
	; 					(turn-avatar)
	; 					(at ?x ?y ?a)
	; 					(oriented-up ?a)
	; 					(previous ?y ?new_y)
	; 					; (object-dead ?p)
	; 				)
	; 	:effect (and
	; 				(at ?x ?new_y ?p)
	; 				; (not (object-dead ?p))
	; 				(not (turn-avatar))
	; 				; (turn-sprites)
	; 				(turn-interactions)
	; 			)
	; )

	; (:action AVATAR_ACTION_USE_DOWN
	; 	:parameters (?a - ShootAvatar ?p - sword ?x ?y - num ?new_y - num)
	; 	:precondition (and
	; 					(turn-avatar)
	; 					(at ?x ?y ?a)
	; 					(oriented-down ?a)
	; 					(next ?y ?new_y)
	; 					; (object-dead ?p)
	; 				)
	; 	:effect (and
	; 				(at ?x ?new_y ?p)
	; 				; (not (object-dead ?p))
	; 				(not (turn-avatar))
	; 				; (turn-sprites)
	; 				(turn-interactions)
	; 			)
	; )

	; (:action AVATAR_ACTION_USE_LEFT
	; 	:parameters (?a - ShootAvatar ?p - sword ?x ?y - num ?new_x - num)
	; 	:precondition (and
	; 					(turn-avatar)
	; 					(at ?x ?y ?a)
	; 					(oriented-left ?a)
	; 					(previous ?x ?new_x)
	; 					; (object-dead ?p)
	; 				)
	; 	:effect (and
	; 				(at ?new_x ?y ?p)
	; 				; (not (object-dead ?p))
	; 				(not (turn-avatar))
	; 				; (turn-sprites)
	; 				(turn-interactions)
	; 			)
	; )

	; (:action AVATAR_ACTION_USE_RIGHT
	; 	:parameters (?a - ShootAvatar ?p - sword ?x ?y - num ?new_x - num)
	; 	:precondition (and
	; 					(turn-avatar)
	; 					(at ?x ?y ?a)
	; 					(oriented-right ?a)
	; 					(next ?x ?new_x)
	; 					; (object-dead ?p)
	; 				)
	; 	:effect (and
	; 				(at ?new_x ?y ?p)
	; 				; (not (object-dead ?p))
	; 				(not (turn-avatar))
	; 				; (turn-sprites)
	; 				(turn-interactions)
	; 			)
	; )

	; (:action AVATAR_ACTION_NIL
	; 	:parameters (?a - ShootAvatar)
	; 	:precondition (and
	; 					(turn-avatar)
	; 				)
	; 	:effect (and
	; 				(not (turn-avatar))
	; 				; (turn-sprites)
	; 				(turn-interactions)
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
					; (sword-disappeared ?o)
				)
	)

	(:action STOP_SWORD_DISSAPEAR
		:parameters ()
		:precondition (and
						(turn-sword-disappear)
						; (forall (?o - sword) (or (object-dead ?o)))  (sword-disappeared ?o)))
						(forall (?o - sword) (object-dead ?o))
						; (forall (?o - sword) (sword-disappeared ?o))
					)
		:effect (and
					; (forall (?x - sword) (not (sword-disappeared ?x)))
					(not (turn-sword-disappear))
					(finished-turn-sword-disappear)
				)
	)

	; (:action MOVABLE_WALL_STEPBACK
	; 	:parameters (?o1 - movable ?o2 - wall ?x ?y - num ?c_last - cell)
	; 	:precondition (and
	; 					(turn-interactions)
	; 					(not (= ?o1 ?o2))
	; 					(at ?x ?y ?o1)
	; 					(at ?x ?y ?o2)
	; 					(last-at ?c_last ?o1)
	; 				)
	; 	:effect (and
	; 				(not (at ?x ?y ?o1))
	; 				(at ?c_last ?o1)
	; 			)
	; )

	; (:action NOKEY_GOAL_STEPBACK
	; 	:parameters (?o1 - nokey ?o2 - goal ?x ?y - num ?c_last - cell)
	; 	:precondition (and
	; 					(turn-interactions)
	; 					(not (= ?o1 ?o2))
	; 					(at ?x ?y ?o1)
	; 					(at ?x ?y ?o2)
	; 					(last-at ?c_last ?o1)
	; 				)
	; 	:effect (and
	; 				(not (at ?x ?y ?o1))
	; 				(at ?c_last ?o1)
	; 			)
	; )

	; (:action GOAL_WITHKEY_KILLSPRITE
	; 	:parameters (?o1 - goal ?o2 - withkey ?x ?y - num)
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

	(:action ENEMY_SWORD_KILLSPRITE
		:parameters (?o1 - enemy ?o2 - sword ?x ?y - num)
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

	; (:action ENEMY_ENEMY_STEPBACK
	; 	:parameters (?o1 - enemy ?o2 - enemy ?x ?y - num ?c_last - cell)
	; 	:precondition (and
	; 					(turn-interactions)
	; 					(not (= ?o1 ?o2))
	; 					(at ?x ?y ?o1)
	; 					(at ?x ?y ?o2)
	; 					(last-at ?c_last ?o1)
	; 				)
	; 	:effect (and
	; 				(not (at ?x ?y ?o1))
	; 				(at ?c_last ?o1)
	; 			)
	; )

	; (:action AVATAR_ENEMY_KILLSPRITE
	; 	:parameters (?o1 - avatar ?o2 - enemy ?x ?y - num)
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

	; (:action NOKEY_KEY_TRANSFORMTO
	; 	:parameters (?o1 - nokey ?o2 - Immovable ?z - withkey ?x ?y - num)
	; 	:precondition (and
	; 					(turn-interactions)
	; 					(not (= ?o1 ?o2))
	; 					(at ?x ?y ?o1)
	; 					(at ?x ?y ?o2)
	; 					(object-dead ?z)
	; 				)
	; 	:effect (and
	; 				(not (at ?x ?y ?o1))
	; 				(object-dead ?o1)
	; 				(at ?x ?y ?z)

	; 				(not (object-dead ?z))
	; 				(when
    ;                     (oriented-up ?o2)
    ;                     (oriented-up ?z)
    ;                 )
    ;                 (when
    ;                     (oriented-down ?o2)
    ;                     (oriented-down ?z)
    ;                 )
    ;                 (when
    ;                     (oriented-left ?o2)
    ;                     (oriented-left ?z)
    ;                 )
    ;                 (when
    ;                     (oriented-right ?o2)
    ;                     (oriented-right ?z)
    ;                 )
            
	; 			)
	; )

	(:action KEY_AVATAR_COLLECTRESOURCE
		:parameters (?o1 - key ?o2 - avatar ?x ?y - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
					)
		:effect (and
					(object-dead ?o1)
					(not (at ?x ?y ?o1))
					(got-resource-key ?o1)
				)
	)

	(:action goal_AVATAR_KILLIFOTHERHASMORE
		:parameters (?o1 - goal ?o2 - avatar ?k - key ?x ?y - num)
		:precondition (and
						(turn-interactions)
						(not (= ?o1 ?o2))
						(at ?x ?y ?o1)
						(at ?x ?y ?o2)
						(got-resource-key ?k)
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
