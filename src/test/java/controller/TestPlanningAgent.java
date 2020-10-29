package controller;

import core.game.Game;
import core.game.StateObservation;
import core.vgdl.VGDLFactory;
import core.vgdl.VGDLParser;
import core.vgdl.VGDLRegistry;
import ontology.Types;
import tools.ElapsedCpuTimer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertFalse;

public class TestPlanningAgent {
    private static PlanningAgent agent;
    private static StateObservation stateObservation;

    @BeforeClass
    public static void createAgent() {
        String gameFile = "src/test/resources/boulderdash.txt";
        String levelFile = "src/test/resources/boulderdash_lvl0.txt";
        int randomSeed = 0;

        VGDLFactory.GetInstance().init();
        VGDLRegistry.GetInstance().init();

        Game toPlay = new VGDLParser().parseGame(gameFile);
        toPlay.buildLevel(levelFile, randomSeed);

        stateObservation = toPlay.getObservation();
        ElapsedCpuTimer timer = new ElapsedCpuTimer();

        PlanningAgent.setGameConfigFile("src/test/resources/config.yaml");
        agent = new PlanningAgent(stateObservation, timer);
    }

    @Test
    public void testGetGameElementMatrix() {
        HashSet<String>[][] map = agent.getGameElementsMatrix(stateObservation);

        assertEquals(map.length, 26);
        assertEquals(map[0].length, 13);
        assertTrue(map[11][7].contains("avatar"));
        assertTrue(map[4][1].contains("boulder"));
        assertTrue(map[1][4].contains("diamond"));
        assertTrue(map[0][0].contains("wall"));
        assertTrue(map[1][1].contains("dirt"));
        assertTrue(map[1][6].contains("butterfly"));
        assertTrue(map[1][7].contains("background"));
        assertTrue(map[1][10].contains("crab"));
        assertTrue(map[6][11].contains("exitdoor"));
    }

    @Test
    public void testTranslateGameStateToPDDL() {
        agent.translateGameStateToPDDL(stateObservation);

        assertNotEquals(agent.PDDLGameStatePredicates.size(), 0);
        assertTrue(agent.PDDLGameStatePredicates.contains("(at p c_11_7)"));
    }

    @Test
    public void testFindPlan() {
        PDDLPlan plan = agent.findPlan();

        assertEquals(plan.getPDDLActions().size(), 12);

        agent.gameInformation.domainFile = "src/test/resources/domain_error.pddl";
        assertThrows(PlannerException.class, () -> agent.findPlan());
    }

    @Test
    public void testCheckPreconditions() {
        agent.translateGameStateToPDDL(stateObservation);

        // Preconditions of action turn-up
        ArrayList<String> preconditionsUp = new ArrayList<>();
        preconditionsUp.add("(not (oriented-up p))");

        // Preconditions of action turn-left
        ArrayList<String> preconditionsRight = new ArrayList<>();
        preconditionsRight.add("(not (oriented-right p))");

        assertTrue(agent.checkPreconditions(preconditionsUp, false));
        assertFalse(agent.checkPreconditions(preconditionsRight, false));
    }

    @Test
    public void testCheckEarlyReachedGoals() {
        agent.translateGameStateToPDDL(stateObservation);

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

        PDDLAction action = new PDDLAction(actionInstance, actionDescription, actionCorrespondence);

        // Lists of effects
        ArrayList<PDDLAction.PDDLEffect> effectsReached = new ArrayList<>();
        ArrayList<PDDLAction.PDDLEffect> effectsNotReached = new ArrayList<>();

        effectsReached.add(action.new PDDLEffect("(got g_16_9)", new ArrayList<>()));
        effectsNotReached.add(action.new PDDLEffect("(at p c_10_7)", new ArrayList<>()));

        assertTrue(agent.checkEarlyReachedGoals(effectsReached));
        assertFalse(agent.checkEarlyReachedGoals(effectsNotReached));
    }
}
