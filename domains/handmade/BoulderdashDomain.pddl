(define (domain BoulderDash)
  (:requirements :strips :typing :adl :negative-preconditions :equality :fluents)

  (:types
    Bat Scorpion - Enemy
    Gem Player Boulder Enemy Exit Wall - Locatable
    Cell
  )

  (:predicates
    (at ?l - Locatable ?c - Cell)
    (oriented-up ?p - Player)
    (oriented-down ?p - Player)
    (oriented-left ?p - Player)
    (oriented-right ?p - Player)
    (connected-up ?c1 ?c2 - Cell)
    (connected-down ?c1 ?c2 - Cell)
    (connected-left ?c1 ?c2 - Cell)
    (connected-right ?c1 ?c2 - Cell)
    (cannot-move ?p - Player)
    (exited-level)
  )

  (:functions
    (collected)
  )

  (:action turn-up
    :parameters (?p - Player)
    :precondition (and
      (not (oriented-up ?p))
    )
    :effect (and 
      (when
        (oriented-left ?p)
        (not (oriented-left ?p))
      )
      (when
        (oriented-right ?p)
        (not (oriented-right ?p))
      )
      (when
        (oriented-down ?p)
        (not (oriented-down ?p))
      )
      (oriented-up ?p)
    )
  )

  (:action turn-down
    :parameters (?p - Player)
    :precondition (and
      (not (oriented-down ?p))
    )
    :effect (and 
      (when
        (oriented-left ?p)
        (not (oriented-left ?p))
      )
      (when
        (oriented-right ?p)
        (not (oriented-right ?p))
      )
      (when
        (oriented-up ?p)
        (not (oriented-up ?p))
      )
      (oriented-down ?p)
    )
  )

  (:action turn-left
    :parameters (?p - Player)
    :precondition (and
      (not (oriented-left ?p))
    )
    :effect (and 
      (when
        (oriented-up ?p)
        (not (oriented-up ?p))
      )
      (when
        (oriented-right ?p)
        (not (oriented-right ?p))
      )
      (when
        (oriented-down ?p)
        (not (oriented-down ?p))
      )
      (oriented-left ?p)
    )
  )

  (:action turn-right
    :parameters (?p - Player)
    :precondition (and
      (not (oriented-right ?p))
    )
    :effect (and 
      (when
        (oriented-left ?p)
        (not (oriented-left ?p))
      )
      (when
        (oriented-up ?p)
        (not (oriented-up ?p))
      )
      (when
        (oriented-down ?p)
        (not (oriented-down ?p))
      )
      (oriented-right ?p)
    )
  )

  (:action move-up
    :parameters (?p - Player ?c1 ?c2 - Cell)
    :precondition (and
      (at ?p ?c1)
      (oriented-up ?p)
      (connected-up ?c1 ?c2)
      (not (cannot-move ?p))
      (not (exists (?b - Boulder) (at ?b ?c2)))
      (not (exists (?w - Wall) (at ?w ?c2)))
    )
    :effect (and
      (not (at ?p ?c1))
      (at ?p ?c2)
      (when
        (exists (?e - Exit) (at ?e ?c2))
        (cannot-move ?p)
      )
    )
  )

  (:action move-down
    :parameters (?p - Player ?c1 ?c2 - Cell)
    :precondition (and
      (at ?p ?c1)
      (oriented-down ?p)
      (connected-down ?c1 ?c2)
      (not (cannot-move ?p))
      (not (exists (?b - Boulder) (at ?b ?c2)))
      (not (exists (?w - Wall) (at ?w ?c2)))
    )
    :effect (and
      (not (at ?p ?c1))
      (at ?p ?c2)
      (when
        (exists (?e - Exit) (at ?e ?c2))
        (cannot-move ?p)
      )
    )
  )

  (:action move-left
    :parameters (?p - Player ?c1 ?c2 - Cell)
    :precondition (and
      (at ?p ?c1)
      (oriented-left ?p)
      (connected-left ?c1 ?c2)
      (not (cannot-move ?p))
      (not (exists (?b - Boulder) (at ?b ?c2)))
      (not (exists (?w - Wall) (at ?w ?c2)))
    )
    :effect (and
      (not (at ?p ?c1))
      (at ?p ?c2)
      (when
        (exists (?e - Exit) (at ?e ?c2))
        (cannot-move ?p)
      )
    )
  )

  (:action move-right
    :parameters (?p - Player ?c1 ?c2 - Cell)
    :precondition (and
      (at ?p ?c1)
      (oriented-right ?p)
      (connected-right ?c1 ?c2)
      (not (cannot-move ?p))
      (not (exists (?b - Boulder) (at ?b ?c2)))
      (not (exists (?w - Wall) (at ?w ?c2)))
    )
    :effect (and
      (not (at ?p ?c1))
      (at ?p ?c2)
      (when
        (exists (?e - Exit) (at ?e ?c2))
        (cannot-move ?p)
      )
    )
  )

  (:action dig-up
    :parameters (?p - Player ?c1 ?c2 - Cell ?b - Boulder)
    :precondition (and
      (at ?p ?c1)
      (at ?b ?c2)
      (oriented-up ?p)
      (connected-up ?c1 ?c2)
    )
    :effect (and
      (not (at ?b ?c2))
    )
  )

  (:action dig-down
    :parameters (?p - Player ?c1 ?c2 - Cell ?b - Boulder)
    :precondition (and
      (at ?p ?c1)
      (at ?b ?c2)
      (oriented-down ?p)
      (connected-down ?c1 ?c2)
    )
    :effect (and
      (not (at ?b ?c2))
    )
  )

  (:action dig-left
    :parameters (?p - Player ?c1 ?c2 - Cell ?b - Boulder)
    :precondition (and
      (at ?p ?c1)
      (at ?b ?c2)
      (oriented-left ?p)
      (connected-left ?c1 ?c2)
    )
    :effect (and
      (not (at ?b ?c2))
    )
  )

  (:action dig-right
    :parameters (?p - Player ?c1 ?c2 - Cell ?b - Boulder)
    :precondition (and
      (at ?p ?c1)
      (at ?b ?c2)
      (oriented-right ?p)
      (connected-right ?c1 ?c2)
    )
    :effect (and
      (not (at ?b ?c2))
    )
  )

  (:action get-gem
    :parameters (?p - Player ?c - Cell ?g - Gem)
    :precondition (and
      (at ?p ?c)
      (at ?g ?c)
    )
    :effect (and
      (not (at ?g ?c))
      (increase (collected) 1)
    )
  )

  (:action exit-level
    :parameters (?p - Player ?c - Cell ?e - Exit)
    :precondition (and
      (at ?p ?c)
      (at ?e ?c)
      (= (collected) 9)
    )
    :effect (and
      (not (at ?p ?c))
      (exited-level)
    )
  )
)
