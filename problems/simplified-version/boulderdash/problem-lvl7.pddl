(define (problem VGDLGameProblem)
    (:domain VGDLGame)
    (:objects
        dirt_1_1 dirt_2_1 dirt_3_1 dirt_4_1 dirt_5_1 dirt_7_1 dirt_8_1 dirt_9_1 dirt_10_1 dirt_11_1 dirt_12_1 dirt_13_1 dirt_14_1 dirt_15_1 dirt_16_1 dirt_17_1 dirt_18_1 dirt_19_1 dirt_20_1 dirt_21_1 dirt_22_1 dirt_23_1 dirt_24_1 dirt_1_2 dirt_4_2 dirt_9_2 dirt_10_2 dirt_13_2 dirt_14_2 dirt_17_2 dirt_18_2 dirt_21_2 dirt_24_2 dirt_1_3 dirt_4_3 dirt_5_3 dirt_9_3 dirt_10_3 dirt_13_3 dirt_14_3 dirt_15_3 dirt_16_3 dirt_17_3 dirt_18_3 dirt_21_3 dirt_24_3 dirt_1_4 dirt_2_4 dirt_3_4 dirt_4_4 dirt_5_4 dirt_6_4 dirt_7_4 dirt_8_4 dirt_9_4 dirt_10_4 dirt_11_4 dirt_12_4 dirt_13_4 dirt_14_4 dirt_15_4 dirt_16_4 dirt_17_4 dirt_18_4 dirt_21_4 dirt_22_4 dirt_23_4 dirt_24_4 dirt_1_5 dirt_2_5 dirt_3_5 dirt_4_5 dirt_9_5 dirt_10_5 dirt_11_5 dirt_12_5 dirt_13_5 dirt_14_5 dirt_15_5 dirt_16_5 dirt_17_5 dirt_18_5 dirt_21_5 dirt_22_5 dirt_23_5 dirt_24_5 dirt_1_6 dirt_2_6 dirt_3_6 dirt_4_6 dirt_9_6 dirt_11_6 dirt_12_6 dirt_13_6 dirt_16_6 dirt_17_6 dirt_18_6 dirt_19_6 dirt_20_6 dirt_21_6 dirt_22_6 dirt_23_6 dirt_24_6 dirt_1_7 dirt_2_7 dirt_3_7 dirt_4_7 dirt_5_7 dirt_6_7 dirt_7_7 dirt_8_7 dirt_9_7 dirt_10_7 dirt_11_7 dirt_12_7 dirt_13_7 dirt_16_7 dirt_17_7 dirt_18_7 dirt_20_7 dirt_21_7 dirt_22_7 dirt_23_7 dirt_24_7 dirt_1_8 dirt_5_8 dirt_6_8 dirt_12_8 dirt_13_8 dirt_16_8 dirt_17_8 dirt_18_8 dirt_20_8 dirt_21_8 dirt_22_8 dirt_23_8 dirt_24_8 dirt_1_9 dirt_5_9 dirt_6_9 dirt_7_9 dirt_8_9 dirt_9_9 dirt_10_9 dirt_11_9 dirt_12_9 dirt_13_9 dirt_14_9 dirt_15_9 dirt_16_9 dirt_17_9 dirt_18_9 dirt_20_9 dirt_22_9 dirt_23_9 dirt_24_9 dirt_1_10 dirt_2_10 dirt_3_10 dirt_4_10 dirt_5_10 dirt_6_10 dirt_7_10 dirt_10_10 dirt_11_10 dirt_12_10 dirt_13_10 dirt_14_10 dirt_15_10 dirt_16_10 dirt_17_10 dirt_18_10 dirt_20_10 dirt_21_10 dirt_22_10 dirt_23_10 dirt_24_10 dirt_1_11 dirt_2_11 dirt_3_11 dirt_4_11 dirt_5_11 dirt_6_11 dirt_7_11 dirt_8_11 dirt_9_11 dirt_10_11 dirt_11_11 dirt_12_11 dirt_13_11 dirt_14_11 dirt_15_11 dirt_16_11 dirt_17_11 dirt_18_11 dirt_19_11 dirt_20_11 dirt_21_11 dirt_22_11 - dirt
        sword1 - sword
        exitdoor_5_2 - exitdoor
        avatar - avatar
        boulder_2_2 boulder_3_2 boulder_22_2 boulder_2_3 boulder_3_3 boulder_22_3 boulder_8_10 boulder_9_10 - boulder
        diamond_7_2 diamond_8_2 diamond_15_2 diamond_16_2 diamond_23_2 diamond_7_3 diamond_8_3 diamond_23_3 diamond_10_6 diamond_14_6 diamond_15_6 diamond_14_7 diamond_15_7 diamond_2_8 diamond_3_8 diamond_4_8 diamond_14_8 diamond_15_8 diamond_2_9 diamond_3_9 diamond_4_9 diamond_23_11 diamond_24_11 - diamond
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
        (at n1 n1 dirt_1_1)
        (at n2 n1 dirt_2_1)
        (at n3 n1 dirt_3_1)
        (at n4 n1 dirt_4_1)
        (at n5 n1 dirt_5_1)
        (is-wall n6 n1)
        (at n7 n1 dirt_7_1)
        (at n8 n1 dirt_8_1)
        (at n9 n1 dirt_9_1)
        (at n10 n1 dirt_10_1)
        (at n11 n1 dirt_11_1)
        (at n12 n1 dirt_12_1)
        (at n13 n1 dirt_13_1)
        (at n14 n1 dirt_14_1)
        (at n15 n1 dirt_15_1)
        (at n16 n1 dirt_16_1)
        (at n17 n1 dirt_17_1)
        (at n18 n1 dirt_18_1)
        (at n19 n1 dirt_19_1)
        (at n20 n1 dirt_20_1)
        (at n21 n1 dirt_21_1)
        (at n22 n1 dirt_22_1)
        (at n23 n1 dirt_23_1)
        (at n24 n1 dirt_24_1)
        (is-wall n25 n1)
        (is-wall n0 n2)
        (at n1 n2 dirt_1_2)
        (oriented-down boulder_2_2)
        (at n2 n2 boulder_2_2)
        (boulder-moved boulder_2_2)
        (oriented-down boulder_3_2)
        (at n3 n2 boulder_3_2)
        (boulder-moved boulder_3_2)
        (at n4 n2 dirt_4_2)
        (at n5 n2 exitdoor_5_2)
        (is-wall n6 n2)
        (at n7 n2 diamond_7_2)
        (at n8 n2 diamond_8_2)
        (at n9 n2 dirt_9_2)
        (at n10 n2 dirt_10_2)
        (at n13 n2 dirt_13_2)
        (at n14 n2 dirt_14_2)
        (at n15 n2 diamond_15_2)
        (at n16 n2 diamond_16_2)
        (at n17 n2 dirt_17_2)
        (at n18 n2 dirt_18_2)
        (at n21 n2 dirt_21_2)
        (oriented-down boulder_22_2)
        (at n22 n2 boulder_22_2)
        (boulder-moved boulder_22_2)
        (at n23 n2 diamond_23_2)
        (at n24 n2 dirt_24_2)
        (is-wall n25 n2)
        (is-wall n0 n3)
        (at n1 n3 dirt_1_3)
        (oriented-down boulder_2_3)
        (at n2 n3 boulder_2_3)
        (boulder-moved boulder_2_3)
        (oriented-down boulder_3_3)
        (at n3 n3 boulder_3_3)
        (boulder-moved boulder_3_3)
        (at n4 n3 dirt_4_3)
        (at n5 n3 dirt_5_3)
        (is-wall n6 n3)
        (at n7 n3 diamond_7_3)
        (at n8 n3 diamond_8_3)
        (at n9 n3 dirt_9_3)
        (at n10 n3 dirt_10_3)
        (at n13 n3 dirt_13_3)
        (at n14 n3 dirt_14_3)
        (at n15 n3 dirt_15_3)
        (at n16 n3 dirt_16_3)
        (at n17 n3 dirt_17_3)
        (at n18 n3 dirt_18_3)
        (at n21 n3 dirt_21_3)
        (oriented-down boulder_22_3)
        (at n22 n3 boulder_22_3)
        (boulder-moved boulder_22_3)
        (at n23 n3 diamond_23_3)
        (at n24 n3 dirt_24_3)
        (is-wall n25 n3)
        (is-wall n0 n4)
        (at n1 n4 dirt_1_4)
        (at n2 n4 dirt_2_4)
        (at n3 n4 dirt_3_4)
        (at n4 n4 dirt_4_4)
        (at n5 n4 dirt_5_4)
        (at n6 n4 dirt_6_4)
        (at n7 n4 dirt_7_4)
        (at n8 n4 dirt_8_4)
        (at n9 n4 dirt_9_4)
        (at n10 n4 dirt_10_4)
        (at n11 n4 dirt_11_4)
        (at n12 n4 dirt_12_4)
        (at n13 n4 dirt_13_4)
        (at n14 n4 dirt_14_4)
        (at n15 n4 dirt_15_4)
        (at n16 n4 dirt_16_4)
        (at n17 n4 dirt_17_4)
        (at n18 n4 dirt_18_4)
        (at n21 n4 dirt_21_4)
        (at n22 n4 dirt_22_4)
        (at n23 n4 dirt_23_4)
        (at n24 n4 dirt_24_4)
        (is-wall n25 n4)
        (is-wall n0 n5)
        (at n1 n5 dirt_1_5)
        (at n2 n5 dirt_2_5)
        (at n3 n5 dirt_3_5)
        (at n4 n5 dirt_4_5)
        (at n9 n5 dirt_9_5)
        (at n10 n5 dirt_10_5)
        (at n11 n5 dirt_11_5)
        (at n12 n5 dirt_12_5)
        (at n13 n5 dirt_13_5)
        (at n14 n5 dirt_14_5)
        (at n15 n5 dirt_15_5)
        (at n16 n5 dirt_16_5)
        (at n17 n5 dirt_17_5)
        (at n18 n5 dirt_18_5)
        (at n21 n5 dirt_21_5)
        (at n22 n5 dirt_22_5)
        (at n23 n5 dirt_23_5)
        (at n24 n5 dirt_24_5)
        (is-wall n25 n5)
        (is-wall n0 n6)
        (at n1 n6 dirt_1_6)
        (at n2 n6 dirt_2_6)
        (at n3 n6 dirt_3_6)
        (at n4 n6 dirt_4_6)
        (at n9 n6 dirt_9_6)
        (at n10 n6 diamond_10_6)
        (at n11 n6 dirt_11_6)
        (at n12 n6 dirt_12_6)
        (at n13 n6 dirt_13_6)
        (at n14 n6 diamond_14_6)
        (at n15 n6 diamond_15_6)
        (at n16 n6 dirt_16_6)
        (at n17 n6 dirt_17_6)
        (at n18 n6 dirt_18_6)
        (at n19 n6 dirt_19_6)
        (at n20 n6 dirt_20_6)
        (at n21 n6 dirt_21_6)
        (at n22 n6 dirt_22_6)
        (at n23 n6 dirt_23_6)
        (at n24 n6 dirt_24_6)
        (is-wall n25 n6)
        (is-wall n0 n7)
        (at n1 n7 dirt_1_7)
        (at n2 n7 dirt_2_7)
        (at n3 n7 dirt_3_7)
        (at n4 n7 dirt_4_7)
        (at n5 n7 dirt_5_7)
        (at n6 n7 dirt_6_7)
        (at n7 n7 dirt_7_7)
        (at n8 n7 dirt_8_7)
        (at n9 n7 dirt_9_7)
        (at n10 n7 dirt_10_7)
        (at n11 n7 dirt_11_7)
        (at n12 n7 dirt_12_7)
        (at n13 n7 dirt_13_7)
        (at n14 n7 diamond_14_7)
        (at n15 n7 diamond_15_7)
        (at n16 n7 dirt_16_7)
        (at n17 n7 dirt_17_7)
        (at n18 n7 dirt_18_7)
        (is-wall n19 n7)
        (at n20 n7 dirt_20_7)
        (at n21 n7 dirt_21_7)
        (at n22 n7 dirt_22_7)
        (at n23 n7 dirt_23_7)
        (at n24 n7 dirt_24_7)
        (is-wall n25 n7)
        (is-wall n0 n8)
        (at n1 n8 dirt_1_8)
        (at n2 n8 diamond_2_8)
        (at n3 n8 diamond_3_8)
        (at n4 n8 diamond_4_8)
        (at n5 n8 dirt_5_8)
        (at n6 n8 dirt_6_8)
        (is-wall n7 n8)
        (is-wall n8 n8)
        (is-wall n9 n8)
        (is-wall n10 n8)
        (is-wall n11 n8)
        (at n12 n8 dirt_12_8)
        (at n13 n8 dirt_13_8)
        (at n14 n8 diamond_14_8)
        (at n15 n8 diamond_15_8)
        (at n16 n8 dirt_16_8)
        (at n17 n8 dirt_17_8)
        (at n18 n8 dirt_18_8)
        (is-wall n19 n8)
        (at n20 n8 dirt_20_8)
        (at n21 n8 dirt_21_8)
        (at n22 n8 dirt_22_8)
        (at n23 n8 dirt_23_8)
        (at n24 n8 dirt_24_8)
        (is-wall n25 n8)
        (is-wall n0 n9)
        (at n1 n9 dirt_1_9)
        (at n2 n9 diamond_2_9)
        (at n3 n9 diamond_3_9)
        (at n4 n9 diamond_4_9)
        (at n5 n9 dirt_5_9)
        (at n6 n9 dirt_6_9)
        (at n7 n9 dirt_7_9)
        (at n8 n9 dirt_8_9)
        (at n9 n9 dirt_9_9)
        (at n10 n9 dirt_10_9)
        (at n11 n9 dirt_11_9)
        (at n12 n9 dirt_12_9)
        (at n13 n9 dirt_13_9)
        (at n14 n9 dirt_14_9)
        (at n15 n9 dirt_15_9)
        (at n16 n9 dirt_16_9)
        (at n17 n9 dirt_17_9)
        (at n18 n9 dirt_18_9)
        (is-wall n19 n9)
        (at n20 n9 dirt_20_9)
        (oriented-right avatar)
        (at n21 n9 avatar)
        (at n22 n9 dirt_22_9)
        (at n23 n9 dirt_23_9)
        (at n24 n9 dirt_24_9)
        (is-wall n25 n9)
        (is-wall n0 n10)
        (at n1 n10 dirt_1_10)
        (at n2 n10 dirt_2_10)
        (at n3 n10 dirt_3_10)
        (at n4 n10 dirt_4_10)
        (at n5 n10 dirt_5_10)
        (at n6 n10 dirt_6_10)
        (at n7 n10 dirt_7_10)
        (oriented-down boulder_8_10)
        (at n8 n10 boulder_8_10)
        (boulder-moved boulder_8_10)
        (oriented-down boulder_9_10)
        (at n9 n10 boulder_9_10)
        (boulder-moved boulder_9_10)
        (at n10 n10 dirt_10_10)
        (at n11 n10 dirt_11_10)
        (at n12 n10 dirt_12_10)
        (at n13 n10 dirt_13_10)
        (at n14 n10 dirt_14_10)
        (at n15 n10 dirt_15_10)
        (at n16 n10 dirt_16_10)
        (at n17 n10 dirt_17_10)
        (at n18 n10 dirt_18_10)
        (is-wall n19 n10)
        (at n20 n10 dirt_20_10)
        (at n21 n10 dirt_21_10)
        (at n22 n10 dirt_22_10)
        (at n23 n10 dirt_23_10)
        (at n24 n10 dirt_24_10)
        (is-wall n25 n10)
        (is-wall n0 n11)
        (at n1 n11 dirt_1_11)
        (at n2 n11 dirt_2_11)
        (at n3 n11 dirt_3_11)
        (at n4 n11 dirt_4_11)
        (at n5 n11 dirt_5_11)
        (at n6 n11 dirt_6_11)
        (at n7 n11 dirt_7_11)
        (at n8 n11 dirt_8_11)
        (at n9 n11 dirt_9_11)
        (at n10 n11 dirt_10_11)
        (at n11 n11 dirt_11_11)
        (at n12 n11 dirt_12_11)
        (at n13 n11 dirt_13_11)
        (at n14 n11 dirt_14_11)
        (at n15 n11 dirt_15_11)
        (at n16 n11 dirt_16_11)
        (at n17 n11 dirt_17_11)
        (at n18 n11 dirt_18_11)
        (at n19 n11 dirt_19_11)
        (at n20 n11 dirt_20_11)
        (at n21 n11 dirt_21_11)
        (at n22 n11 dirt_22_11)
        (at n23 n11 diamond_23_11)
        (at n24 n11 diamond_24_11)
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