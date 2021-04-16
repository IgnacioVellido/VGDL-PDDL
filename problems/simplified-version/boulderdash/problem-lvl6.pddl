(define (problem VGDLGameProblem)
    (:domain VGDLGame)
    (:objects
        sword1 - sword
        exitdoor_5_2 - exitdoor
        avatar - avatar
        diamond_7_2 diamond_8_2 diamond_13_2 diamond_23_2 diamond_7_3 diamond_8_3 diamond_23_3 diamond_17_4 diamond_10_7 diamond_2_8 diamond_3_8 diamond_4_8 diamond_20_8 diamond_21_8 diamond_22_8 diamond_2_9 diamond_3_9 diamond_4_9 diamond_20_9 diamond_22_9 diamond_20_10 diamond_21_10 diamond_22_10 - diamond
        n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 n16 n17 n18 n19 n20 n21 n22 n23 n24 n25 - num
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
        (is-wall n13 n0)
        (is-wall n14 n0)
        (is-wall n15 n0)
        (is-wall n16 n0)
        (is-wall n17 n0)
        (is-wall n18 n0)
        (is-wall n19 n0)
        (is-wall n20 n0)
        (is-wall n21 n0)
        (is-wall n22 n0)
        (is-wall n23 n0)
        (is-wall n24 n0)
        (is-wall n25 n0)
        (is-wall n0 n1)
        (is-wall n25 n1)
        (is-wall n0 n2)
        (is-boulder n2 n2)
        (is-boulder n3 n2)
        (at n5 n2 exitdoor_5_2)
        (at n7 n2 diamond_7_2)
        (at n8 n2 diamond_8_2)
        (at n13 n2 diamond_13_2)
        (is-boulder n22 n2)
        (at n23 n2 diamond_23_2)
        (is-wall n25 n2)
        (is-wall n0 n3)
        (is-boulder n2 n3)
        (is-boulder n3 n3)
        (at n7 n3 diamond_7_3)
        (at n8 n3 diamond_8_3)
        (is-boulder n22 n3)
        (at n23 n3 diamond_23_3)
        (is-wall n25 n3)
        (is-wall n0 n4)
        (at n17 n4 diamond_17_4)
        (is-wall n25 n4)
        (is-wall n0 n5)
        (is-wall n25 n5)
        (is-wall n0 n6)
        (is-boulder n14 n6)
        (is-boulder n15 n6)
        (is-wall n25 n6)
        (is-wall n0 n7)
        (at n10 n7 diamond_10_7)
        (is-boulder n14 n7)
        (is-boulder n15 n7)
        (is-wall n25 n7)
        (is-wall n0 n8)
        (at n2 n8 diamond_2_8)
        (at n3 n8 diamond_3_8)
        (at n4 n8 diamond_4_8)
        (is-boulder n14 n8)
        (is-boulder n15 n8)
        (at n20 n8 diamond_20_8)
        (at n21 n8 diamond_21_8)
        (at n22 n8 diamond_22_8)
        (is-wall n25 n8)
        (is-wall n0 n9)
        (at n2 n9 diamond_2_9)
        (at n3 n9 diamond_3_9)
        (at n4 n9 diamond_4_9)
        (is-boulder n14 n9)
        (is-boulder n15 n9)
        (at n20 n9 diamond_20_9)
        (oriented-right avatar)
        (at n21 n9 avatar)
        (at n22 n9 diamond_22_9)
        (is-wall n25 n9)
        (is-wall n0 n10)
        (is-boulder n8 n10)
        (is-boulder n9 n10)
        (at n20 n10 diamond_20_10)
        (at n21 n10 diamond_21_10)
        (at n22 n10 diamond_22_10)
        (is-wall n25 n10)
        (is-wall n0 n11)
        (is-wall n25 n11)
        (is-wall n0 n12)
        (is-wall n1 n12)
        (is-wall n2 n12)
        (is-wall n3 n12)
        (is-wall n4 n12)
        (is-wall n5 n12)
        (is-wall n6 n12)
        (is-wall n7 n12)
        (is-wall n8 n12)
        (is-wall n9 n12)
        (is-wall n10 n12)
        (is-wall n11 n12)
        (is-wall n12 n12)
        (is-wall n13 n12)
        (is-wall n14 n12)
        (is-wall n15 n12)
        (is-wall n16 n12)
        (is-wall n17 n12)
        (is-wall n18 n12)
        (is-wall n19 n12)
        (is-wall n20 n12)
        (is-wall n21 n12)
        (is-wall n22 n12)
        (is-wall n23 n12)
        (is-wall n24 n12)
        (is-wall n25 n12)
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
        (next n12 n13)
        (next n13 n14)
        (next n14 n15)
        (next n15 n16)
        (next n16 n17)
        (next n17 n18)
        (next n18 n19)
        (next n19 n20)
        (next n20 n21)
        (next n21 n22)
        (next n22 n23)
        (next n23 n24)
        (next n24 n25)
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
        (previous n13 n12)
        (previous n14 n13)
        (previous n15 n14)
        (previous n16 n15)
        (previous n17 n16)
        (previous n18 n17)
        (previous n19 n18)
        (previous n20 n19)
        (previous n21 n20)
        (previous n22 n21)
        (previous n23 n22)
        (previous n24 n23)
        (previous n25 n24)
        (turn-avatar)
        (got-resource-diamond n0)
        (object-dead sword1)
    )
    (:goal
        (AND
            (forall (?o - exitdoor) (object-dead ?o))
        )
    )
)