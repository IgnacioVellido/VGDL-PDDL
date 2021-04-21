(define (problem VGDLGameProblem)
    (:domain VGDLGame)
    (:objects
        box_4_2 box_9_2 box_4_3 - box
        avatar - avatar
        hole_3_2 hole_5_4 hole_9_7 - hole
        n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 - num
    )
    (:init
        (is-wall n0 n0)
        (is-wall n1 n0)
        (is-wall n2 n0)
        (is-wall n3 n0)
        (is-wall n4 n0)
        (is-wall n5 n0)
        (is-wall n6 n0)
        (is-wall n7 n0)
        (is-wall n8 n0)
        (is-wall n9 n0)
        (is-wall n10 n0)
        (is-wall n0 n1)
        (is-wall n4 n1)
        (is-wall n10 n1)
        (is-wall n0 n2)
        (is-wall n2 n2)
        (at n3 n2 hole_3_2)
        (at n4 n2 box_4_2)
        (is-wall n6 n2)
        (is-wall n7 n2)
        (at n9 n2 box_9_2)
        (is-wall n10 n2)
        (is-wall n0 n3)
        (at n4 n3 box_4_3)
        (is-wall n10 n3)
        (is-wall n0 n4)
        (is-wall n1 n4)
        (is-wall n2 n4)
        (is-wall n3 n4)
        (is-wall n4 n4)
        (at n5 n4 hole_5_4)
        (is-wall n10 n4)
        (is-wall n0 n5)
        (is-wall n1 n5)
        (is-wall n10 n5)
        (is-wall n0 n6)
        (is-wall n1 n6)
        (is-wall n4 n6)
        (is-wall n7 n6)
        (oriented-none avatar)
        (at n9 n6 avatar)
        (is-wall n10 n6)
        (is-wall n0 n7)
        (is-wall n1 n7)
        (is-wall n4 n7)
        (is-wall n7 n7)
        (at n9 n7 hole_9_7)
        (is-wall n10 n7)
        (is-wall n0 n8)
        (is-wall n1 n8)
        (is-wall n2 n8)
        (is-wall n3 n8)
        (is-wall n4 n8)
        (is-wall n5 n8)
        (is-wall n6 n8)
        (is-wall n7 n8)
        (is-wall n8 n8)
        (is-wall n9 n8)
        (is-wall n10 n8)
        (next n0 n1)
        (next n1 n2)
        (next n2 n3)
        (next n3 n4)
        (next n4 n5)
        (next n5 n6)
        (next n6 n7)
        (next n7 n8)
        (next n8 n9)
        (next n9 n10)
        (previous n1 n0)
        (previous n2 n1)
        (previous n3 n2)
        (previous n4 n3)
        (previous n5 n4)
        (previous n6 n5)
        (previous n7 n6)
        (previous n8 n7)
        (previous n9 n8)
        (previous n10 n9)
        (turn-avatar)
    )
    (:goal
        (AND
            (forall (?o - box) (object-dead ?o))
        )
    )
)