
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
		cell - Immovable
		background - Immovable
		wall - Immovable
		sword - Flicker
		dirt - Immovable
		exitdoor - Door
		diamond - Resource
		boulder - Missile
		moving - movingStype
		avatar - ShootAvatar
		enemy - Chaser
		crab - enemy
		butterfly - enemy
		movingStype ShootAvatar Chaser Missile Door Resource Immovable Flicker - Object
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
		(got-resource-diamond ?x - diamond)
		(boulder-moved ?x - Missile)
		(turn-boulder-move)
		(finished-turn-boulder-move)
		; To maintain order
		(turn-avatar)
		(turn-sprites)
		(turn-interactions)
		; For tile connections
		(connected-up ?c1 ?c2 - cell)
		(connected-down ?c1 ?c2 - cell)
		(connected-right ?c1 ?c2 - cell)
		(connected-left ?c1 ?c2 - cell)
		(at ?c - cell ?o - Object)
		(last-at ?c - cell ?o - Object)
		(object-dead ?o - Object)
	)
  
	; Actions -------------------------------------------------------------------
  
	(:action AVATAR_ACTION_MOVE_UP
		:parameters (?a - ShootAvatar ?c - cell ?c_last - cell ?u - cell)
		:precondition (and
						(turn-avatar)
						(or (oriented-up ?a) (oriented-none ?a))
						(at ?c ?a)
						(last-at ?c_last ?a)
						(connected-up ?c ?u)
					)
		:effect (and
					(not (last-at ?c_last ?a))
					(last-at ?c ?a)
					(not (at ?c ?a))
					(at ?u ?a)
					(not (turn-avatar))
					(turn-sprites)
				)
	)

	(:action AVATAR_ACTION_MOVE_DOWN
		:parameters (?a - ShootAvatar ?c - cell ?c_last - cell ?d - cell)
		:precondition (and
						(turn-avatar)
						(or (oriented-down ?a) (oriented-none ?a))
						(at ?c ?a)
						(last-at ?c_last ?a)
						(connected-down ?c ?d)
					)
		:effect (and
					(not (last-at ?c_last ?a))
					(last-at ?c ?a)
					(not (at ?c ?a))
					(at ?d ?a)
					(not (turn-avatar))
					(turn-sprites)
				)
	)

	(:action AVATAR_ACTION_MOVE_LEFT
		:parameters (?a - ShootAvatar ?c - cell ?c_last - cell ?l - cell)
		:precondition (and
						(turn-avatar)
						(or (oriented-left ?a) (oriented-none ?a))
						(at ?c ?a)
						(last-at ?c_last ?a)
						(connected-left ?c ?l)
					)
		:effect (and
					(not (last-at ?c_last ?a))
					(last-at ?c ?a)
					(not (at ?c ?a))
					(at ?l ?a)
					(not (turn-avatar))
					(turn-sprites)
				)
	)

	(:action AVATAR_ACTION_MOVE_RIGHT
		:parameters (?a - ShootAvatar ?c - cell ?c_last - cell ?r - cell)
		:precondition (and
						(turn-avatar)
						(or (oriented-right ?a) (oriented-none ?a))
						(at ?c ?a)
						(last-at ?c_last ?a)
						(connected-right ?c ?r)
					)
		:effect (and
					(not (last-at ?c_last ?a))
					(last-at ?c ?a)
					(not (at ?c ?a))
					(at ?r ?a)
					(not (turn-avatar))
					(turn-sprites)
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
					(turn-sprites)
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
					(turn-sprites)
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
					(turn-sprites)
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
					(turn-sprites)
				)
	)

	(:action AVATAR_ACTION_USE_UP
		:parameters (?a - ShootAvatar ?p - sword ?c - cell ?u - cell)
		:precondition (and
						(turn-avatar)
						(at ?c ?a)
						(oriented-up ?a)
						(connected-up ?c ?u)
					)
		:effect (and
					(at ?u ?p)
					(not (turn-avatar))
					(turn-sprites)
				)
	)

	(:action AVATAR_ACTION_USE_DOWN
		:parameters (?a - ShootAvatar ?p - sword ?c - cell ?d - cell)
		:precondition (and
						(turn-avatar)
						(at ?c ?a)
						(oriented-down ?a)
						(connected-down ?c ?d)
					)
		:effect (and
					(at ?d ?p)
					(not (turn-avatar))
					(turn-sprites)
				)
	)

	(:action AVATAR_ACTION_USE_LEFT
		:parameters (?a - ShootAvatar ?p - sword ?c - cell ?l - cell)
		:precondition (and
						(turn-avatar)
						(at ?c ?a)
						(oriented-left ?a)
						(connected-left ?c ?l)
					)
		:effect (and
					(at ?l ?p)
					(not (turn-avatar))
					(turn-sprites)
				)
	)

	(:action AVATAR_ACTION_USE_RIGHT
		:parameters (?a - ShootAvatar ?p - sword ?c - cell ?r - cell)
		:precondition (and
						(turn-avatar)
						(at ?c ?a)
						(oriented-right ?a)
						(connected-right ?c ?r)
					)
		:effect (and
					(at ?r ?p)
					(not (turn-avatar))
					(turn-sprites)
				)
	)

	(:action AVATAR_ACTION_NIL
		:parameters (?a - ShootAvatar)
		:precondition (and
						(turn-avatar)
					)
		:effect (and
					(not (turn-avatar))
					(turn-sprites)
				)
	)

	(:action SWORD_DISAPPEAR
		:parameters (?x - sword ?c - cell)
		:precondition (and
						(turn-sword-disappear)
						(at ?c ?x)
					)
		:effect (and
					(not (at ?c ?x))
					(object-dead ?x)
					(sword-disappeared ?x)
				)
	)

	(:action STOP_SWORD_DISSAPEAR
		:parameters ()
		:precondition (and
						(turn-sword-disappear)
						(forall (?x - sword) (or (object-dead ?x) (sword-disappeared ?x)))
					)
		:effect (and
					(forall (?x - sword) (not (sword-disappeared ?x)))
					(not (turn-sword-disappear))
					(finished-turn-sword-disappear)
				)
	)

	(:action BOULDER_MOVE_UP
		:parameters (?x - boulder ?c - cell ?c_last - cell ?u - cell)
		:precondition (and
						(turn-boulder-move)
						(oriented-up ?x)
						(at ?c ?x)
						(last-at ?c_last ?x)
						(connected-up ?c ?u)
					)
		:effect (and
					(not (last-at ?c_last ?x))
					(last-at ?c ?x)
					(not (at ?c ?x))
					(at ?u ?x)
					(boulder-moved ?x)
				)
	)

	(:action BOULDER_MOVE_DOWN
		:parameters (?x - boulder ?c - cell ?c_last - cell ?d - cell)
		:precondition (and
						(turn-boulder-move)
						(oriented-down ?x)
						(at ?c ?x)
						(last-at ?c_last ?x)
						(connected-down ?c ?d)
					)
		:effect (and
					(not (last-at ?c_last ?x))
					(last-at ?c ?x)
					(not (at ?c ?x))
					(at ?d ?x)
					(boulder-moved ?x)
				)
	)

	(:action BOULDER_MOVE_LEFT
		:parameters (?x - boulder ?c - cell ?c_last - cell ?l - cell)
		:precondition (and
						(turn-boulder-move)
						(oriented-left ?x)
						(at ?c ?x)
						(last-at ?c_last ?x)
						(connected-left ?c ?l)
					)
		:effect (and
					(not (last-at ?c_last ?x))
					(last-at ?c ?x)
					(not (at ?c ?x))
					(at ?l ?x)
					(boulder-moved ?x)
				)
	)

	(:action BOULDER_MOVE_RIGHT
		:parameters (?x - boulder ?c - cell ?c_last - cell ?r - cell)
		:precondition (and
						(turn-boulder-move)
						(oriented-right ?x)
						(at ?c ?x)
						(last-at ?c_last ?x)
						(connected-right ?c ?r)
					)
		:effect (and
					(not (last-at ?c_last ?x))
					(last-at ?c ?x)
					(not (at ?c ?x))
					(at ?r ?x)
					(boulder-moved ?x)
				)
	)

	(:action STOP_BOULDER_MOVE
		:parameters ()
		:precondition (and
						(turn-boulder-move)
						(forall (?x - boulder) (or (object-dead ?x) (boulder-moved ?x)))
					)
		:effect (and
					(forall (?x - boulder) (not (boulder-moved ?x)))
					(not (turn-boulder-move))
					(finished-turn-boulder-move)
				)
	)

	(:action DIRT_AVATAR_KILLSPRITE
		:parameters (?x - dirt ?y - avatar ?c - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
					)
		:effect (and
					(not (at ?c ?x))
					(object-dead ?x)
				)
	)

	(:action DIRT_SWORD_KILLSPRITE
		:parameters (?x - dirt ?y - sword ?c - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
					)
		:effect (and
					(not (at ?c ?x))
					(object-dead ?x)
				)
	)

	(:action DIAMOND_AVATAR_COLLECTRESOURCE
		:parameters (?x - diamond ?y - avatar ?c - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
					)
		:effect (and
					(object-dead ?x)
					(got-resource-diamond ?x)
				)
	)

	(:action MOVING_WALL_STEPBACK
		:parameters (?x - moving ?y - wall ?c - cell ?c_last - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
						(last-at ?c_last ?x)
					)
		:effect (and
					(not (at ?c ?x))
					(at ?c_last ?x)
				)
	)

	(:action MOVING_BOULDER_STEPBACK
		:parameters (?x - moving ?y - boulder ?c - cell ?c_last - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
						(last-at ?c_last ?x)
					)
		:effect (and
					(not (at ?c ?x))
					(at ?c_last ?x)
				)
	)

	(:action AVATAR_BOULDER_KILLIFFROMABOVE
		:parameters (?x - avatar ?y - boulder ?c - cell ?c_last - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
						(last-at ?c_last ?y)
						(connected-up ?c ?c_last)
					)
		:effect (and
					(not (at ?c ?x))
					(object-dead ?x)
				)
	)

	(:action AVATAR_BUTTERFLY_KILLSPRITE
		:parameters (?x - avatar ?y - butterfly ?c - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
					)
		:effect (and
					(not (at ?c ?x))
					(object-dead ?x)
				)
	)

	(:action AVATAR_CRAB_KILLSPRITE
		:parameters (?x - avatar ?y - crab ?c - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
					)
		:effect (and
					(not (at ?c ?x))
					(object-dead ?x)
				)
	)

	(:action ENEMY_BOULDER_KILLSPRITE
		:parameters (?x - enemy ?y - boulder ?c - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
					)
		:effect (and
					(not (at ?c ?x))
					(object-dead ?x)
				)
	)

	(:action BOULDER_DIRT_STEPBACK
		:parameters (?x - boulder ?y - dirt ?c - cell ?c_last - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
						(last-at ?c_last ?x)
					)
		:effect (and
					(not (at ?c ?x))
					(at ?c_last ?x)
				)
	)

	(:action BOULDER_WALL_STEPBACK
		:parameters (?x - boulder ?y - wall ?c - cell ?c_last - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
						(last-at ?c_last ?x)
					)
		:effect (and
					(not (at ?c ?x))
					(at ?c_last ?x)
				)
	)

	(:action BOULDER_DIAMOND_STEPBACK
		:parameters (?x - boulder ?y - diamond ?c - cell ?c_last - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
						(last-at ?c_last ?x)
					)
		:effect (and
					(not (at ?c ?x))
					(at ?c_last ?x)
				)
	)

	(:action BOULDER_BOULDER_STEPBACK
		:parameters (?x - boulder ?y - boulder ?c - cell ?c_last - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
						(last-at ?c_last ?x)
					)
		:effect (and
					(not (at ?c ?x))
					(at ?c_last ?x)
				)
	)

	(:action DIRT_BUTTERFLY_KILLSPRITE
		:parameters (?x - dirt ?y - butterfly ?c - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
					)
		:effect (and
					(not (at ?c ?x))
					(object-dead ?x)
				)
	)

	(:action DIRT_CRAB_TRANSFORMTO
		:parameters (?x - dirt ?y - enemy ?z - diamond ?c - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
						(object-dead ?z)
					)
		:effect (and
					(not (at ?c ?x))
					(object-dead ?x)
					(at ?c ?z)
					(last-at ?c ?z)
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

	(:action CRAB_BUTTERFLY_KILLSPRITE
		:parameters (?x - crab ?y - butterfly ?c - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
					)
		:effect (and
					(not (at ?c ?x))
					(object-dead ?x)
				)
	)

	(:action BUTTERFLY_CRAB_TRANSFORMTO
		:parameters (?x - butterfly ?y - enemy ?z - diamond ?c - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
						(object-dead ?z)
					)
		:effect (and
					(not (at ?c ?x))
					(object-dead ?x)
					(at ?c ?z)
					(last-at ?c ?z)
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

	(:action EXITDOOR_AVATAR_KILLIFOTHERHASMORE
		:parameters (?x - exitdoor ?y - avatar ?c - cell ?r0 - diamond ?r1 - diamond ?r2 - diamond ?r3 - diamond ?r4 - diamond ?r5 - diamond ?r6 - diamond ?r7 - diamond ?r8 - diamond)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
						(got-resource-diamond ?r0)
						(got-resource-diamond ?r1)
						(got-resource-diamond ?r2)
						(got-resource-diamond ?r3)
						(got-resource-diamond ?r4)
						(got-resource-diamond ?r5)
						(got-resource-diamond ?r6)
						(got-resource-diamond ?r7)
						(got-resource-diamond ?r8)
					)
		:effect (and
					(object-dead ?x)
				)
	)

	(:action END-TURN-INTERACTIONS
		:parameters ()
		:precondition (and
						(turn-interactions)
						(not 
				(exists (?x - Object ?y - Object ?c - cell) 
					(and
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
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
					(turn-sword-disappear)
					(turn-boulder-move)
					(not (turn-sprites))
				)
	)

	(:action END-TURN-SPRITES
		:parameters ()
		:precondition (and
						(finished-turn-sword-disappear)
						(finished-turn-boulder-move)
					)
		:effect (and
					(not (finished-turn-sword-disappear))
					(not (finished-turn-boulder-move))
					(turn-interactions)
				)
	)


)
