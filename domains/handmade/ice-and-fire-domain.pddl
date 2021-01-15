(define (domain IceAndFire)
  (:requirements :strips :typing :adl :negative-preconditions)
    
  (:types
    Avatar Tree Coin Trap Boots Ice Fire Exit - Locatable
    Cell
  )
    
  (:predicates
    (has-fire-boots ?a - Avatar)
    (has-ice-boots ?a - Avatar)
    (has-hazard ?c - Cell)
    (fire-boots ?b - Boots)
    (ice-boots ?b - Boots)
    (empty ?c - Cell)
    (non-traversable ?c - Cell)
    (at ?l - Locatable ?c - Cell)
    (connected-up ?c1 ?c2 - Cell)
    (connected-down ?c1 ?c2 - Cell)
    (connected-left ?c1 ?c2 - Cell)
    (connected-right ?c1 ?c2 - Cell)
    (exited-level ?a - Avatar)
  )
  
  (:action move-up
    :parameters (?a - Avatar ?c1 ?c2 - Cell)
    :precondition (and
      (at ?a ?c1)
      (connected-up ?c1 ?c2)
      (not (has-hazard ?c2))
      (not (non-traversable ?c2))
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
      (not (has-hazard ?c2))
      (not (non-traversable ?c2))
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
      (not (has-hazard ?c2))
      (not (non-traversable ?c2))
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
      (not (has-hazard ?c2))
      (not (non-traversable ?c2))
    )
    :effect (and
      (not (at ?a ?c1))
      (at ?a ?c2)
    )
  )
  
  (:action pick-boots
    :parameters (?a - Avatar ?c - Cell ?b - Boots)
    :precondition (and
      (at ?a ?c)
      (at ?b ?c)
    )
    :effect (and
      (when
        (fire-boots ?b)
        (has-fire-boots ?a)
      )
      (when
        (ice-boots ?b)
        (has-ice-boots ?a)
      )
      (not (at ?b ?c))
    )
  )
  
  ;; Movimientos con botas de hielo
  
  (:action move-up-ice
    :parameters (?a - Avatar ?c1 ?c2 - Cell ?i - Ice)
    :precondition (and
      (at ?a ?c1)
      (connected-up ?c1 ?c2)
      (has-ice-boots ?a)
      (has-hazard ?c2)
      (at ?i ?c2)
    )
    :effect (and
      (not (at ?a ?c1))
      (at ?a ?c2)
    )
  )
  
  (:action move-down-ice
    :parameters (?a - Avatar ?c1 ?c2 - Cell ?i - Ice)
    :precondition (and
      (at ?a ?c1)
      (connected-down ?c1 ?c2)
      (has-ice-boots ?a)
      (has-hazard ?c2)
      (at ?i ?c2)
    )
    :effect (and
      (not (at ?a ?c1))
      (at ?a ?c2)
    )
  )
  
  (:action move-left-ice
    :parameters (?a - Avatar ?c1 ?c2 - Cell ?i - Ice)
    :precondition (and
      (at ?a ?c1)
      (connected-left ?c1 ?c2)
      (has-ice-boots ?a)
      (has-hazard ?c2)
      (at ?i ?c2)
    )
    :effect (and
      (not (at ?a ?c1))
      (at ?a ?c2)
    )
  )
  
  (:action move-right-ice
    :parameters (?a - Avatar ?c1 ?c2 - Cell ?i - Ice)
    :precondition (and
      (at ?a ?c1)
      (connected-right ?c1 ?c2)
      (has-ice-boots ?a)
      (has-hazard ?c2)
      (at ?i ?c2)
    )
    :effect (and
      (not (at ?a ?c1))
      (at ?a ?c2)
    )
  )
  
  ;; Movimientos con botas de fuego
  
  (:action move-up-fire
    :parameters (?a - Avatar ?c1 ?c2 - Cell ?f - Fire)
    :precondition (and
      (at ?a ?c1)
      (connected-up ?c1 ?c2)
      (has-fire-boots ?a)
      (has-hazard ?c2)
      (at ?f ?c2)
    )
    :effect (and
      (not (at ?a ?c1))
      (at ?a ?c2)
    )
  )
  
  (:action move-down-fire
    :parameters (?a - Avatar ?c1 ?c2 - Cell ?f - Fire)
    :precondition (and
      (at ?a ?c1)
      (connected-down ?c1 ?c2)
      (has-fire-boots ?a)
      (has-hazard ?c2)
      (at ?f ?c2)
    )
    :effect (and
      (not (at ?a ?c1))
      (at ?a ?c2)
    )
  )
  
  (:action move-left-fire
    :parameters (?a - Avatar ?c1 ?c2 - Cell ?f - Fire)
    :precondition (and
      (at ?a ?c1)
      (connected-left ?c1 ?c2)
      (has-fire-boots ?a)
      (has-hazard ?c2)
      (at ?f ?c2)
    )
    :effect (and
      (not (at ?a ?c1))
      (at ?a ?c2)
    )
  )
  
  (:action move-right-fire
    :parameters (?a - Avatar ?c1 ?c2 - Cell ?f - Fire)
    :precondition (and
      (at ?a ?c1)
      (connected-right ?c1 ?c2)
      (has-fire-boots ?a)
      (has-hazard ?c2)
      (at ?f ?c2)
    )
    :effect (and
      (not (at ?a ?c1))
      (at ?a ?c2)
    )
  )
  
  ;; Salir del nivel
  (:action exit-level
    :parameters (?a - Avatar ?c - Cell ?e - Exit)
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
