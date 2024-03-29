(define (problem VGDLGameProblem)
    (:domain VGDLGame)
    (:objects
        box_6_1 box_10_1 box_2_2 box_3_2 box_4_2 box_5_2 box_6_2 box_10_2 box_1_3 box_2_3 box_10_3 box_4_4 box_5_4 box_6_4 box_7_4 box_8_4 box_9_4 box_10_4 box_1_5 box_2_5 box_3_5 box_4_5 box_7_6 box_8_6 box_9_6 box_10_6 box_11_6 box_1_7 box_2_7 box_3_7 box_4_7 box_5_7 box_6_7 box_7_7 box_11_7 box_9_9 - box
        avatar - avatar
        goal_11_1 - goal
        mushroom_1_8 - mushroom
        key_11_9 - key
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
        (oriented-none avatar)
        (at n1 n1 avatar)
        (at n6 n1 box_6_1)
        (is-hole n7 n1)
        (is-hole n8 n1)
        (is-hole n9 n1)
        (at n10 n1 box_10_1)
        (at n11 n1 goal_11_1)
        (is-wall n12 n1)
        (is-wall n0 n2)
        (at n2 n2 box_2_2)
        (at n3 n2 box_3_2)
        (at n4 n2 box_4_2)
        (at n5 n2 box_5_2)
        (at n6 n2 box_6_2)
        (is-hole n7 n2)
        (is-hole n8 n2)
        (is-hole n9 n2)
        (at n10 n2 box_10_2)
        (is-wall n12 n2)
        (is-wall n0 n3)
        (at n1 n3 box_1_3)
        (at n2 n3 box_2_3)
        (is-hole n3 n3)
        (is-hole n4 n3)
        (is-hole n5 n3)
        (is-hole n6 n3)
        (is-hole n7 n3)
        (is-hole n8 n3)
        (is-hole n9 n3)
        (at n10 n3 box_10_3)
        (is-wall n12 n3)
        (is-wall n0 n4)
        (is-hole n1 n4)
        (is-hole n2 n4)
        (is-hole n3 n4)
        (at n4 n4 box_4_4)
        (at n5 n4 box_5_4)
        (at n6 n4 box_6_4)
        (at n7 n4 box_7_4)
        (at n8 n4 box_8_4)
        (at n9 n4 box_9_4)
        (at n10 n4 box_10_4)
        (is-wall n12 n4)
        (is-wall n0 n5)
        (at n1 n5 box_1_5)
        (at n2 n5 box_2_5)
        (at n3 n5 box_3_5)
        (at n4 n5 box_4_5)
        (is-wall n12 n5)
        (is-wall n0 n6)
        (at n7 n6 box_7_6)
        (at n8 n6 box_8_6)
        (at n9 n6 box_9_6)
        (at n10 n6 box_10_6)
        (at n11 n6 box_11_6)
        (is-wall n12 n6)
        (is-wall n0 n7)
        (at n1 n7 box_1_7)
        (at n2 n7 box_2_7)
        (at n3 n7 box_3_7)
        (at n4 n7 box_4_7)
        (at n5 n7 box_5_7)
        (at n6 n7 box_6_7)
        (at n7 n7 box_7_7)
        (is-hole n8 n7)
        (is-hole n9 n7)
        (is-hole n10 n7)
        (at n11 n7 box_11_7)
        (is-wall n12 n7)
        (is-wall n0 n8)
        (at n1 n8 mushroom_1_8)
        (is-hole n2 n8)
        (is-hole n3 n8)
        (is-hole n4 n8)
        (is-hole n5 n8)
        (is-hole n6 n8)
        (is-hole n7 n8)
        (is-hole n8 n8)
        (is-hole n9 n8)
        (is-hole n10 n8)
        (is-hole n11 n8)
        (is-wall n12 n8)
        (is-wall n0 n9)
        (is-hole n1 n9)
        (is-hole n2 n9)
        (is-hole n3 n9)
        (is-hole n4 n9)
        (is-hole n5 n9)
        (is-hole n6 n9)
        (is-hole n7 n9)
        (is-hole n8 n9)
        (at n9 n9 box_9_9)
        (is-hole n10 n9)
        (at n11 n9 key_11_9)
        (is-wall n12 n9)
        (is-wall n0 n10)
        (is-wall n1 n10)
        (is-wall n2 n10)
        (is-wall n3 n10)
        (is-wall n4 n10)
        (is-wall n5 n10)
        (is-wall n6 n10)
        (is-wall n7 n10)
        (is-wall n8 n10)
        (is-wall n9 n10)
        (is-wall n10 n10)
        (is-wall n11 n10)
        (is-wall n12 n10)
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