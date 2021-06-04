(define (problem VGDLGameProblem)
    (:domain VGDLGame)
    (:objects
        box_4_3 box_2_4 box_3_4 - box
        avatar - avatar
        hole_3_1 hole_3_2 hole_1_4 - hole
        n0 n1 n2 n3 n4 n5 n6 - num
    )
    (:init
        (is-wall n0 n0)
        (is-wall n1 n0)
        (is-wall n2 n0)
        (is-wall n3 n0)
        (is-wall n4 n0)
        (is-wall n5 n0)
        (is-wall n6 n0)
        (is-wall n0 n1)
        (at n3 n1 hole_3_1)
        (oriented-none avatar)
        (at n4 n1 avatar)
        (is-wall n6 n1)
        (is-wall n0 n2)
        (is-wall n2 n2)
        (at n3 n2 hole_3_2)
        (is-wall n4 n2)
        (is-wall n6 n2)
        (is-wall n0 n3)
        (at n4 n3 box_4_3)
        (is-wall n6 n3)
        (is-wall n0 n4)
        (at n1 n4 hole_1_4)
        (at n2 n4 box_2_4)
        (at n3 n4 box_3_4)
        (is-wall n5 n4)
        (is-wall n6 n4)
        (is-wall n0 n5)
        (is-wall n3 n5)
        (is-wall n4 n5)
        (is-wall n5 n5)
        (is-wall n6 n5)
        (is-wall n0 n6)
        (is-wall n1 n6)
        (is-wall n2 n6)
        (is-wall n3 n6)
        (is-wall n4 n6)
        (is-wall n5 n6)
        (is-wall n6 n6)
        (next n0 n1)
        (next n1 n2)
        (next n2 n3)
        (next n3 n4)
        (next n4 n5)
        (next n5 n6)
        (previous n1 n0)
        (previous n2 n1)
        (previous n3 n2)
        (previous n4 n3)
        (previous n5 n4)
        (previous n6 n5)
        (turn-avatar)
    )
    (:goal
        (AND
            (forall (?o - box) (object-dead ?o))
        )
    )
)