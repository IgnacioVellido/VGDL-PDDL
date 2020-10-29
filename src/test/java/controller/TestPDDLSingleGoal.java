package controller;

import org.junit.Test;

import java.util.Arrays;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

public class TestPDDLSingleGoal {

    @Test
    public void testEquals(){
        PDDLSingleGoal singleGoal1 = new PDDLSingleGoal();
        PDDLSingleGoal singleGoal2 = new PDDLSingleGoal();

        singleGoal1.setGoalPredicate("(at p c_1_1)");
        singleGoal1.setPriority(1);
        singleGoal1.setSaveGoal(false);
        singleGoal1.setRemoveReachedGoalsList(null);

        singleGoal2.setGoalPredicate("(at p c_1_1)");
        singleGoal2.setPriority(1);
        singleGoal2.setSaveGoal(false);
        singleGoal2.setRemoveReachedGoalsList(Arrays.asList(new String[]{"(exists p)"}));

        assertNotEquals(singleGoal1, singleGoal2);

        singleGoal2.setRemoveReachedGoalsList(null);

        assertEquals(singleGoal1, singleGoal1);
        assertEquals(singleGoal1, singleGoal2);
    }
}