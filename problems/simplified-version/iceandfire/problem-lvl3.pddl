(define (problem VGDLGameProblem)
    (:domain VGDLGame)
    (:objects
        avatar - avatar
        iceshoes_12_12 - iceshoes
        fireboots_3_3 - fireboots
        exit_14_7 - exit
        n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 - num
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
        (is-wall n0 n1)
        (is-fire n4 n1)
        (is-fire n5 n1)
        (is-fire n6 n1)
        (is-ice n7 n1)
        (is-ice n8 n1)
        (is-ice n9 n1)
        (is-ice n10 n1)
        (is-fire n11 n1)
        (is-fire n12 n1)
        (is-fire n13 n1)
        (is-wall n15 n1)
        (is-wall n0 n2)
        (is-wall n2 n2)
        (is-wall n3 n2)
        (is-wall n4 n2)
        (is-wall n5 n2)
        (is-wall n6 n2)
        (is-wall n7 n2)
        (is-wall n8 n2)
        (is-wall n9 n2)
        (is-wall n10 n2)
        (is-wall n11 n2)
        (is-wall n12 n2)
        (is-wall n13 n2)
        (is-wall n15 n2)
        (is-wall n0 n3)
        (is-wall n2 n3)
        (at n3 n3 fireboots_3_3)
        (is-ice n4 n3)
        (is-ice n5 n3)
        (is-ice n6 n3)
        (is-wall n13 n3)
        (is-wall n15 n3)
        (is-wall n0 n4)
        (is-wall n2 n4)
        (is-wall n3 n4)
        (is-wall n4 n4)
        (is-ice n5 n4)
        (is-wall n6 n4)
        (is-wall n7 n4)
        (is-wall n8 n4)
        (is-wall n10 n4)
        (is-wall n11 n4)
        (is-wall n13 n4)
        (is-wall n15 n4)
        (is-wall n0 n5)
        (is-wall n2 n5)
        (is-wall n3 n5)
        (is-wall n4 n5)
        (is-wall n6 n5)
        (is-wall n7 n5)
        (is-wall n8 n5)
        (is-trap n9 n5)
        (is-wall n10 n5)
        (is-wall n11 n5)
        (is-wall n13 n5)
        (is-wall n15 n5)
        (is-wall n0 n6)
        (is-wall n2 n6)
        (is-wall n3 n6)
        (is-wall n4 n6)
        (is-wall n6 n6)
        (is-wall n7 n6)
        (is-wall n8 n6)
        (is-wall n10 n6)
        (is-wall n11 n6)
        (is-wall n13 n6)
        (is-wall n15 n6)
        (is-wall n0 n7)
        (oriented-none avatar)
        (at n1 n7 avatar)
        (is-trap n13 n7)
        (at n14 n7 exit_14_7)
        (is-wall n15 n7)
        (is-wall n0 n8)
        (is-wall n2 n8)
        (is-wall n3 n8)
        (is-wall n4 n8)
        (is-wall n6 n8)
        (is-wall n8 n8)
        (is-wall n9 n8)
        (is-wall n10 n8)
        (is-wall n11 n8)
        (is-wall n13 n8)
        (is-wall n14 n8)
        (is-wall n15 n8)
        (is-wall n0 n9)
        (is-wall n2 n9)
        (is-wall n3 n9)
        (is-wall n4 n9)
        (is-wall n5 n9)
        (is-wall n6 n9)
        (is-wall n8 n9)
        (is-wall n9 n9)
        (is-wall n10 n9)
        (is-wall n11 n9)
        (is-wall n13 n9)
        (is-wall n14 n9)
        (is-wall n15 n9)
        (is-wall n0 n10)
        (is-wall n8 n10)
        (is-wall n9 n10)
        (is-wall n10 n10)
        (is-wall n11 n10)
        (is-wall n13 n10)
        (is-wall n14 n10)
        (is-wall n15 n10)
        (is-wall n0 n11)
        (is-wall n2 n11)
        (is-wall n3 n11)
        (is-wall n4 n11)
        (is-wall n5 n11)
        (is-wall n6 n11)
        (is-wall n8 n11)
        (is-wall n9 n11)
        (is-wall n10 n11)
        (is-wall n11 n11)
        (is-wall n13 n11)
        (is-wall n14 n11)
        (is-wall n15 n11)
        (is-wall n0 n12)
        (is-fire n8 n12)
        (is-fire n9 n12)
        (is-fire n10 n12)
        (is-fire n11 n12)
        (at n12 n12 iceshoes_12_12)
        (is-trap n13 n12)
        (is-wall n14 n12)
        (is-wall n15 n12)
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
        (turn-avatar)
        (got-resource-iceshoes n0)
        (got-resource-fireboots n0)
    )
    (:goal
        (AND
            (object-dead exit_14_7)
        )
    )
)