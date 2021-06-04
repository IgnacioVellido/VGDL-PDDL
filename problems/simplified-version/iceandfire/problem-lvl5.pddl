(define (problem VGDLGameProblem)
    (:domain VGDLGame)
    (:objects
        avatar - avatar
        iceshoes_3_7 - iceshoes
        fireboots_14_1 - fireboots
        exit_7_4 - exit
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
        (is-ice n11 n1)
        (is-ice n12 n1)
        (is-ice n13 n1)
        (at n14 n1 fireboots_14_1)
        (is-wall n15 n1)
        (is-wall n0 n2)
        (is-wall n2 n2)
        (is-wall n3 n2)
        (is-wall n4 n2)
        (is-wall n5 n2)
        (is-wall n6 n2)
        (is-wall n8 n2)
        (is-wall n9 n2)
        (is-wall n10 n2)
        (is-wall n11 n2)
        (is-wall n12 n2)
        (is-wall n13 n2)
        (is-ice n14 n2)
        (is-wall n15 n2)
        (is-wall n0 n3)
        (is-wall n2 n3)
        (is-wall n3 n3)
        (is-wall n4 n3)
        (is-wall n5 n3)
        (is-wall n6 n3)
        (is-trap n7 n3)
        (is-wall n8 n3)
        (is-wall n9 n3)
        (is-wall n10 n3)
        (is-wall n12 n3)
        (is-wall n13 n3)
        (is-ice n14 n3)
        (is-wall n15 n3)
        (is-wall n0 n4)
        (is-fire n2 n4)
        (is-fire n3 n4)
        (is-fire n4 n4)
        (at n7 n4 exit_7_4)
        (is-wall n8 n4)
        (is-wall n9 n4)
        (is-wall n10 n4)
        (is-wall n12 n4)
        (is-wall n13 n4)
        (is-ice n14 n4)
        (is-wall n15 n4)
        (is-wall n0 n5)
        (is-wall n2 n5)
        (is-wall n3 n5)
        (is-wall n4 n5)
        (is-wall n5 n5)
        (is-wall n6 n5)
        (is-wall n7 n5)
        (is-wall n8 n5)
        (is-wall n12 n5)
        (is-wall n13 n5)
        (is-wall n15 n5)
        (is-wall n0 n6)
        (is-wall n2 n6)
        (is-wall n3 n6)
        (is-wall n4 n6)
        (is-wall n5 n6)
        (is-wall n6 n6)
        (is-wall n7 n6)
        (is-wall n8 n6)
        (is-wall n9 n6)
        (is-wall n10 n6)
        (is-wall n13 n6)
        (is-wall n15 n6)
        (is-wall n0 n7)
        (is-wall n2 n7)
        (at n3 n7 iceshoes_3_7)
        (is-wall n9 n7)
        (is-wall n10 n7)
        (is-wall n11 n7)
        (is-wall n13 n7)
        (is-wall n15 n7)
        (is-wall n0 n8)
        (is-wall n2 n8)
        (is-wall n3 n8)
        (is-wall n4 n8)
        (is-wall n5 n8)
        (is-wall n6 n8)
        (is-wall n7 n8)
        (is-wall n9 n8)
        (is-wall n10 n8)
        (is-wall n11 n8)
        (is-wall n13 n8)
        (is-wall n15 n8)
        (is-wall n0 n9)
        (is-wall n2 n9)
        (is-wall n3 n9)
        (is-wall n4 n9)
        (is-wall n6 n9)
        (is-wall n7 n9)
        (is-wall n13 n9)
        (is-wall n15 n9)
        (is-wall n0 n10)
        (is-wall n2 n10)
        (is-wall n3 n10)
        (is-wall n4 n10)
        (is-wall n6 n10)
        (is-wall n7 n10)
        (is-wall n9 n10)
        (is-wall n10 n10)
        (is-wall n11 n10)
        (is-wall n12 n10)
        (is-wall n13 n10)
        (is-wall n15 n10)
        (is-wall n0 n11)
        (is-wall n2 n11)
        (is-wall n3 n11)
        (is-wall n4 n11)
        (is-wall n6 n11)
        (is-wall n7 n11)
        (is-wall n9 n11)
        (is-wall n10 n11)
        (is-wall n11 n11)
        (is-wall n12 n11)
        (is-wall n13 n11)
        (is-wall n15 n11)
        (is-wall n0 n12)
        (oriented-none avatar)
        (at n1 n12 avatar)
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