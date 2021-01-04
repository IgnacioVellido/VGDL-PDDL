
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
		floor - Immovable
		water - Immovable
		catapult - Immovable
		southfacing - catapult
		northfacing - catapult
		eastfacing - catapult
		westfacing - catapult
		avatar - avatarStype
		moving - MovingAvatar
		bullet - MissileAvatar
		north - bullet
		south - bullet
		east - bullet
		west - bullet
		goal - Immovable
		wall - Immovable
		avatarStype Immovable MissileAvatar MovingAvatar - Object
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
		:parameters (?a - MovingAvatar ?c - cell ?c_last - cell ?u - cell)
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
		:parameters (?a - MovingAvatar ?c - cell ?c_last - cell ?d - cell)
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
		:parameters (?a - MovingAvatar ?c - cell ?c_last - cell ?l - cell)
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
		:parameters (?a - MovingAvatar ?c - cell ?c_last - cell ?r - cell)
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

	(:action BULLET_WALL_TRANSFORMTO
		:parameters (?x - bullet ?y - Immovable ?z - moving ?c - cell)
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

	(:action MOVING_WATER_KILLSPRITE
		:parameters (?x - moving ?y - water ?c - cell)
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

	(:action AVATAR_WESTFACING_TRANSFORMTO
		:parameters (?x - avatar ?y - catapult ?z - west ?c - cell)
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

	(:action AVATAR_EASTFACING_TRANSFORMTO
		:parameters (?x - avatar ?y - catapult ?z - east ?c - cell)
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

	(:action AVATAR_SOUTHFACING_TRANSFORMTO
		:parameters (?x - avatar ?y - catapult ?z - south ?c - cell)
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

	(:action AVATAR_NORTHFACING_TRANSFORMTO
		:parameters (?x - avatar ?y - catapult ?z - north ?c - cell)
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

	(:action CATAPULT_AVATAR_KILLSPRITE
		:parameters (?x - catapult ?y - avatar ?c - cell)
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

	(:action GOAL_AVATAR_KILLSPRITE
		:parameters (?x - goal ?y - avatar ?c - cell)
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
