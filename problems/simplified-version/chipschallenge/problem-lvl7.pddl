(define (problem VGDLGameProblem)
    (:domain VGDLGame)
    (:objects
        redkey_1_9 - redkey
        mud1 - mud
        avatar - avatar
        fireboots_1_1 - fireboots
        crate_4_2 crate_7_2 - crate
        flippers_10_1 - flippers
        reddoor_1_2 reddoor_10_2 - reddoor
        exit_5_9 - exit
        n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 - num
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
        (is-wall n0 n1)
        (at n1 n1 fireboots_1_1)
        (is-wall n2 n1)
        (is-wall n9 n1)
        (at n10 n1 flippers_10_1)
        (is-wall n11 n1)
        (is-wall n0 n2)
        (at n1 n2 reddoor_1_2)
        (is-wall n2 n2)
        (at n4 n2 crate_4_2)
        (at n7 n2 crate_7_2)
        (is-wall n9 n2)
        (at n10 n2 reddoor_10_2)
        (is-wall n11 n2)
        (is-wall n0 n3)
        (is-water n1 n3)
        (is-water n10 n3)
        (is-wall n11 n3)
        (is-wall n0 n4)
        (is-wall n4 n4)
        (is-wall n5 n4)
        (is-wall n6 n4)
        (is-wall n7 n4)
        (is-wall n11 n4)
        (is-wall n0 n5)
        (is-wall n3 n5)
        (is-wall n4 n5)
        (is-wall n5 n5)
        (is-wall n6 n5)
        (is-wall n7 n5)
        (is-wall n8 n5)
        (is-wall n11 n5)
        (is-wall n0 n6)
        (is-wall n11 n6)
        (is-wall n0 n7)
        (is-water n5 n7)
        (is-wall n11 n7)
        (is-wall n0 n8)
        (is-fire n5 n8)
        (is-wall n11 n8)
        (is-wall n0 n9)
        (at n1 n9 redkey_1_9)
        (is-water n3 n9)
        (is-fire n4 n9)
        (at n5 n9 exit_5_9)
        (is-fire n6 n9)
        (is-water n7 n9)
        (oriented-none avatar)
        (at n10 n9 avatar)
        (is-wall n11 n9)
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
        (turn-avatar)
        (got-resource-redkey n0)
        (got-resource-bluekey n0)
        (got-resource-greenkey n0)
        (got-resource-yellowkey n0)
        (got-resource-flippers n0)
        (got-resource-fireboots n0)
        (got-resource-chip n0)
        (object-dead mud1)
    )
    (:goal
        (AND
            (forall (?o - exit) (object-dead ?o))
        )
    )
)