(define (problem VGDLGameProblem)
    (:domain VGDLGame)
    (:objects
        avatar - avatar
        cocoon_1_1 cocoon_3_1 cocoon_16_1 cocoon_25_1 cocoon_4_3 cocoon_12_3 cocoon_18_4 cocoon_4_6 cocoon_19_6 cocoon_24_6 cocoon_17_7 cocoon_2_8 cocoon_6_9 cocoon_17_9 cocoon_24_9 - cocoon
        butterfly_7_1 butterfly_22_2 - butterfly
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
        (at n1 n1 cocoon_1_1)
        (at n3 n1 cocoon_3_1)
        (is-wall n4 n1)
        (is-wall n5 n1)
        (is-wall n6 n1)
        (at n7 n1 butterfly_7_1)
        (at n16 n1 cocoon_16_1)
        (is-wall n23 n1)
        (at n25 n1 cocoon_25_1)
        (is-wall n27 n1)
        (is-wall n0 n2)
        (is-wall n3 n2)
        (is-wall n4 n2)
        (is-wall n6 n2)
        (is-wall n7 n2)
        (is-wall n8 n2)
        (at n22 n2 butterfly_22_2)
        (is-wall n23 n2)
        (is-wall n27 n2)
        (is-wall n0 n3)
        (at n4 n3 cocoon_4_3)
        (at n12 n3 cocoon_12_3)
        (is-wall n18 n3)
        (is-wall n19 n3)
        (is-wall n20 n3)
        (is-wall n21 n3)
        (is-wall n22 n3)
        (is-wall n23 n3)
        (is-wall n27 n3)
        (is-wall n0 n4)
        (at n18 n4 cocoon_18_4)
        (is-wall n27 n4)
        (is-wall n0 n5)
        (is-wall n10 n5)
        (is-wall n11 n5)
        (is-wall n12 n5)
        (is-wall n13 n5)
        (is-wall n14 n5)
        (is-wall n15 n5)
        (is-wall n16 n5)
        (is-wall n27 n5)
        (is-wall n0 n6)
        (at n4 n6 cocoon_4_6)
        (is-wall n10 n6)
        (is-wall n11 n6)
        (oriented-none avatar)
        (at n13 n6 avatar)
        (is-wall n15 n6)
        (at n19 n6 cocoon_19_6)
        (at n24 n6 cocoon_24_6)
        (is-wall n27 n6)
        (is-wall n0 n7)
        (is-wall n10 n7)
        (is-wall n13 n7)
        (is-wall n14 n7)
        (is-wall n15 n7)
        (is-wall n16 n7)
        (at n17 n7 cocoon_17_7)
        (is-wall n18 n7)
        (is-wall n19 n7)
        (is-wall n20 n7)
        (is-wall n21 n7)
        (is-wall n22 n7)
        (is-wall n27 n7)
        (is-wall n0 n8)
        (at n2 n8 cocoon_2_8)
        (is-wall n10 n8)
        (is-wall n13 n8)
        (is-wall n27 n8)
        (is-wall n0 n9)
        (at n6 n9 cocoon_6_9)
        (at n17 n9 cocoon_17_9)
        (at n24 n9 cocoon_24_9)
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