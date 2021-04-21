(define (problem VGDLGameProblem)
    (:domain VGDLGame)
    (:objects
        redkey_1_6 - redkey
        mud1 - mud
        avatar - avatar
        fireboots_10_7 - fireboots
        crate_2_4 - crate
        flippers_6_1 - flippers
        reddoor_1_2 reddoor_10_2 - reddoor
        exit_6_9 - exit
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
        (at n6 n1 flippers_6_1)
        (is-wall n11 n1)
        (is-wall n0 n2)
        (at n1 n2 reddoor_1_2)
        (is-wall n2 n2)
        (is-wall n3 n2)
        (is-wall n4 n2)
        (is-wall n5 n2)
        (is-wall n6 n2)
        (is-wall n7 n2)
        (is-wall n8 n2)
        (is-wall n9 n2)
        (at n10 n2 reddoor_10_2)
        (is-wall n11 n2)
        (is-wall n0 n3)
        (is-fire n1 n3)
        (is-fire n2 n3)
        (is-fire n3 n3)
        (is-fire n4 n3)
        (is-fire n5 n3)
        (is-fire n6 n3)
        (is-fire n7 n3)
        (is-fire n8 n3)
        (is-fire n9 n3)
        (is-fire n10 n3)
        (is-wall n11 n3)
        (is-wall n0 n4)
        (at n2 n4 crate_2_4)
        (oriented-none avatar)
        (at n10 n4 avatar)
        (is-wall n11 n4)
        (is-wall n0 n5)
        (is-water n1 n5)
        (is-water n2 n5)
        (is-wall n11 n5)
        (is-wall n0 n6)
        (at n1 n6 redkey_1_6)
        (is-water n2 n6)
        (is-wall n11 n6)
        (is-wall n0 n7)
        (is-water n1 n7)
        (is-water n2 n7)
        (at n10 n7 fireboots_10_7)
        (is-wall n11 n7)
        (is-wall n0 n8)
        (is-water n1 n8)
        (is-water n2 n8)
        (is-water n3 n8)
        (is-water n4 n8)
        (is-water n5 n8)
        (is-water n6 n8)
        (is-water n7 n8)
        (is-water n8 n8)
        (is-water n9 n8)
        (is-water n10 n8)
        (is-wall n11 n8)
        (is-wall n0 n9)
        (is-water n1 n9)
        (is-water n2 n9)
        (is-water n3 n9)
        (is-water n4 n9)
        (is-water n5 n9)
        (at n6 n9 exit_6_9)
        (is-water n7 n9)
        (is-water n8 n9)
        (is-water n9 n9)
        (is-water n10 n9)
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