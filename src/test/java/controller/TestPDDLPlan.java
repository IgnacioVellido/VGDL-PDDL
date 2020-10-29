package controller;

import kong.unirest.HttpResponse;
import kong.unirest.JsonNode;
import kong.unirest.Unirest;
import kong.unirest.json.JSONObject;

import ontology.Types;

import org.junit.Test;
import org.junit.BeforeClass;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.stream.Stream;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

public class TestPDDLPlan {
    private PDDLPlan pddlPlan;
    private static HashMap<String, Types.ACTIONS> actionsCorrespondence;
    private static JSONObject responseBody;

    private static String readFile(String filename) {
        // Create builder that will contain the file's content
        StringBuilder contentBuilder = new StringBuilder();

        // Get content from file line per line
        try (Stream<String> stream = Files.lines(Paths.get(filename))) {
            stream.forEach(s -> contentBuilder.append(s).append("\n"));
        } catch (IOException e) {
            e.printStackTrace();
        }

        return contentBuilder.toString();
    }

    @BeforeClass
    public static void instantiatePDDLPlan() {
        String domain = readFile("src/test/resources/domain.pddl");
        String problem = readFile("src/test/resources/problem.pddl");

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("domain", domain);
        jsonObject.put("problem", problem);

        String url = "http://solver.planning.domains/solve";
        HttpResponse<JsonNode> response = Unirest.post(url)
                .header("Content-Type", "application/json")
                .body(jsonObject)
                .asJson();

        responseBody =  response.getBody().getObject();

        actionsCorrespondence = new HashMap<>();
        actionsCorrespondence.put("TURN-UP", Types.ACTIONS.ACTION_UP);
        actionsCorrespondence.put("TURN-DOWN", Types.ACTIONS.ACTION_DOWN);
        actionsCorrespondence.put("TURN-LEFT", Types.ACTIONS.ACTION_LEFT);
        actionsCorrespondence.put("TURN-RIGHT", Types.ACTIONS.ACTION_RIGHT);
        actionsCorrespondence.put("MOVE-UP", Types.ACTIONS.ACTION_UP);
        actionsCorrespondence.put("MOVE-DOWN", Types.ACTIONS.ACTION_DOWN);
        actionsCorrespondence.put("MOVE-LEFT", Types.ACTIONS.ACTION_LEFT);
        actionsCorrespondence.put("MOVE-RIGHT", Types.ACTIONS.ACTION_RIGHT);
        actionsCorrespondence.put("MOVE-UP-GET-GEM", Types.ACTIONS.ACTION_UP);
        actionsCorrespondence.put("MOVE-DOWN-GET-GEM", Types.ACTIONS.ACTION_DOWN);
        actionsCorrespondence.put("MOVE-LEFT-GET-GEM", Types.ACTIONS.ACTION_LEFT);
        actionsCorrespondence.put("MOVE-RIGHT-GET-GEM", Types.ACTIONS.ACTION_RIGHT);
        actionsCorrespondence.put("DIG-UP", Types.ACTIONS.ACTION_USE);
        actionsCorrespondence.put("DIG-DOWN", Types.ACTIONS.ACTION_USE);
        actionsCorrespondence.put("DIG-LEFT", Types.ACTIONS.ACTION_USE);
        actionsCorrespondence.put("DIG-RIGHT", Types.ACTIONS.ACTION_USE);
    }

    @Test
    public void testCreation() {
        this.pddlPlan = new PDDLPlan(responseBody, actionsCorrespondence);

        assertEquals(this.pddlPlan.getPDDLActions().size(), 12);
    }

    @Test
    public void testClearPlan() {
        this.pddlPlan = new PDDLPlan(responseBody, actionsCorrespondence);
        assertNotEquals(this.pddlPlan.getPDDLActions().size(), 0);

        this.pddlPlan.clearPlan();
        assertEquals(this.pddlPlan.getPDDLActions().size(), 0);
    }
}