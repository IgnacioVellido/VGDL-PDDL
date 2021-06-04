(define (problem VGDLGameProblem)
    (:domain VGDLGame)
    (:objects
        box_4_3 box_8_3 - box
        avatar - avatar
        goal_1_1 - goal
        mushroom_3_7 mushroom_5_7 mushroom_7_7 mushroom_9_7 - mushroom
        key_11_1 - key
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
        (at n1 n1 goal_1_1)
        (is-wall n2 n1)
        (oriented-none avatar)
        (at n6 n1 avatar)
        (is-wall n10 n1)
        (at n11 n1 key_11_1)
        (is-wall n12 n1)
        (is-wall n0 n2)
        (is-wall n2 n2)
        (is-wall n10 n2)
        (is-wall n12 n2)
        (is-wall n0 n3)
        (is-wall n2 n3)
        (at n4 n3 box_4_3)
        (at n8 n3 box_8_3)
        (is-wall n10 n3)
        (is-wall n12 n3)
        (is-wall n0 n4)
        (is-hole n1 n4)
        (is-wall n2 n4)
        (is-wall n10 n4)
        (is-hole n11 n4)
        (is-wall n12 n4)
        (is-wall n0 n5)
        (is-wall n12 n5)
        (is-wall n0 n6)
        (is-wall n3 n6)
        (is-wall n4 n6)
        (is-wall n5 n6)
        (is-wall n6 n6)
        (is-wall n7 n6)
        (is-wall n8 n6)
        (is-wall n9 n6)
        (is-wall n12 n6)
        (is-wall n0 n7)
        (at n3 n7 mushroom_3_7)
        (at n5 n7 mushroom_5_7)
        (at n7 n7 mushroom_7_7)
        (at n9 n7 mushroom_9_7)
        (is-wall n12 n7)
        (is-wall n0 n8)
        (is-wall n12 n8)
        (is-wall n0 n9)
        (is-wall n1 n9)
        (is-wall n2 n9)
        (is-wall n3 n9)
        (is-wall n4 n9)
        (is-wall n5 n9)
        (is-wall n6 n9)
        (is-wall n7 n9)
        (is-wall n8 n9)
        (is-wall n9 n9)
        (is-wall n10 n9)
        (is-wall n11 n9)
        (is-wall n12 n9)
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
        (got-resource-key n0)
    )
    (:goal
        (AND
            (forall (?o - goal) (object-dead ?o))
        )
    )
)