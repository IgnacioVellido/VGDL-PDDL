(define (problem VGDLGameProblem)
    (:domain VGDLGame)
    (:objects
        avatar - avatar
        incb_16_3 - incb
        inca_4_8 - inca
        incd_22_10 - incd
        incc_8_4 - incc
        incf_13_10 - incf
        ince_23_4 - ince
        n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 n16 n17 n18 n19 n20 n21 n22 n23 n24 n25 n26 n27 n28 - num
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
        (is-wall n28 n0)
        (is-wall n0 n1)
        (is-chef n3 n1)
        (is-wall n28 n1)
        (is-wall n0 n2)
        (is-wall n28 n2)
        (is-wall n0 n3)
        (at n16 n3 incb_16_3)
        (is-wall n28 n3)
        (is-wall n0 n4)
        (at n8 n4 incc_8_4)
        (at n23 n4 ince_23_4)
        (is-wall n28 n4)
        (is-wall n0 n5)
        (is-wall n28 n5)
        (is-wall n0 n6)
        (is-wall n28 n6)
        (is-wall n0 n7)
        (is-chef n18 n7)
        (is-wall n28 n7)
        (is-wall n0 n8)
        (at n4 n8 inca_4_8)
        (is-wall n28 n8)
        (is-wall n0 n9)
        (is-chef n10 n9)
        (is-wall n28 n9)
        (is-wall n0 n10)
        (at n13 n10 incf_13_10)
        (at n22 n10 incd_22_10)
        (oriented-right avatar)
        (at n25 n10 avatar)
        (is-wall n28 n10)
        (is-wall n0 n11)
        (is-wall n28 n11)
        (is-wall n0 n12)
        (is-wall n28 n12)
        (is-wall n0 n13)
        (is-wall n1 n13)
        (is-wall n2 n13)
        (is-wall n3 n13)
        (is-wall n4 n13)
        (is-wall n5 n13)
        (is-wall n6 n13)
        (is-wall n7 n13)
        (is-wall n8 n13)
        (is-wall n9 n13)
        (is-wall n10 n13)
        (is-wall n11 n13)
        (is-wall n12 n13)
        (is-wall n13 n13)
        (is-wall n14 n13)
        (is-wall n15 n13)
        (is-wall n16 n13)
        (is-wall n17 n13)
        (is-wall n18 n13)
        (is-wall n19 n13)
        (is-wall n20 n13)
        (is-wall n21 n13)
        (is-wall n22 n13)
        (is-wall n23 n13)
        (is-wall n24 n13)
        (is-wall n25 n13)
        (is-wall n26 n13)
        (is-wall n27 n13)
        (is-wall n28 n13)
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
        (next n27 n28)
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
        (previous n28 n27)
        (turn-avatar)
        (got-resource-inca n0)
        (got-resource-incb n0)
        (got-resource-incc n0)
        (got-resource-incd n0)
        (got-resource-ince n0)
        (got-resource-incf n0)
    )
    (:goal
        (AND
            (forall (?o - incf) (object-dead ?o))
        )
    )
)