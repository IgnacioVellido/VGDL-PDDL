(define (problem VGDLGameProblem)
    (:domain VGDLGame)
    (:objects
        monsterSlow_2_1 - monsterSlow
        c_0_0 c_1_0 c_2_0 c_3_0 c_4_0 c_5_0 c_6_0 c_7_0 c_8_0 c_9_0 c_10_0 c_11_0 c_12_0 c_0_1 c_2_1 c_4_1 c_5_1 c_10_1 c_12_1 c_0_2 c_3_2 c_4_2 c_5_2 c_12_2 c_0_3 c_11_3 c_12_3 c_0_4 c_8_4 c_9_4 c_10_4 c_11_4 c_12_4 c_0_5 c_8_5 c_9_5 c_12_5 c_0_6 c_4_6 c_8_6 c_12_6 c_0_7 c_1_7 c_4_7 c_12_7 c_0_8 c_1_8 c_2_8 c_3_8 c_4_8 c_5_8 c_6_8 c_7_8 c_8_8 c_9_8 c_10_8 c_11_8 c_12_8 - cell
        wall_0_0 wall_1_0 wall_2_0 wall_3_0 wall_4_0 wall_5_0 wall_6_0 wall_7_0 wall_8_0 wall_9_0 wall_10_0 wall_11_0 wall_12_0 wall_0_1 wall_5_1 wall_12_1 wall_0_2 wall_3_2 wall_4_2 wall_5_2 wall_12_2 wall_0_3 wall_12_3 wall_0_4 wall_8_4 wall_9_4 wall_10_4 wall_11_4 wall_12_4 wall_0_5 wall_8_5 wall_12_5 wall_0_6 wall_4_6 wall_8_6 wall_12_6 wall_0_7 wall_4_7 wall_12_7 wall_0_8 wall_1_8 wall_2_8 wall_3_8 wall_4_8 wall_5_8 wall_6_8 wall_7_8 wall_8_8 wall_9_8 wall_10_8 wall_11_8 wall_12_8 - wall
        monsterNormal_11_3 - monsterNormal
        withkey1 withkey2 withkey3 withkey4 withkey5 withkey6 withkey7 withkey8 withkey9 withkey10 - withkey
        monsterQuick_10_1 - monsterQuick
        goal_4_1 - goal
        nokey_1_7 - nokey
        key_9_5 - key
    )
    (:init
        (at c_0_0 wall_0_0)
        (last-at c_0_0 wall_0_0)
        (at c_1_0 wall_1_0)
        (last-at c_1_0 wall_1_0)
        (at c_2_0 wall_2_0)
        (last-at c_2_0 wall_2_0)
        (at c_3_0 wall_3_0)
        (last-at c_3_0 wall_3_0)
        (at c_4_0 wall_4_0)
        (last-at c_4_0 wall_4_0)
        (at c_5_0 wall_5_0)
        (last-at c_5_0 wall_5_0)
        (at c_6_0 wall_6_0)
        (last-at c_6_0 wall_6_0)
        (at c_7_0 wall_7_0)
        (last-at c_7_0 wall_7_0)
        (at c_8_0 wall_8_0)
        (last-at c_8_0 wall_8_0)
        (at c_9_0 wall_9_0)
        (last-at c_9_0 wall_9_0)
        (at c_10_0 wall_10_0)
        (last-at c_10_0 wall_10_0)
        (at c_11_0 wall_11_0)
        (last-at c_11_0 wall_11_0)
        (at c_12_0 wall_12_0)
        (last-at c_12_0 wall_12_0)
        (at c_0_1 wall_0_1)
        (last-at c_0_1 wall_0_1)
        (at c_2_1 monsterSlow_2_1)
        (last-at c_2_1 monsterSlow_2_1)
        (at c_4_1 goal_4_1)
        (last-at c_4_1 goal_4_1)
        (at c_5_1 wall_5_1)
        (last-at c_5_1 wall_5_1)
        (at c_10_1 monsterQuick_10_1)
        (last-at c_10_1 monsterQuick_10_1)
        (at c_12_1 wall_12_1)
        (last-at c_12_1 wall_12_1)
        (at c_0_2 wall_0_2)
        (last-at c_0_2 wall_0_2)
        (at c_3_2 wall_3_2)
        (last-at c_3_2 wall_3_2)
        (at c_4_2 wall_4_2)
        (last-at c_4_2 wall_4_2)
        (at c_5_2 wall_5_2)
        (last-at c_5_2 wall_5_2)
        (at c_12_2 wall_12_2)
        (last-at c_12_2 wall_12_2)
        (at c_0_3 wall_0_3)
        (last-at c_0_3 wall_0_3)
        (at c_11_3 monsterNormal_11_3)
        (last-at c_11_3 monsterNormal_11_3)
        (at c_12_3 wall_12_3)
        (last-at c_12_3 wall_12_3)
        (at c_0_4 wall_0_4)
        (last-at c_0_4 wall_0_4)
        (at c_8_4 wall_8_4)
        (last-at c_8_4 wall_8_4)
        (at c_9_4 wall_9_4)
        (last-at c_9_4 wall_9_4)
        (at c_10_4 wall_10_4)
        (last-at c_10_4 wall_10_4)
        (at c_11_4 wall_11_4)
        (last-at c_11_4 wall_11_4)
        (at c_12_4 wall_12_4)
        (last-at c_12_4 wall_12_4)
        (at c_0_5 wall_0_5)
        (last-at c_0_5 wall_0_5)
        (at c_8_5 wall_8_5)
        (last-at c_8_5 wall_8_5)
        (at c_9_5 key_9_5)
        (last-at c_9_5 key_9_5)
        (at c_12_5 wall_12_5)
        (last-at c_12_5 wall_12_5)
        (at c_0_6 wall_0_6)
        (last-at c_0_6 wall_0_6)
        (at c_4_6 wall_4_6)
        (last-at c_4_6 wall_4_6)
        (at c_8_6 wall_8_6)
        (last-at c_8_6 wall_8_6)
        (at c_12_6 wall_12_6)
        (last-at c_12_6 wall_12_6)
        (at c_0_7 wall_0_7)
        (last-at c_0_7 wall_0_7)
        (at c_1_7 nokey_1_7)
        (last-at c_1_7 nokey_1_7)
        (at c_4_7 wall_4_7)
        (last-at c_4_7 wall_4_7)
        (at c_12_7 wall_12_7)
        (last-at c_12_7 wall_12_7)
        (at c_0_8 wall_0_8)
        (last-at c_0_8 wall_0_8)
        (at c_1_8 wall_1_8)
        (last-at c_1_8 wall_1_8)
        (at c_2_8 wall_2_8)
        (last-at c_2_8 wall_2_8)
        (at c_3_8 wall_3_8)
        (last-at c_3_8 wall_3_8)
        (at c_4_8 wall_4_8)
        (last-at c_4_8 wall_4_8)
        (at c_5_8 wall_5_8)
        (last-at c_5_8 wall_5_8)
        (at c_6_8 wall_6_8)
        (last-at c_6_8 wall_6_8)
        (at c_7_8 wall_7_8)
        (last-at c_7_8 wall_7_8)
        (at c_8_8 wall_8_8)
        (last-at c_8_8 wall_8_8)
        (at c_9_8 wall_9_8)
        (last-at c_9_8 wall_9_8)
        (at c_10_8 wall_10_8)
        (last-at c_10_8 wall_10_8)
        (at c_11_8 wall_11_8)
        (last-at c_11_8 wall_11_8)
        (at c_12_8 wall_12_8)
        (last-at c_12_8 wall_12_8)
        (connected-down c_0_0 c_0_1)
        (connected-right c_0_0 c_1_0)
        (connected-down c_1_0 c_1_1)
        (connected-left c_1_0 c_0_0)
        (connected-right c_1_0 c_2_0)
        (connected-down c_2_0 c_2_1)
        (connected-left c_2_0 c_1_0)
        (connected-right c_2_0 c_3_0)
        (connected-down c_3_0 c_3_1)
        (connected-left c_3_0 c_2_0)
        (connected-right c_3_0 c_4_0)
        (connected-down c_4_0 c_4_1)
        (connected-left c_4_0 c_3_0)
        (connected-right c_4_0 c_5_0)
        (connected-down c_5_0 c_5_1)
        (connected-left c_5_0 c_4_0)
        (connected-right c_5_0 c_6_0)
        (connected-down c_6_0 c_6_1)
        (connected-left c_6_0 c_5_0)
        (connected-right c_6_0 c_7_0)
        (connected-down c_7_0 c_7_1)
        (connected-left c_7_0 c_6_0)
        (connected-right c_7_0 c_8_0)
        (connected-down c_8_0 c_8_1)
        (connected-left c_8_0 c_7_0)
        (connected-right c_8_0 c_9_0)
        (connected-down c_9_0 c_9_1)
        (connected-left c_9_0 c_8_0)
        (connected-right c_9_0 c_10_0)
        (connected-down c_10_0 c_10_1)
        (connected-left c_10_0 c_9_0)
        (connected-right c_10_0 c_11_0)
        (connected-down c_11_0 c_11_1)
        (connected-left c_11_0 c_10_0)
        (connected-right c_11_0 c_12_0)
        (connected-down c_12_0 c_12_1)
        (connected-left c_12_0 c_11_0)
        (connected-up c_0_1 c_0_0)
        (connected-down c_0_1 c_0_2)
        (connected-right c_0_1 c_1_1)
        (connected-up c_1_1 c_1_0)
        (connected-down c_1_1 c_1_2)
        (connected-left c_1_1 c_0_1)
        (connected-right c_1_1 c_2_1)
        (connected-up c_2_1 c_2_0)
        (connected-down c_2_1 c_2_2)
        (connected-left c_2_1 c_1_1)
        (connected-right c_2_1 c_3_1)
        (connected-up c_3_1 c_3_0)
        (connected-down c_3_1 c_3_2)
        (connected-left c_3_1 c_2_1)
        (connected-right c_3_1 c_4_1)
        (connected-up c_4_1 c_4_0)
        (connected-down c_4_1 c_4_2)
        (connected-left c_4_1 c_3_1)
        (connected-right c_4_1 c_5_1)
        (connected-up c_5_1 c_5_0)
        (connected-down c_5_1 c_5_2)
        (connected-left c_5_1 c_4_1)
        (connected-right c_5_1 c_6_1)
        (connected-up c_6_1 c_6_0)
        (connected-down c_6_1 c_6_2)
        (connected-left c_6_1 c_5_1)
        (connected-right c_6_1 c_7_1)
        (connected-up c_7_1 c_7_0)
        (connected-down c_7_1 c_7_2)
        (connected-left c_7_1 c_6_1)
        (connected-right c_7_1 c_8_1)
        (connected-up c_8_1 c_8_0)
        (connected-down c_8_1 c_8_2)
        (connected-left c_8_1 c_7_1)
        (connected-right c_8_1 c_9_1)
        (connected-up c_9_1 c_9_0)
        (connected-down c_9_1 c_9_2)
        (connected-left c_9_1 c_8_1)
        (connected-right c_9_1 c_10_1)
        (connected-up c_10_1 c_10_0)
        (connected-down c_10_1 c_10_2)
        (connected-left c_10_1 c_9_1)
        (connected-right c_10_1 c_11_1)
        (connected-up c_11_1 c_11_0)
        (connected-down c_11_1 c_11_2)
        (connected-left c_11_1 c_10_1)
        (connected-right c_11_1 c_12_1)
        (connected-up c_12_1 c_12_0)
        (connected-down c_12_1 c_12_2)
        (connected-left c_12_1 c_11_1)
        (connected-up c_0_2 c_0_1)
        (connected-down c_0_2 c_0_3)
        (connected-right c_0_2 c_1_2)
        (connected-up c_1_2 c_1_1)
        (connected-down c_1_2 c_1_3)
        (connected-left c_1_2 c_0_2)
        (connected-right c_1_2 c_2_2)
        (connected-up c_2_2 c_2_1)
        (connected-down c_2_2 c_2_3)
        (connected-left c_2_2 c_1_2)
        (connected-right c_2_2 c_3_2)
        (connected-up c_3_2 c_3_1)
        (connected-down c_3_2 c_3_3)
        (connected-left c_3_2 c_2_2)
        (connected-right c_3_2 c_4_2)
        (connected-up c_4_2 c_4_1)
        (connected-down c_4_2 c_4_3)
        (connected-left c_4_2 c_3_2)
        (connected-right c_4_2 c_5_2)
        (connected-up c_5_2 c_5_1)
        (connected-down c_5_2 c_5_3)
        (connected-left c_5_2 c_4_2)
        (connected-right c_5_2 c_6_2)
        (connected-up c_6_2 c_6_1)
        (connected-down c_6_2 c_6_3)
        (connected-left c_6_2 c_5_2)
        (connected-right c_6_2 c_7_2)
        (connected-up c_7_2 c_7_1)
        (connected-down c_7_2 c_7_3)
        (connected-left c_7_2 c_6_2)
        (connected-right c_7_2 c_8_2)
        (connected-up c_8_2 c_8_1)
        (connected-down c_8_2 c_8_3)
        (connected-left c_8_2 c_7_2)
        (connected-right c_8_2 c_9_2)
        (connected-up c_9_2 c_9_1)
        (connected-down c_9_2 c_9_3)
        (connected-left c_9_2 c_8_2)
        (connected-right c_9_2 c_10_2)
        (connected-up c_10_2 c_10_1)
        (connected-down c_10_2 c_10_3)
        (connected-left c_10_2 c_9_2)
        (connected-right c_10_2 c_11_2)
        (connected-up c_11_2 c_11_1)
        (connected-down c_11_2 c_11_3)
        (connected-left c_11_2 c_10_2)
        (connected-right c_11_2 c_12_2)
        (connected-up c_12_2 c_12_1)
        (connected-down c_12_2 c_12_3)
        (connected-left c_12_2 c_11_2)
        (connected-up c_0_3 c_0_2)
        (connected-down c_0_3 c_0_4)
        (connected-right c_0_3 c_1_3)
        (connected-up c_1_3 c_1_2)
        (connected-down c_1_3 c_1_4)
        (connected-left c_1_3 c_0_3)
        (connected-right c_1_3 c_2_3)
        (connected-up c_2_3 c_2_2)
        (connected-down c_2_3 c_2_4)
        (connected-left c_2_3 c_1_3)
        (connected-right c_2_3 c_3_3)
        (connected-up c_3_3 c_3_2)
        (connected-down c_3_3 c_3_4)
        (connected-left c_3_3 c_2_3)
        (connected-right c_3_3 c_4_3)
        (connected-up c_4_3 c_4_2)
        (connected-down c_4_3 c_4_4)
        (connected-left c_4_3 c_3_3)
        (connected-right c_4_3 c_5_3)
        (connected-up c_5_3 c_5_2)
        (connected-down c_5_3 c_5_4)
        (connected-left c_5_3 c_4_3)
        (connected-right c_5_3 c_6_3)
        (connected-up c_6_3 c_6_2)
        (connected-down c_6_3 c_6_4)
        (connected-left c_6_3 c_5_3)
        (connected-right c_6_3 c_7_3)
        (connected-up c_7_3 c_7_2)
        (connected-down c_7_3 c_7_4)
        (connected-left c_7_3 c_6_3)
        (connected-right c_7_3 c_8_3)
        (connected-up c_8_3 c_8_2)
        (connected-down c_8_3 c_8_4)
        (connected-left c_8_3 c_7_3)
        (connected-right c_8_3 c_9_3)
        (connected-up c_9_3 c_9_2)
        (connected-down c_9_3 c_9_4)
        (connected-left c_9_3 c_8_3)
        (connected-right c_9_3 c_10_3)
        (connected-up c_10_3 c_10_2)
        (connected-down c_10_3 c_10_4)
        (connected-left c_10_3 c_9_3)
        (connected-right c_10_3 c_11_3)
        (connected-up c_11_3 c_11_2)
        (connected-down c_11_3 c_11_4)
        (connected-left c_11_3 c_10_3)
        (connected-right c_11_3 c_12_3)
        (connected-up c_12_3 c_12_2)
        (connected-down c_12_3 c_12_4)
        (connected-left c_12_3 c_11_3)
        (connected-up c_0_4 c_0_3)
        (connected-down c_0_4 c_0_5)
        (connected-right c_0_4 c_1_4)
        (connected-up c_1_4 c_1_3)
        (connected-down c_1_4 c_1_5)
        (connected-left c_1_4 c_0_4)
        (connected-right c_1_4 c_2_4)
        (connected-up c_2_4 c_2_3)
        (connected-down c_2_4 c_2_5)
        (connected-left c_2_4 c_1_4)
        (connected-right c_2_4 c_3_4)
        (connected-up c_3_4 c_3_3)
        (connected-down c_3_4 c_3_5)
        (connected-left c_3_4 c_2_4)
        (connected-right c_3_4 c_4_4)
        (connected-up c_4_4 c_4_3)
        (connected-down c_4_4 c_4_5)
        (connected-left c_4_4 c_3_4)
        (connected-right c_4_4 c_5_4)
        (connected-up c_5_4 c_5_3)
        (connected-down c_5_4 c_5_5)
        (connected-left c_5_4 c_4_4)
        (connected-right c_5_4 c_6_4)
        (connected-up c_6_4 c_6_3)
        (connected-down c_6_4 c_6_5)
        (connected-left c_6_4 c_5_4)
        (connected-right c_6_4 c_7_4)
        (connected-up c_7_4 c_7_3)
        (connected-down c_7_4 c_7_5)
        (connected-left c_7_4 c_6_4)
        (connected-right c_7_4 c_8_4)
        (connected-up c_8_4 c_8_3)
        (connected-down c_8_4 c_8_5)
        (connected-left c_8_4 c_7_4)
        (connected-right c_8_4 c_9_4)
        (connected-up c_9_4 c_9_3)
        (connected-down c_9_4 c_9_5)
        (connected-left c_9_4 c_8_4)
        (connected-right c_9_4 c_10_4)
        (connected-up c_10_4 c_10_3)
        (connected-down c_10_4 c_10_5)
        (connected-left c_10_4 c_9_4)
        (connected-right c_10_4 c_11_4)
        (connected-up c_11_4 c_11_3)
        (connected-down c_11_4 c_11_5)
        (connected-left c_11_4 c_10_4)
        (connected-right c_11_4 c_12_4)
        (connected-up c_12_4 c_12_3)
        (connected-down c_12_4 c_12_5)
        (connected-left c_12_4 c_11_4)
        (connected-up c_0_5 c_0_4)
        (connected-down c_0_5 c_0_6)
        (connected-right c_0_5 c_1_5)
        (connected-up c_1_5 c_1_4)
        (connected-down c_1_5 c_1_6)
        (connected-left c_1_5 c_0_5)
        (connected-right c_1_5 c_2_5)
        (connected-up c_2_5 c_2_4)
        (connected-down c_2_5 c_2_6)
        (connected-left c_2_5 c_1_5)
        (connected-right c_2_5 c_3_5)
        (connected-up c_3_5 c_3_4)
        (connected-down c_3_5 c_3_6)
        (connected-left c_3_5 c_2_5)
        (connected-right c_3_5 c_4_5)
        (connected-up c_4_5 c_4_4)
        (connected-down c_4_5 c_4_6)
        (connected-left c_4_5 c_3_5)
        (connected-right c_4_5 c_5_5)
        (connected-up c_5_5 c_5_4)
        (connected-down c_5_5 c_5_6)
        (connected-left c_5_5 c_4_5)
        (connected-right c_5_5 c_6_5)
        (connected-up c_6_5 c_6_4)
        (connected-down c_6_5 c_6_6)
        (connected-left c_6_5 c_5_5)
        (connected-right c_6_5 c_7_5)
        (connected-up c_7_5 c_7_4)
        (connected-down c_7_5 c_7_6)
        (connected-left c_7_5 c_6_5)
        (connected-right c_7_5 c_8_5)
        (connected-up c_8_5 c_8_4)
        (connected-down c_8_5 c_8_6)
        (connected-left c_8_5 c_7_5)
        (connected-right c_8_5 c_9_5)
        (connected-up c_9_5 c_9_4)
        (connected-down c_9_5 c_9_6)
        (connected-left c_9_5 c_8_5)
        (connected-right c_9_5 c_10_5)
        (connected-up c_10_5 c_10_4)
        (connected-down c_10_5 c_10_6)
        (connected-left c_10_5 c_9_5)
        (connected-right c_10_5 c_11_5)
        (connected-up c_11_5 c_11_4)
        (connected-down c_11_5 c_11_6)
        (connected-left c_11_5 c_10_5)
        (connected-right c_11_5 c_12_5)
        (connected-up c_12_5 c_12_4)
        (connected-down c_12_5 c_12_6)
        (connected-left c_12_5 c_11_5)
        (connected-up c_0_6 c_0_5)
        (connected-down c_0_6 c_0_7)
        (connected-right c_0_6 c_1_6)
        (connected-up c_1_6 c_1_5)
        (connected-down c_1_6 c_1_7)
        (connected-left c_1_6 c_0_6)
        (connected-right c_1_6 c_2_6)
        (connected-up c_2_6 c_2_5)
        (connected-down c_2_6 c_2_7)
        (connected-left c_2_6 c_1_6)
        (connected-right c_2_6 c_3_6)
        (connected-up c_3_6 c_3_5)
        (connected-down c_3_6 c_3_7)
        (connected-left c_3_6 c_2_6)
        (connected-right c_3_6 c_4_6)
        (connected-up c_4_6 c_4_5)
        (connected-down c_4_6 c_4_7)
        (connected-left c_4_6 c_3_6)
        (connected-right c_4_6 c_5_6)
        (connected-up c_5_6 c_5_5)
        (connected-down c_5_6 c_5_7)
        (connected-left c_5_6 c_4_6)
        (connected-right c_5_6 c_6_6)
        (connected-up c_6_6 c_6_5)
        (connected-down c_6_6 c_6_7)
        (connected-left c_6_6 c_5_6)
        (connected-right c_6_6 c_7_6)
        (connected-up c_7_6 c_7_5)
        (connected-down c_7_6 c_7_7)
        (connected-left c_7_6 c_6_6)
        (connected-right c_7_6 c_8_6)
        (connected-up c_8_6 c_8_5)
        (connected-down c_8_6 c_8_7)
        (connected-left c_8_6 c_7_6)
        (connected-right c_8_6 c_9_6)
        (connected-up c_9_6 c_9_5)
        (connected-down c_9_6 c_9_7)
        (connected-left c_9_6 c_8_6)
        (connected-right c_9_6 c_10_6)
        (connected-up c_10_6 c_10_5)
        (connected-down c_10_6 c_10_7)
        (connected-left c_10_6 c_9_6)
        (connected-right c_10_6 c_11_6)
        (connected-up c_11_6 c_11_5)
        (connected-down c_11_6 c_11_7)
        (connected-left c_11_6 c_10_6)
        (connected-right c_11_6 c_12_6)
        (connected-up c_12_6 c_12_5)
        (connected-down c_12_6 c_12_7)
        (connected-left c_12_6 c_11_6)
        (connected-up c_0_7 c_0_6)
        (connected-down c_0_7 c_0_8)
        (connected-right c_0_7 c_1_7)
        (connected-up c_1_7 c_1_6)
        (connected-down c_1_7 c_1_8)
        (connected-left c_1_7 c_0_7)
        (connected-right c_1_7 c_2_7)
        (connected-up c_2_7 c_2_6)
        (connected-down c_2_7 c_2_8)
        (connected-left c_2_7 c_1_7)
        (connected-right c_2_7 c_3_7)
        (connected-up c_3_7 c_3_6)
        (connected-down c_3_7 c_3_8)
        (connected-left c_3_7 c_2_7)
        (connected-right c_3_7 c_4_7)
        (connected-up c_4_7 c_4_6)
        (connected-down c_4_7 c_4_8)
        (connected-left c_4_7 c_3_7)
        (connected-right c_4_7 c_5_7)
        (connected-up c_5_7 c_5_6)
        (connected-down c_5_7 c_5_8)
        (connected-left c_5_7 c_4_7)
        (connected-right c_5_7 c_6_7)
        (connected-up c_6_7 c_6_6)
        (connected-down c_6_7 c_6_8)
        (connected-left c_6_7 c_5_7)
        (connected-right c_6_7 c_7_7)
        (connected-up c_7_7 c_7_6)
        (connected-down c_7_7 c_7_8)
        (connected-left c_7_7 c_6_7)
        (connected-right c_7_7 c_8_7)
        (connected-up c_8_7 c_8_6)
        (connected-down c_8_7 c_8_8)
        (connected-left c_8_7 c_7_7)
        (connected-right c_8_7 c_9_7)
        (connected-up c_9_7 c_9_6)
        (connected-down c_9_7 c_9_8)
        (connected-left c_9_7 c_8_7)
        (connected-right c_9_7 c_10_7)
        (connected-up c_10_7 c_10_6)
        (connected-down c_10_7 c_10_8)
        (connected-left c_10_7 c_9_7)
        (connected-right c_10_7 c_11_7)
        (connected-up c_11_7 c_11_6)
        (connected-down c_11_7 c_11_8)
        (connected-left c_11_7 c_10_7)
        (connected-right c_11_7 c_12_7)
        (connected-up c_12_7 c_12_6)
        (connected-down c_12_7 c_12_8)
        (connected-left c_12_7 c_11_7)
        (connected-up c_0_8 c_0_7)
        (connected-right c_0_8 c_1_8)
        (connected-up c_1_8 c_1_7)
        (connected-left c_1_8 c_0_8)
        (connected-right c_1_8 c_2_8)
        (connected-up c_2_8 c_2_7)
        (connected-left c_2_8 c_1_8)
        (connected-right c_2_8 c_3_8)
        (connected-up c_3_8 c_3_7)
        (connected-left c_3_8 c_2_8)
        (connected-right c_3_8 c_4_8)
        (connected-up c_4_8 c_4_7)
        (connected-left c_4_8 c_3_8)
        (connected-right c_4_8 c_5_8)
        (connected-up c_5_8 c_5_7)
        (connected-left c_5_8 c_4_8)
        (connected-right c_5_8 c_6_8)
        (connected-up c_6_8 c_6_7)
        (connected-left c_6_8 c_5_8)
        (connected-right c_6_8 c_7_8)
        (connected-up c_7_8 c_7_7)
        (connected-left c_7_8 c_6_8)
        (connected-right c_7_8 c_8_8)
        (connected-up c_8_8 c_8_7)
        (connected-left c_8_8 c_7_8)
        (connected-right c_8_8 c_9_8)
        (connected-up c_9_8 c_9_7)
        (connected-left c_9_8 c_8_8)
        (connected-right c_9_8 c_10_8)
        (connected-up c_10_8 c_10_7)
        (connected-left c_10_8 c_9_8)
        (connected-right c_10_8 c_11_8)
        (connected-up c_11_8 c_11_7)
        (connected-left c_11_8 c_10_8)
        (connected-right c_11_8 c_12_8)
        (connected-up c_12_8 c_12_7)
        (connected-left c_12_8 c_11_8)
        (turn-avatar)
        (turn-sprites)
        (turn-interactions)
        (turn-sword-disappear)
        (finished-turn-sword-disappear)
        (object-dead withkey1)
        (object-dead withkey2)
        (object-dead withkey3)
        (object-dead withkey4)
        (object-dead withkey5)
        (object-dead withkey6)
        (object-dead withkey7)
        (object-dead withkey8)
        (object-dead withkey9)
        (object-dead withkey10)
    )
    (:goal
        (AND
            (turn-avatar)
        )
    )
)