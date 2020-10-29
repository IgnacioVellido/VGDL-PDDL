package controller;

import ontology.Types;

import org.junit.Test;
import static org.junit.Assert.assertEquals;

import java.util.HashMap;

public class TestPDDLAction {
    @Test
    public void testCreation() {
        String actionInstance = "(move-left p c_10_3 c_9_3)";
        String actionDescription = "  (:action move-left\n    :parameters (p c_10_3 c_9_3)\n    " +
                ":precondition\n      (and\n        (at p c_10_3)\n        (oriented-left p)\n        " +
                "(connected-left c_10_3 c_9_3)\n        (not\n          (occupied c_9_3)\n        )\n " +
                "       (not\n          (terrain-wall c_9_3)\n        )\n      )\n    :effect\n      " +
                "(and\n        (when\n          (not\n            (terrain-empty c_9_3)\n          )\n" +
                "          (terrain-empty c_9_3)\n        )\n        (not\n          (at p c_10_3)\n" +
                "        )\n        (at p c_9_3)\n      )\n  )";

        HashMap<String, Types.ACTIONS> actionCorrespondence = new HashMap<>();
        actionCorrespondence.put("MOVE-LEFT", Types.ACTIONS.ACTION_LEFT);

        PDDLAction pddlAction = new PDDLAction(actionInstance, actionDescription, actionCorrespondence);

        assertEquals(pddlAction.getActionInstance(), actionInstance);
        assertEquals(pddlAction.getGVGAIAction(), Types.ACTIONS.ACTION_LEFT);
        assertEquals(pddlAction.getPreconditions().size(), 5);
        assertEquals(pddlAction.getEffects().size(), 3);
        assertEquals(pddlAction.getEffects().get(0).getConditions().size(), 1);
        assertEquals(pddlAction.getEffects().get(1).getConditions().size(), 0);
    }
}