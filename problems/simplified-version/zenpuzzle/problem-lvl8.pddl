(define (problem VGDLGameProblem)
    (:domain VGDLGame)
    (:objects
        ground_4_2 ground_5_2 ground_6_2 ground_3_3 ground_4_3 ground_6_3 ground_3_4 ground_5_4 ground_6_4 ground_3_5 ground_4_5 ground_5_5 ground_4_6 ground_5_6 ground_4_7 - ground
        isincenter1 - isincenter
        avatar - avatar
        walked1 walked2 walked3 walked4 walked5 walked6 walked7 walked8 walked9 walked10 walked11 walked12 walked13 walked14 walked15 - walked
        n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 - num
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
        (is-wall n0 n1)
        (oriented-none avatar)
        (at n1 n1 avatar)
        (is-wall n9 n1)
        (is-wall n0 n2)
        (at n4 n2 ground_4_2)
        (at n5 n2 ground_5_2)
        (at n6 n2 ground_6_2)
        (is-wall n9 n2)
        (is-wall n0 n3)
        (at n3 n3 ground_3_3)
        (at n4 n3 ground_4_3)
        (is-rock n5 n3)
        (at n6 n3 ground_6_3)
        (is-wall n9 n3)
        (is-wall n0 n4)
        (at n3 n4 ground_3_4)
        (is-rock n4 n4)
        (at n5 n4 ground_5_4)
        (at n6 n4 ground_6_4)
        (is-wall n9 n4)
        (is-wall n0 n5)
        (at n3 n5 ground_3_5)
        (at n4 n5 ground_4_5)
        (at n5 n5 ground_5_5)
        (is-rock n6 n5)
        (is-wall n9 n5)
        (is-wall n0 n6)
        (is-rock n3 n6)
        (at n4 n6 ground_4_6)
        (at n5 n6 ground_5_6)
        (is-rock n6 n6)
        (is-wall n9 n6)
        (is-wall n0 n7)
        (is-rock n3 n7)
        (at n4 n7 ground_4_7)
        (is-rock n5 n7)
        (is-wall n9 n7)
        (is-wall n0 n8)
        (is-wall n9 n8)
        (is-wall n0 n9)
        (is-wall n1 n9)
        (is-wall n2 n9)
        (is-wall n3 n9)
        (is-wall n4 n9)
        (is-wall n5 n9)
        (is-wall n6 n9)
        (is-wall n7 n9)
        (is-wall n8 n9)
        (is-wall n9 n9)
        (next n0 n1)
        (next n1 n2)
        (next n2 n3)
        (next n3 n4)
        (next n4 n5)
        (next n5 n6)
        (next n6 n7)
        (next n7 n8)
        (next n8 n9)
        (previous n1 n0)
        (previous n2 n1)
        (previous n3 n2)
        (previous n4 n3)
        (previous n5 n4)
        (previous n6 n5)
        (previous n7 n6)
        (previous n8 n7)
        (previous n9 n8)
        (turn-avatar)
        (object-dead walked1)
        (object-dead walked2)
        (object-dead walked3)
        (object-dead walked4)
        (object-dead walked5)
        (object-dead walked6)
        (object-dead walked7)
        (object-dead walked8)
        (object-dead walked9)
        (object-dead walked10)
        (object-dead walked11)
        (object-dead walked12)
        (object-dead walked13)
        (object-dead walked14)
        (object-dead walked15)
        (object-dead isincenter1)
    )
    (:goal
        (AND
            (forall (?o - ground) (object-dead ?o))
        )
    )
)