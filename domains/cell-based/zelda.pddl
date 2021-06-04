
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
		goal - Door
		key - Immovable
		sword - OrientedFlicker
		movable - movableStype
		avatar - ShootAvatar
		nokey - avatar
		withkey - avatar
		enemy - enemyStype
		monsterQuick - RandomNPC
		monsterNormal - RandomNPC
		monsterSlow - RandomNPC
		wall - Immovable
		OrientedFlicker movableStype RandomNPC Door Immovable ShootAvatar enemyStype - Object
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
		(sword-disappeared ?x - OrientedFlicker)
		(turn-sword-disappear)
		(finished-turn-sword-disappear)
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

	(:action MOVABLE_WALL_STEPBACK
		:parameters (?x - movable ?y - wall ?c - cell ?c_last - cell)
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

	(:action NOKEY_GOAL_STEPBACK
		:parameters (?x - nokey ?y - goal ?c - cell ?c_last - cell)
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

	(:action GOAL_WITHKEY_KILLSPRITE
		:parameters (?x - goal ?y - withkey ?c - cell)
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

	(:action ENEMY_SWORD_KILLSPRITE
		:parameters (?x - enemy ?y - sword ?c - cell)
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

	(:action ENEMY_ENEMY_STEPBACK
		:parameters (?x - enemy ?y - enemy ?c - cell ?c_last - cell)
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

	(:action AVATAR_ENEMY_KILLSPRITE
		:parameters (?x - avatar ?y - enemy ?c - cell)
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

	(:action NOKEY_KEY_TRANSFORMTO
		:parameters (?x - nokey ?y - Immovable ?z - withkey ?c - cell)
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
					(turn-interactions)
				)
	)


)
