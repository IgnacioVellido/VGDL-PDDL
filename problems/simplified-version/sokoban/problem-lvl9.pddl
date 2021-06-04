(define (problem VGDLGameProblem)
    (:domain VGDLGame)
    (:objects
        box_6_2 box_4_3 box_9_3 box_3_4 box_5_4 box_8_4 box_9_5 box_2_6 box_5_6 box_6_6 box_8_6 - box
        avatar - avatar
        hole_1_1 hole_5_1 hole_9_2 hole_6_3 hole_4_6 - hole
        n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 - num
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
        (is-wall n11 n0)
        (is-wall n12 n0)
        (is-wall n0 n1)
        (at n1 n1 hole_1_1)
        (at n5 n1 hole_5_1)
        (is-wall n12 n1)
        (is-wall n0 n2)
        (at n6 n2 box_6_2)
        (at n9 n2 hole_9_2)
        (is-wall n12 n2)
        (is-wall n0 n3)
        (at n4 n3 box_4_3)
        (at n6 n3 hole_6_3)
        (at n9 n3 box_9_3)
        (is-wall n12 n3)
        (is-wall n0 n4)
        (at n3 n4 box_3_4)
        (at n5 n4 box_5_4)
        (at n8 n4 box_8_4)
        (is-wall n12 n4)
        (is-wall n0 n5)
        (at n9 n5 box_9_5)
        (is-wall n12 n5)
        (is-wall n0 n6)
        (at n2 n6 box_2_6)
        (at n4 n6 hole_4_6)
        (at n5 n6 box_5_6)
        (at n6 n6 box_6_6)
        (at n8 n6 box_8_6)
        (is-wall n12 n6)
        (is-wall n0 n7)
        (oriented-none avatar)
        (at n11 n7 avatar)
        (is-wall n12 n7)
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
        (is-wall n11 n8)
        (is-wall n12 n8)
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
        (next n10 n11)
        (next n11 n12)
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
        (previous n11 n10)
        (previous n12 n11)
        (turn-avatar)
    )
    (:goal
        (AND
            (forall (?o - box) (object-dead ?o))
        )
    )
)