(define (domain BoulderDash)
  (:requirements :strips :typing :adl :negative-preconditions :equality)

  (:types
    Bat Scorpion - Enemy
    Gem Player Boulder Enemy Exit - Locatable
    Cell
  )

  (:predicates
    (at ?l - Locatable ?c -Cell)
    (oriented-up ?p - Player)
    (oriented-down ?p - Player)
    (oriented-left ?p - Player)
    (oriented-right ?p - Player)
    (connected-up ?c1 ?c2 - Cell)
    (connected-down ?c1 ?c2 - Cell)
    (connected-left ?c1 ?c2 - Cell)
    (connected-right ?c1 ?c2 - Cell)
    (terrain-ground ?c - Cell)
    (terrain-wall ?c - Cell)
    (terrain-empty ?c - Cell)
    (got ?g - Gem)
    (exited-level)
    (occupied ?c - Cell)
  )

  (:action turn-up
    :parameters (?p - Plyyer)
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
      (not (occupied ?c2))
      (not (terrain-wall ?c2))
    )
    :effect (and
      (when
        (not (terrain-empty ?c2))
        (terrain-empty ?c2)
      )
      (not (at ?p ?c1))
      (at ?p ?c2)
    )
  )

  (:action move-down
    :parameters (?p - Player ?c1 ?c2 - Cell)
    :precondition (and
      (at ?p ?c1)
      (oriented-down ?p)
      (connected-down ?c1 ?c2)
      (not (occupied ?c2))
      (not (terrain-wall ?c2))
    )
    :effect (and
      (when
        (not (terrain-empty ?c2))
        (terrain-empty ?c2)
      )
      (not (at ?p ?c1))
      (at ?p ?c2)
    )
  )

  (:action move-left
    :parameters (?p - Player ?c1 ?c2 - Cell)
    :precondition (and
      (at ?p ?c1)
      (oriented-left ?p)
      (connected-left ?c1 ?c2)
      (not (occupied ?c2))
      (not (terrain-wall ?c2))
    )
    :effect (and
      (when
        (not (terrain-empty ?c2))
        (terrain-empty ?c2)
      )
      (not (at ?p ?c1))
      (at ?p ?c2)
    )
  )

  (:action move-right
    :parameters (?p - Player ?c1 ?c2 - Cell)
    :precondition (and
      (at ?p ?c1)
      (oriented-right ?p)
      (connected-right ?c1 ?c2)
      (not (occupied ?c2))
      (not (terrain-wall ?c2))
    )
    :effect (and
      (when
        (not (terrain-empty ?c2))
        (terrain-empty ?c2)
      )
      (not (at ?p ?c1))
      (at ?p ?c2)
    )
  )
  
  (:action move-up-get-gem
    :parameters (?p - Player ?c1 ?c2 - Cell ?g - Gem)
    :precondition (and
      (at ?p ?c1)
      (oriented-up ?p)
      (connected-up ?c1 ?c2)
      (occupied ?c2)
      (at ?g ?c2)
      (not (terrain-wall ?c2))
    )
    :effect (and
      (not (at ?p ?c1))
      (at ?p ?c2)
      (got ?g)
      (not (at ?g ?c2))
    )
  )

  (:action move-down-get-gem
    :parameters (?p - Player ?c1 ?c2 - Cell ?g - Gem)
    :precondition (and
      (at ?p ?c1)
      (oriented-down ?p)
      (connected-down ?c1 ?c2)
      (occupied ?c2)
      (at ?g ?c2)
      (not (terrain-wall ?c2))
    )
    :effect (and
      (not (at ?p ?c1))
      (at ?p ?c2)
      (got ?g)
      (not (at ?g ?c2))
    )
  )

  (:action move-left-get-gem
    :parameters (?p - Player ?c1 ?c2 - Cell ?g - Gem)
    :precondition (and
      (at ?p ?c1)
      (oriented-left ?p)
      (connected-left ?c1 ?c2)
      (occupied ?c2)
      (at ?g ?c2)
      (not (terrain-wall ?c2))
    )
    :effect (and
      (not (at ?p ?c1))
      (at ?p ?c2)
      (got ?g)
      (not (at ?g ?c2))
    )
  )

  (:action move-right-get-gem
    :parameters (?p - Player ?c1 ?c2 - Cell ?g - Gem)
    :precondition (and
      (at ?p ?c1)
      (oriented-right ?p)
      (connected-right ?c1 ?c2)
      (occupied ?c2)
      (at ?g ?c2)
      (not (terrain-wall ?c2))
    )
    :effect (and
      (not (at ?p ?c1))
      (at ?p ?c2)
      (got ?g)
      (not (at ?g ?c2))
    )
  )

  (:action dig-up
    :parameters (?p - Player ?c1 ?c2 - Cell ?b - Boulder)
    :precondition (and
      (at ?p ?c1)
      (at ?b ?c2)
      (occupied ?c2)
      (oriented-up ?p)
      (connected-up ?c1 ?c2)
    )
    :effect (and
      (not (at ?b ?c2))
      (not (occupied ?c2))
    )
  )

  (:action dig-down
    :parameters (?p - Player ?c1 ?c2 - Cell ?b - Boulder)
    :precondition (and
      (at ?p ?c1)
      (at ?b ?c2)
      (occupied ?c2)
      (oriented-down ?p)
      (connected-down ?c1 ?c2)
    )
    :effect (and
      (not (at ?b ?c2))
      (not (occupied ?c2))
    )
  )

  (:action dig-left
    :parameters (?p - Player ?c1 ?c2 - Cell ?b - Boulder)
    :precondition (and
      (at ?p ?c1)
      (at ?b ?c2)
      (occupied ?c2)
      (oriented-left ?p)
      (connected-left ?c1 ?c2)
    )
    :effect (and
      (not (at ?b ?c2))
      (not (occupied ?c2))
    )
  )

  (:action dig-right
    :parameters (?p - Player ?c1 ?c2 - Cell ?b - Boulder)
    :precondition (and
      (at ?p ?c1)
      (at ?b ?c2)
      (occupied ?c2)
      (oriented-right ?p)
      (connected-right ?c1 ?c2)
    )
    :effect (and
      (not (at ?b ?c2))
      (not (occupied ?c2))
    )
  )

  (:action exit-level
    :parameters (?p - Player ?c - Cell ?e - Exit)
    :precondition (and
      (at ?p ?c)
      (at ?e ?c)
    )
    :effect (and
      (not (at ?p ?c))
      (exited-level)
    )
  )
)
