/*
 * PDDLPlan.java
 *
 * Copyright (C) 2020 Vladislav Nikolov Vasilev
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see https://www.gnu.org/licenses/gpl-3.0.html.
 */

/**
 * Package that contains the planning agent along with its data structures.
 */
package controller;

import kong.unirest.json.JSONArray;
import kong.unirest.json.JSONObject;
import ontology.Types;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Class that represents a PDDL plan. A PDDLPlan object is made up of a list of
 * PDDL actions. It also contains an iterator which allows to iterate over each
 * one of the actions of the plan.
 *
 * @author Vladislav Nikolov Vasilev
 */
public class PDDLPlan implements Iterable<PDDLAction> {
    private List<PDDLAction> PDDLActions;

    /**
     * Default class constructor. Creates an object with an empty plan.
     */
    public PDDLPlan() {
        this.PDDLActions = new ArrayList<>();
    }

    /**
     * Class constructor. Creates an object with a valid plan.
     *
     * @param plannerResponse      JSONObject that represents the planner's response. It must
     *                             be a valid response (a response that contains a valid plan).
     * @param actionCorrespondence Map that represents the correspondence between PDDL and
     *                             GVGAI actions.
     */
    public PDDLPlan(JSONObject plannerResponse, Map<String, Types.ACTIONS> actionCorrespondence) {
        // Get the plan from the JSON object
        JSONArray plan = plannerResponse.getJSONObject("result").getJSONArray("plan");

        // Create a new empty list of actions
        ArrayList<PDDLAction> PDDLActionList = new ArrayList<>();

        this.PDDLActions = new ArrayList<>();

        // Transform each action to a PDDLAction instance
        for (int i = 0; i < plan.length(); i++) {
            // Get the JSON object that represents an action
            JSONObject action = plan.getJSONObject(i);

            // Get Strings that represent the action instance and its preconditions
            String actionInstance = action.getString("name");
            String actionDescription = action.getString("action");

            // Add the new action to the list
            PDDLActionList.add(new PDDLAction(actionInstance, actionDescription, actionCorrespondence));
        }

        // Process resulting list of actions removing all null actions. These actions are the ones
        // that don't have a correspondence
        this.PDDLActions = PDDLActionList
                .stream()
                .filter(PDDLAction -> PDDLAction.getGVGAIAction() != null)
                .collect(Collectors.toList());
    }

    public List<PDDLAction> getPDDLActions() {
        return this.PDDLActions;
    }

    /**
     * Method used to clear the plan. It removes all the actions from the plan, leaving an
     * empty plan.
     */
    public void clearPlan() {
        this.PDDLActions.clear();
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();

        builder.append("\n--------------------------------------------------------------------------------\n");
        builder.append("\n------------------------------------  PLAN  ------------------------------------\n");

        for (PDDLAction action : this.PDDLActions) {
            builder.append(action.toString());
        }

        builder.append("\n\n--------------------------------------------------------------------------------\n");

        return builder.toString();
    }

    /**
     * Method that returns an iterator which allows to iterate over the plan's actions.
     *
     * @return Returns a new PDDLAction iterator.
     */
    @Override
    public Iterator<PDDLAction> iterator() {
        Iterator<PDDLAction> iterator = new Iterator<PDDLAction>() {
            private int currentIdx = 0;

            @Override
            public boolean hasNext() {
                return currentIdx < PDDLActions.size() && PDDLActions.get(currentIdx) != null;
            }

            @Override
            public PDDLAction next() {
                return PDDLActions.get(currentIdx++);
            }
        };

        return iterator;
    }
}
