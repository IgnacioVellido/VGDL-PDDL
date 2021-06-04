
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
		exit - Door
		avatar - MovingAvatar
		trap - Immovable
		ice - Immovable
		fire - Immovable
		feetwear - Resource
		iceshoes - feetwear
		fireboots - feetwear
		chip - Immovable
		wall - Immovable
		Door MovingAvatar Immovable Resource - Object
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
		(got-resource-feetwear ?x - feetwear)
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

	(:action AVATAR_WALL_STEPBACK
		:parameters (?x - avatar ?y - wall ?c - cell ?c_last - cell)
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

	(:action EXIT_AVATAR_KILLSPRITE
		:parameters (?x - exit ?y - avatar ?c - cell)
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

	(:action AVATAR_TRAP_KILLSPRITE
		:parameters (?x - avatar ?y - trap ?c - cell)
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

	(:action CHIP_AVATAR_KILLSPRITE
		:parameters (?x - chip ?y - avatar ?c - cell)
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

	(:action FEETWEAR_AVATAR_COLLECTRESOURCE
		:parameters (?x - feetwear ?y - avatar ?c - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
					)
		:effect (and
					(object-dead ?x)
					(got-resource-feetwear ?x)
				)
	)

	(:action AVATAR_ICE_KILLIFOTHERHASLESS
		:parameters (?x - avatar ?y - ice ?c - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
					)
		:effect (and
					(object-dead ?x)
				)
	)

	(:action AVATAR_FIRE_KILLIFOTHERHASLESS
		:parameters (?x - avatar ?y - fire ?c - cell)
		:precondition (and
						(turn-interactions)
						(not (= ?x ?y))
						(at ?c ?x)
						(at ?c ?y)
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
