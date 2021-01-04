(define (problem VGDLGameProblem)
    (:domain VGDLGame)
    (:objects
        avatar - avatar
        keym1 keym2 keym3 keym4 keym5 keym6 keym7 keym8 keym9 keym10 - keym
        c_0_0 c_1_0 c_2_0 c_3_0 c_4_0 c_5_0 c_6_0 c_7_0 c_8_0 c_9_0 c_10_0 c_11_0 c_12_0 c_0_1 c_1_1 c_2_1 c_6_1 c_10_1 c_11_1 c_12_1 c_0_2 c_1_2 c_2_2 c_4_2 c_6_2 c_11_2 c_12_2 c_0_3 c_4_3 c_7_3 c_9_3 c_12_3 c_0_4 c_1_4 c_9_4 c_12_4 c_0_5 c_1_5 c_2_5 c_7_5 c_9_5 c_12_5 c_0_6 c_1_6 c_2_6 c_3_6 c_4_6 c_5_6 c_6_6 c_7_6 c_8_6 c_9_6 c_11_6 c_12_6 c_0_7 c_4_7 c_5_7 c_12_7 c_0_8 c_1_8 c_2_8 c_8_8 c_11_8 c_12_8 c_0_9 c_1_9 c_2_9 c_3_9 c_5_9 c_10_9 c_11_9 c_12_9 c_0_10 c_1_10 c_6_10 c_7_10 c_11_10 c_12_10 c_0_11 c_1_11 c_2_11 c_3_11 c_4_11 c_5_11 c_6_11 c_7_11 c_8_11 c_9_11 c_10_11 c_11_11 c_12_11 - cell
        green_6_2 green_4_7 green_1_8 green_11_8 green_2_9 green_10_9 green_1_10 green_6_10 green_11_10 - green
        wall_0_0 wall_1_0 wall_2_0 wall_3_0 wall_4_0 wall_5_0 wall_6_0 wall_7_0 wall_8_0 wall_9_0 wall_10_0 wall_11_0 wall_12_0 wall_0_1 wall_6_1 wall_12_1 wall_0_2 wall_1_2 wall_2_2 wall_4_2 wall_12_2 wall_0_3 wall_4_3 wall_9_3 wall_12_3 wall_0_4 wall_9_4 wall_12_4 wall_0_5 wall_9_5 wall_12_5 wall_0_6 wall_1_6 wall_2_6 wall_3_6 wall_4_6 wall_5_6 wall_6_6 wall_7_6 wall_8_6 wall_9_6 wall_11_6 wall_12_6 wall_0_7 wall_5_7 wall_12_7 wall_0_8 wall_8_8 wall_12_8 wall_0_9 wall_5_9 wall_12_9 wall_0_10 wall_12_10 wall_0_11 wall_1_11 wall_2_11 wall_3_11 wall_4_11 wall_5_11 wall_6_11 wall_7_11 wall_8_11 wall_9_11 wall_10_11 wall_11_11 wall_12_11 - wall
        door_2_1 - door
        red_11_1 red_1_5 red_11_9 - red
        boulder_7_3 boulder_7_5 - boulder
        exit_1_1 - exit
        blue_10_1 blue_11_2 blue_1_4 blue_2_5 blue_1_9 blue_7_10 - blue
        key_3_9 key1 key2 key3 key4 key5 key6 key7 key8 key9 key10 - key
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
        (at c_1_1 exit_1_1)
        (last-at c_1_1 exit_1_1)
        (at c_2_1 door_2_1)
        (last-at c_2_1 door_2_1)
        (at c_6_1 wall_6_1)
        (last-at c_6_1 wall_6_1)
        (at c_10_1 blue_10_1)
        (last-at c_10_1 blue_10_1)
        (at c_11_1 red_11_1)
        (last-at c_11_1 red_11_1)
        (at c_12_1 wall_12_1)
        (last-at c_12_1 wall_12_1)
        (at c_0_2 wall_0_2)
        (last-at c_0_2 wall_0_2)
        (at c_1_2 wall_1_2)
        (last-at c_1_2 wall_1_2)
        (at c_2_2 wall_2_2)
        (last-at c_2_2 wall_2_2)
        (at c_4_2 wall_4_2)
        (last-at c_4_2 wall_4_2)
        (at c_6_2 green_6_2)
        (last-at c_6_2 green_6_2)
        (at c_11_2 blue_11_2)
        (last-at c_11_2 blue_11_2)
        (at c_12_2 wall_12_2)
        (last-at c_12_2 wall_12_2)
        (at c_0_3 wall_0_3)
        (last-at c_0_3 wall_0_3)
        (at c_4_3 wall_4_3)
        (last-at c_4_3 wall_4_3)
        (at c_7_3 boulder_7_3)
        (last-at c_7_3 boulder_7_3)
        (at c_9_3 wall_9_3)
        (last-at c_9_3 wall_9_3)
        (at c_12_3 wall_12_3)
        (last-at c_12_3 wall_12_3)
        (at c_0_4 wall_0_4)
        (last-at c_0_4 wall_0_4)
        (at c_1_4 blue_1_4)
        (last-at c_1_4 blue_1_4)
        (at c_9_4 wall_9_4)
        (last-at c_9_4 wall_9_4)
        (at c_12_4 wall_12_4)
        (last-at c_12_4 wall_12_4)
        (at c_0_5 wall_0_5)
        (last-at c_0_5 wall_0_5)
        (at c_1_5 red_1_5)
        (last-at c_1_5 red_1_5)
        (at c_2_5 blue_2_5)
        (last-at c_2_5 blue_2_5)
        (at c_7_5 boulder_7_5)
        (last-at c_7_5 boulder_7_5)
        (at c_9_5 wall_9_5)
        (last-at c_9_5 wall_9_5)
        (at c_12_5 wall_12_5)
        (last-at c_12_5 wall_12_5)
        (at c_0_6 wall_0_6)
        (last-at c_0_6 wall_0_6)
        (at c_1_6 wall_1_6)
        (last-at c_1_6 wall_1_6)
        (at c_2_6 wall_2_6)
        (last-at c_2_6 wall_2_6)
        (at c_3_6 wall_3_6)
        (last-at c_3_6 wall_3_6)
        (at c_4_6 wall_4_6)
        (last-at c_4_6 wall_4_6)
        (at c_5_6 wall_5_6)
        (last-at c_5_6 wall_5_6)
        (at c_6_6 wall_6_6)
        (last-at c_6_6 wall_6_6)
        (at c_7_6 wall_7_6)
        (last-at c_7_6 wall_7_6)
        (at c_8_6 wall_8_6)
        (last-at c_8_6 wall_8_6)
        (at c_9_6 wall_9_6)
        (last-at c_9_6 wall_9_6)
        (at c_11_6 wall_11_6)
        (last-at c_11_6 wall_11_6)
        (at c_12_6 wall_12_6)
        (last-at c_12_6 wall_12_6)
        (at c_0_7 wall_0_7)
        (last-at c_0_7 wall_0_7)
        (at c_4_7 green_4_7)
        (last-at c_4_7 green_4_7)
        (at c_5_7 wall_5_7)
        (last-at c_5_7 wall_5_7)
        (at c_12_7 wall_12_7)
        (last-at c_12_7 wall_12_7)
        (at c_0_8 wall_0_8)
        (last-at c_0_8 wall_0_8)
        (at c_1_8 green_1_8)
        (last-at c_1_8 green_1_8)
        (oriented-right avatar)
        (at c_2_8 avatar)
        (last-at c_2_8 avatar)
        (at c_8_8 wall_8_8)
        (last-at c_8_8 wall_8_8)
        (at c_11_8 green_11_8)
        (last-at c_11_8 green_11_8)
        (at c_12_8 wall_12_8)
        (last-at c_12_8 wall_12_8)
        (at c_0_9 wall_0_9)
        (last-at c_0_9 wall_0_9)
        (at c_1_9 blue_1_9)
        (last-at c_1_9 blue_1_9)
        (at c_2_9 green_2_9)
        (last-at c_2_9 green_2_9)
        (at c_3_9 key_3_9)
        (last-at c_3_9 key_3_9)
        (at c_5_9 wall_5_9)
        (last-at c_5_9 wall_5_9)
        (at c_10_9 green_10_9)
        (last-at c_10_9 green_10_9)
        (at c_11_9 red_11_9)
        (last-at c_11_9 red_11_9)
        (at c_12_9 wall_12_9)
        (last-at c_12_9 wall_12_9)
        (at c_0_10 wall_0_10)
        (last-at c_0_10 wall_0_10)
        (at c_1_10 green_1_10)
        (last-at c_1_10 green_1_10)
        (at c_6_10 green_6_10)
        (last-at c_6_10 green_6_10)
        (at c_7_10 blue_7_10)
        (last-at c_7_10 blue_7_10)
        (at c_11_10 green_11_10)
        (last-at c_11_10 green_11_10)
        (at c_12_10 wall_12_10)
        (last-at c_12_10 wall_12_10)
        (at c_0_11 wall_0_11)
        (last-at c_0_11 wall_0_11)
        (at c_1_11 wall_1_11)
        (last-at c_1_11 wall_1_11)
        (at c_2_11 wall_2_11)
        (last-at c_2_11 wall_2_11)
        (at c_3_11 wall_3_11)
        (last-at c_3_11 wall_3_11)
        (at c_4_11 wall_4_11)
        (last-at c_4_11 wall_4_11)
        (at c_5_11 wall_5_11)
        (last-at c_5_11 wall_5_11)
        (at c_6_11 wall_6_11)
        (last-at c_6_11 wall_6_11)
        (at c_7_11 wall_7_11)
        (last-at c_7_11 wall_7_11)
        (at c_8_11 wall_8_11)
        (last-at c_8_11 wall_8_11)
        (at c_9_11 wall_9_11)
        (last-at c_9_11 wall_9_11)
        (at c_10_11 wall_10_11)
        (last-at c_10_11 wall_10_11)
        (at c_11_11 wall_11_11)
        (last-at c_11_11 wall_11_11)
        (at c_12_11 wall_12_11)
        (last-at c_12_11 wall_12_11)
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
        (connected-down c_0_8 c_0_9)
        (connected-right c_0_8 c_1_8)
        (connected-up c_1_8 c_1_7)
        (connected-down c_1_8 c_1_9)
        (connected-left c_1_8 c_0_8)
        (connected-right c_1_8 c_2_8)
        (connected-up c_2_8 c_2_7)
        (connected-down c_2_8 c_2_9)
        (connected-left c_2_8 c_1_8)
        (connected-right c_2_8 c_3_8)
        (connected-up c_3_8 c_3_7)
        (connected-down c_3_8 c_3_9)
        (connected-left c_3_8 c_2_8)
        (connected-right c_3_8 c_4_8)
        (connected-up c_4_8 c_4_7)
        (connected-down c_4_8 c_4_9)
        (connected-left c_4_8 c_3_8)
        (connected-right c_4_8 c_5_8)
        (connected-up c_5_8 c_5_7)
        (connected-down c_5_8 c_5_9)
        (connected-left c_5_8 c_4_8)
        (connected-right c_5_8 c_6_8)
        (connected-up c_6_8 c_6_7)
        (connected-down c_6_8 c_6_9)
        (connected-left c_6_8 c_5_8)
        (connected-right c_6_8 c_7_8)
        (connected-up c_7_8 c_7_7)
        (connected-down c_7_8 c_7_9)
        (connected-left c_7_8 c_6_8)
        (connected-right c_7_8 c_8_8)
        (connected-up c_8_8 c_8_7)
        (connected-down c_8_8 c_8_9)
        (connected-left c_8_8 c_7_8)
        (connected-right c_8_8 c_9_8)
        (connected-up c_9_8 c_9_7)
        (connected-down c_9_8 c_9_9)
        (connected-left c_9_8 c_8_8)
        (connected-right c_9_8 c_10_8)
        (connected-up c_10_8 c_10_7)
        (connected-down c_10_8 c_10_9)
        (connected-left c_10_8 c_9_8)
        (connected-right c_10_8 c_11_8)
        (connected-up c_11_8 c_11_7)
        (connected-down c_11_8 c_11_9)
        (connected-left c_11_8 c_10_8)
        (connected-right c_11_8 c_12_8)
        (connected-up c_12_8 c_12_7)
        (connected-down c_12_8 c_12_9)
        (connected-left c_12_8 c_11_8)
        (connected-up c_0_9 c_0_8)
        (connected-down c_0_9 c_0_10)
        (connected-right c_0_9 c_1_9)
        (connected-up c_1_9 c_1_8)
        (connected-down c_1_9 c_1_10)
        (connected-left c_1_9 c_0_9)
        (connected-right c_1_9 c_2_9)
        (connected-up c_2_9 c_2_8)
        (connected-down c_2_9 c_2_10)
        (connected-left c_2_9 c_1_9)
        (connected-right c_2_9 c_3_9)
        (connected-up c_3_9 c_3_8)
        (connected-down c_3_9 c_3_10)
        (connected-left c_3_9 c_2_9)
        (connected-right c_3_9 c_4_9)
        (connected-up c_4_9 c_4_8)
        (connected-down c_4_9 c_4_10)
        (connected-left c_4_9 c_3_9)
        (connected-right c_4_9 c_5_9)
        (connected-up c_5_9 c_5_8)
        (connected-down c_5_9 c_5_10)
        (connected-left c_5_9 c_4_9)
        (connected-right c_5_9 c_6_9)
        (connected-up c_6_9 c_6_8)
        (connected-down c_6_9 c_6_10)
        (connected-left c_6_9 c_5_9)
        (connected-right c_6_9 c_7_9)
        (connected-up c_7_9 c_7_8)
        (connected-down c_7_9 c_7_10)
        (connected-left c_7_9 c_6_9)
        (connected-right c_7_9 c_8_9)
        (connected-up c_8_9 c_8_8)
        (connected-down c_8_9 c_8_10)
        (connected-left c_8_9 c_7_9)
        (connected-right c_8_9 c_9_9)
        (connected-up c_9_9 c_9_8)
        (connected-down c_9_9 c_9_10)
        (connected-left c_9_9 c_8_9)
        (connected-right c_9_9 c_10_9)
        (connected-up c_10_9 c_10_8)
        (connected-down c_10_9 c_10_10)
        (connected-left c_10_9 c_9_9)
        (connected-right c_10_9 c_11_9)
        (connected-up c_11_9 c_11_8)
        (connected-down c_11_9 c_11_10)
        (connected-left c_11_9 c_10_9)
        (connected-right c_11_9 c_12_9)
        (connected-up c_12_9 c_12_8)
        (connected-down c_12_9 c_12_10)
        (connected-left c_12_9 c_11_9)
        (connected-up c_0_10 c_0_9)
        (connected-down c_0_10 c_0_11)
        (connected-right c_0_10 c_1_10)
        (connected-up c_1_10 c_1_9)
        (connected-down c_1_10 c_1_11)
        (connected-left c_1_10 c_0_10)
        (connected-right c_1_10 c_2_10)
        (connected-up c_2_10 c_2_9)
        (connected-down c_2_10 c_2_11)
        (connected-left c_2_10 c_1_10)
        (connected-right c_2_10 c_3_10)
        (connected-up c_3_10 c_3_9)
        (connected-down c_3_10 c_3_11)
        (connected-left c_3_10 c_2_10)
        (connected-right c_3_10 c_4_10)
        (connected-up c_4_10 c_4_9)
        (connected-down c_4_10 c_4_11)
        (connected-left c_4_10 c_3_10)
        (connected-right c_4_10 c_5_10)
        (connected-up c_5_10 c_5_9)
        (connected-down c_5_10 c_5_11)
        (connected-left c_5_10 c_4_10)
        (connected-right c_5_10 c_6_10)
        (connected-up c_6_10 c_6_9)
        (connected-down c_6_10 c_6_11)
        (connected-left c_6_10 c_5_10)
        (connected-right c_6_10 c_7_10)
        (connected-up c_7_10 c_7_9)
        (connected-down c_7_10 c_7_11)
        (connected-left c_7_10 c_6_10)
        (connected-right c_7_10 c_8_10)
        (connected-up c_8_10 c_8_9)
        (connected-down c_8_10 c_8_11)
        (connected-left c_8_10 c_7_10)
        (connected-right c_8_10 c_9_10)
        (connected-up c_9_10 c_9_9)
        (connected-down c_9_10 c_9_11)
        (connected-left c_9_10 c_8_10)
        (connected-right c_9_10 c_10_10)
        (connected-up c_10_10 c_10_9)
        (connected-down c_10_10 c_10_11)
        (connected-left c_10_10 c_9_10)
        (connected-right c_10_10 c_11_10)
        (connected-up c_11_10 c_11_9)
        (connected-down c_11_10 c_11_11)
        (connected-left c_11_10 c_10_10)
        (connected-right c_11_10 c_12_10)
        (connected-up c_12_10 c_12_9)
        (connected-down c_12_10 c_12_11)
        (connected-left c_12_10 c_11_10)
        (connected-up c_0_11 c_0_10)
        (connected-right c_0_11 c_1_11)
        (connected-up c_1_11 c_1_10)
        (connected-left c_1_11 c_0_11)
        (connected-right c_1_11 c_2_11)
        (connected-up c_2_11 c_2_10)
        (connected-left c_2_11 c_1_11)
        (connected-right c_2_11 c_3_11)
        (connected-up c_3_11 c_3_10)
        (connected-left c_3_11 c_2_11)
        (connected-right c_3_11 c_4_11)
        (connected-up c_4_11 c_4_10)
        (connected-left c_4_11 c_3_11)
        (connected-right c_4_11 c_5_11)
        (connected-up c_5_11 c_5_10)
        (connected-left c_5_11 c_4_11)
        (connected-right c_5_11 c_6_11)
        (connected-up c_6_11 c_6_10)
        (connected-left c_6_11 c_5_11)
        (connected-right c_6_11 c_7_11)
        (connected-up c_7_11 c_7_10)
        (connected-left c_7_11 c_6_11)
        (connected-right c_7_11 c_8_11)
        (connected-up c_8_11 c_8_10)
        (connected-left c_8_11 c_7_11)
        (connected-right c_8_11 c_9_11)
        (connected-up c_9_11 c_9_10)
        (connected-left c_9_11 c_8_11)
        (connected-right c_9_11 c_10_11)
        (connected-up c_10_11 c_10_10)
        (connected-left c_10_11 c_9_11)
        (connected-right c_10_11 c_11_11)
        (connected-up c_11_11 c_11_10)
        (connected-left c_11_11 c_10_11)
        (connected-right c_11_11 c_12_11)
        (connected-up c_12_11 c_12_10)
        (connected-left c_12_11 c_11_11)
        (turn-avatar)
        (turn-sprites)
        (turn-interactions)
        (turn-keym-move)
        (finished-turn-keym-move)
        (object-dead key1)
        (object-dead key2)
        (object-dead key3)
        (object-dead key4)
        (object-dead key5)
        (object-dead key6)
        (object-dead key7)
        (object-dead key8)
        (object-dead key9)
        (object-dead key10)
        (object-dead keym1)
        (object-dead keym2)
        (object-dead keym3)
        (object-dead keym4)
        (object-dead keym5)
        (object-dead keym6)
        (object-dead keym7)
        (object-dead keym8)
        (object-dead keym9)
        (object-dead keym10)
    )
    (:goal
        (AND
            (turn-avatar)
        )
    )
)