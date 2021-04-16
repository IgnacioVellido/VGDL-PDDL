(define (problem VGDLGameProblem)
    (:domain VGDLGame)
    (:objects
        avatar - avatar
        cocoon_4_1 cocoon_14_1 cocoon_24_1 cocoon_1_5 cocoon_26_5 cocoon_4_9 cocoon_14_9 cocoon_24_9 - cocoon
        butterfly_4_3 butterfly_12_3 butterfly_26_3 butterfly_6_4 butterfly_13_4 butterfly_15_4 butterfly_19_4 butterfly_10_6 butterfly_21_6 butterfly_5_7 butterfly_16_7 butterfly_23_7 - butterfly
        n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 n16 n17 n18 n19 n20 n21 n22 n23 n24 n25 n26 n27 - num
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
        (is-wall n26 n0)
        (is-wall n27 n0)
        (is-wall n0 n1)
        (is-wall n3 n1)
        (at n4 n1 cocoon_4_1)
        (is-wall n5 n1)
        (at n14 n1 cocoon_14_1)
        (is-wall n23 n1)
        (at n24 n1 cocoon_24_1)
        (is-wall n25 n1)
        (is-wall n27 n1)
        (is-wall n0 n2)
        (is-wall n27 n2)
        (is-wall n0 n3)
        (at n4 n3 butterfly_4_3)
        (is-wall n8 n3)
        (at n12 n3 butterfly_12_3)
        (is-wall n18 n3)
        (is-wall n19 n3)
        (is-wall n20 n3)
        (at n26 n3 butterfly_26_3)
        (is-wall n27 n3)
        (is-wall n0 n4)
        (at n6 n4 butterfly_6_4)
        (is-wall n8 n4)
        (at n13 n4 butterfly_13_4)
        (at n15 n4 butterfly_15_4)
        (at n19 n4 butterfly_19_4)
        (is-wall n27 n4)
        (is-wall n0 n5)
        (at n1 n5 cocoon_1_5)
        (is-wall n9 n5)
        (at n26 n5 cocoon_26_5)
        (is-wall n27 n5)
        (is-wall n0 n6)
        (at n10 n6 butterfly_10_6)
        (is-wall n14 n6)
        (is-wall n15 n6)
        (is-wall n16 n6)
        (is-wall n17 n6)
        (at n21 n6 butterfly_21_6)
        (is-wall n27 n6)
        (is-wall n0 n7)
        (at n5 n7 butterfly_5_7)
        (is-wall n14 n7)
        (at n16 n7 butterfly_16_7)
        (at n23 n7 butterfly_23_7)
        (is-wall n27 n7)
        (is-wall n0 n8)
        (oriented-none avatar)
        (at n10 n8 avatar)
        (is-wall n27 n8)
        (is-wall n0 n9)
        (is-wall n3 n9)
        (at n4 n9 cocoon_4_9)
        (is-wall n5 n9)
        (at n14 n9 cocoon_14_9)
        (is-wall n23 n9)
        (at n24 n9 cocoon_24_9)
        (is-wall n25 n9)
        (is-wall n27 n9)
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
        (is-wall n13 n10)
        (is-wall n14 n10)
        (is-wall n15 n10)
        (is-wall n16 n10)
        (is-wall n17 n10)
        (is-wall n18 n10)
        (is-wall n19 n10)
        (is-wall n20 n10)
        (is-wall n21 n10)
        (is-wall n22 n10)
        (is-wall n23 n10)
        (is-wall n24 n10)
        (is-wall n25 n10)
        (is-wall n26 n10)
        (is-wall n27 n10)
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
        (next n25 n26)
        (next n26 n27)
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
        (previous n26 n25)
        (previous n27 n26)
        (turn-avatar)
    )
    (:goal
        (AND
            (forall (?o - butterfly) (object-dead ?o))
        )
    )
)