(define (problem VGDLGameProblem)
    (:domain VGDLGame)
    (:objects
        avatar - avatar
        iceshoes_13_1 - iceshoes
        fireboots_3_8 - fireboots
        exit_8_1 - exit
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
        (is-wall n1 n1)
        (is-wall n2 n1)
        (is-wall n3 n1)
        (is-wall n4 n1)
        (is-wall n5 n1)
        (is-wall n6 n1)
        (is-ice n7 n1)
        (at n8 n1 exit_8_1)
        (is-wall n9 n1)
        (is-wall n10 n1)
        (at n13 n1 iceshoes_13_1)
        (is-trap n14 n1)
        (is-wall n15 n1)
        (is-wall n0 n2)
        (is-ice n1 n2)
        (is-ice n2 n2)
        (is-ice n3 n2)
        (is-ice n4 n2)
        (is-ice n5 n2)
        (is-ice n6 n2)
        (is-ice n7 n2)
        (is-wall n8 n2)
        (is-fire n9 n2)
        (is-wall n10 n2)
        (is-wall n12 n2)
        (is-wall n13 n2)
        (is-wall n14 n2)
        (is-wall n15 n2)
        (is-wall n0 n3)
        (is-wall n2 n3)
        (is-wall n3 n3)
        (is-ice n4 n3)
        (is-wall n5 n3)
        (is-wall n6 n3)
        (is-wall n7 n3)
        (is-wall n8 n3)
        (is-fire n9 n3)
        (is-wall n10 n3)
        (is-fire n14 n3)
        (is-wall n15 n3)
        (is-wall n0 n4)
        (is-wall n2 n4)
        (is-wall n3 n4)
        (is-ice n4 n4)
        (is-wall n5 n4)
        (is-wall n6 n4)
        (is-wall n7 n4)
        (is-fire n8 n4)
        (is-fire n9 n4)
        (is-wall n10 n4)
        (is-wall n11 n4)
        (is-wall n12 n4)
        (is-wall n13 n4)
        (is-fire n14 n4)
        (is-wall n15 n4)
        (is-wall n0 n5)
        (is-wall n1 n5)
        (is-wall n2 n5)
        (is-trap n3 n5)
        (is-ice n4 n5)
        (is-wall n5 n5)
        (is-wall n6 n5)
        (is-wall n7 n5)
        (is-fire n8 n5)
        (is-wall n9 n5)
        (is-wall n10 n5)
        (is-wall n11 n5)
        (is-fire n12 n5)
        (is-fire n13 n5)
        (is-fire n14 n5)
        (is-wall n15 n5)
        (is-wall n0 n6)
        (is-wall n5 n6)
        (is-wall n6 n6)
        (is-wall n7 n6)
        (is-fire n8 n6)
        (is-wall n9 n6)
        (is-wall n10 n6)
        (is-wall n11 n6)
        (is-fire n12 n6)
        (is-wall n13 n6)
        (is-wall n14 n6)
        (is-wall n15 n6)
        (is-wall n0 n7)
        (is-wall n2 n7)
        (is-wall n3 n7)
        (is-wall n4 n7)
        (is-wall n5 n7)
        (is-wall n6 n7)
        (is-wall n7 n7)
        (is-fire n8 n7)
        (is-wall n9 n7)
        (is-wall n10 n7)
        (is-wall n11 n7)
        (is-fire n12 n7)
        (is-wall n13 n7)
        (is-wall n14 n7)
        (is-wall n15 n7)
        (is-wall n0 n8)
        (is-trap n2 n8)
        (at n3 n8 fireboots_3_8)
        (is-wall n15 n8)
        (is-wall n0 n9)
        (is-wall n2 n9)
        (is-wall n4 n9)
        (is-wall n5 n9)
        (is-wall n6 n9)
        (is-wall n7 n9)
        (is-wall n9 n9)
        (is-wall n10 n9)
        (is-wall n11 n9)
        (is-wall n13 n9)
        (is-wall n14 n9)
        (is-wall n15 n9)
        (is-wall n0 n10)
        (is-wall n2 n10)
        (is-wall n7 n10)
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
        (is-wall n7 n11)
        (is-wall n9 n11)
        (is-wall n10 n11)
        (is-wall n11 n11)
        (is-wall n13 n11)
        (is-wall n14 n11)
        (is-wall n15 n11)
        (is-wall n0 n12)
        (is-wall n7 n12)
        (oriented-none avatar)
        (at n8 n12 avatar)
        (is-wall n9 n12)
        (is-wall n10 n12)
        (is-wall n11 n12)
        (is-wall n13 n12)
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
            (forall (?o - exit) (object-dead ?o))
        )
    )
)