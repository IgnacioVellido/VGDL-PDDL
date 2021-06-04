(define (domain LabyrinthDual)
  (:requirements :strips :typing :adl :negative-preconditions)
  (:types
    Avatar Wall BlueWall RedWall Trap Suit Exit - Locatable
    Cell
  )
  
  (:predicates
    (at ?l - Locatable ?c - Cell)
    (traversable ?c - Cell)
    (needs-suit ?c - Cell)
    (red-suit ?s - Suit)
    (blue-suit ?s - Suit)
    (has-red-suit ?a - Avatar)
    (has-blue-suit ?a - Avatar)
    (connected-up ?c1 ?c2 - Cell)
    (connected-down ?c1 ?c2 - Cell)
    (connected-left ?c1 ?c2 - Cell)
    (connected-right ?c1 ?c2 - Cell)
    (exited-level ?a - Avatar)
  )
  
  ;; Acciones basicas de movimiento
  (:action move-up
    :parameters (?a - Avatar ?c1 ?c2 - Cell)
    :precondition (and
      (at ?a ?c1)
      (connected-up ?c1 ?c2)
      (traversable ?c2)
      (not (needs-suit ?c2))
    )
    :effect (and
      (not (at ?a ?c1))
      (at ?a ?c2)
    )
  )
  
  (:action move-down
    :parameters (?a - Avatar ?c1 ?c2 - Cell)
    :precondition (and
      (at ?a ?c1)
      (connected-down ?c1 ?c2)
      (traversable ?c2)
      (not (needs-suit ?c2))
    )
    :effect (and
      (not (at ?a ?c1))
      (at ?a ?c2)
    )
  )
  
  (:action move-left
    :parameters (?a - Avatar ?c1 ?c2 - Cell)
    :precondition (and
      (at ?a ?c1)
      (connected-left ?c1 ?c2)
      (traversable ?c2)
      (not (needs-suit ?c2))
    )
    :effect (and
      (not (at ?a ?c1))
      (at ?a ?c2)
    )
  )
  
  (:action move-right
    :parameters (?a - Avatar ?c1 ?c2 - Cell)
    :precondition (and
      (at ?a ?c1)
      (connected-right ?c1 ?c2)
      (traversable ?c2)
      (not (needs-suit ?c2))
    )
    :effect (and
      (not (at ?a ?c1))
      (at ?a ?c2)
    )
  )
  
  (:action pick-suit
    :parameters (?a - Avatar ?c - Cell ?s - Suit)
    :precondition (and
      (at ?a ?c)
      (at ?s ?c)
    )
    :effect (and
      (when
        (blue-suit ?s)
        (has-blue-suit ?a)
      )
      (when
        (red-suit ?s)
        (has-red-suit ?a)
      )
      (not (at ?s ?c))
    )
  )
  
  ;; Acciones para el muro azul
  (:action move-up-blue
    :parameters (?a - Avatar ?c1 ?c2 - Cell ?bw - BlueWall)
    :precondition (and
      (at ?a ?c1)
      (connected-up ?c1 ?c2)
      (traversable ?c2)
      (needs-suit ?c2)
      (at ?bw ?c2)
      (has-blue-suit ?a)
    )
    :effect (and
      (not (at ?a ?c1))
      (at ?a ?c2)
    )
  )
  
  (:action move-down-blue
    :parameters (?a - Avatar ?c1 ?c2 - Cell ?bw - BlueWall)
    :precondition (and
      (at ?a ?c1)
      (connected-down ?c1 ?c2)
      (traversable ?c2)
      (needs-suit ?c2)
      (at ?bw ?c2)
      (has-blue-suit ?a)
    )
    :effect (and
      (not (at ?a ?c1))
      (at ?a ?c2)
    )
  )
  
  (:action move-left-blue
    :parameters (?a - Avatar ?c1 ?c2 - Cell ?bw - BlueWall)
    :precondition (and
      (at ?a ?c1)
      (connected-left ?c1 ?c2)
      (traversable ?c2)
      (needs-suit ?c2)
      (at ?bw ?c2)
      (has-blue-suit ?a)
    )
    :effect (and
      (not (at ?a ?c1))
      (at ?a ?c2)
    )
  )
  
  (:action move-right-blue
    :parameters (?a - Avatar ?c1 ?c2 - Cell ?bw - BlueWall)
    :precondition (and
      (at ?a ?c1)
      (connected-right ?c1 ?c2)
      (traversable ?c2)
      (needs-suit ?c2)
      (at ?bw ?c2)
      (has-blue-suit ?a)
    )
    :effect (and
      (not (at ?a ?c1))
      (at ?a ?c2)
    )
  )
  
  ;; Acciones para el muro rojo
  (:action move-up-red
    :parameters (?a - Avatar ?c1 ?c2 - Cell ?rw - RedWall)
    :precondition (and
      (at ?a ?c1)
      (connected-up ?c1 ?c2)
      (traversable ?c2)
      (needs-suit ?c2)
      (at ?rw ?c2)
      (has-red-suit ?a)
    )
    :effect (and
      (not (at ?a ?c1))
      (at ?a ?c2)
    )
  )
  
  (:action move-down-red
    :parameters (?a - Avatar ?c1 ?c2 - Cell ?rw - RedWall)
    :precondition (and
      (at ?a ?c1)
      (connected-down ?c1 ?c2)
      (traversable ?c2)
      (needs-suit ?c2)
      (at ?rw ?c2)
      (has-red-suit ?a)
    )
    :effect (and
      (not (at ?a ?c1))
      (at ?a ?c2)
    )
  )
  
  (:action move-left-red
    :parameters (?a - Avatar ?c1 ?c2 - Cell ?rw - RedWall)
    :precondition (and
      (at ?a ?c1)
      (connected-left ?c1 ?c2)
      (traversable ?c2)
      (needs-suit ?c2)
      (at ?rw ?c2)
      (has-red-suit ?a)
    )
    :effect (and
      (not (at ?a ?c1))
      (at ?a ?c2)
    )
  )
  
  (:action move-right-red
    :parameters (?a - Avatar ?c1 ?c2 - Cell ?rw - RedWall)
    :precondition (and
      (at ?a ?c1)
      (connected-right ?c1 ?c2)
      (traversable ?c2)
      (needs-suit ?c2)
      (at ?rw ?c2)
      (has-red-suit ?a)
    )
    :effect (and
      (not (at ?a ?c1))
      (at ?a ?c2)
    )
  )
  
  ;; Salir del nivel
  (:action exit-level
    :parameters (?a - Avatar ?e - Exit ?c - Cell)
    :precondition (and
      (at ?a ?c)
      (at ?e ?c)
    )
    :effect (and
      (not (at ?a ?c))
      (exited-level ?a)
    )
  )
)
