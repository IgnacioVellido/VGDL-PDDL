/*
 * PDDLSingleGoal.java
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

import java.util.List;

/**
 * Class that represents a PDDL goal. A PDDLSingleGoal object contains a PDDL
 * predicate, a priority with regards to other goals, a flag that indicates
 * whether the goal has to be saved or not and a list of goals to be removed
 * once that goal is reached, if any.
 *
 * @author Vladislav Nikolov Vasilev
 */
public class PDDLSingleGoal {
    private String goalPredicate;
    private int priority;
    private boolean saveGoal;
    private List<String> removeReachedGoalsList;

    /**
     * Class default constructor. Creates a new PDDLSingleGoal instance.
     */
    public PDDLSingleGoal() {
    }

    public String getGoalPredicate() {
        return this.goalPredicate;
    }

    public void setGoalPredicate(String goalPredicate) {
        this.goalPredicate = goalPredicate;
    }

    public int getPriority() {
        return this.priority;
    }

    public void setPriority(int priority) {
        this.priority = priority;
    }

    public boolean isSaveGoal() {
        return this.saveGoal;
    }

    public void setSaveGoal(boolean saveGoal) {
        this.saveGoal = saveGoal;
    }

    public List<String> getRemoveReachedGoalsList() {
        return removeReachedGoalsList;
    }

    public void setRemoveReachedGoalsList(List<String> removeReachedGoalsList) {
        this.removeReachedGoalsList = removeReachedGoalsList;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();

        builder.append("\n\n\t### PDDL single goal ###\n");
        builder.append(String.format("\t|--- Goal predicate: %s\n", this.goalPredicate));
        builder.append(String.format("\t|--- Priority: %d\n", this.priority));
        builder.append(String.format("\t|--- Save goal: %s\n", this.saveGoal));
        builder.append(String.format("\t|--- List of reached goals to remove: %s", this.removeReachedGoalsList));

        return builder.toString();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }

        if (o == null || this.getClass() != o.getClass()) {
            return false;
        }

        PDDLSingleGoal that = (PDDLSingleGoal) o;

        boolean areEqual;

        if (this.removeReachedGoalsList != null && that.removeReachedGoalsList != null) {
            areEqual = this.goalPredicate.equals(that.goalPredicate) &&
                    this.priority == that.priority &&
                    this.saveGoal == that.saveGoal &&
                    this.removeReachedGoalsList.equals(that.removeReachedGoalsList);
        } else if (this.removeReachedGoalsList == null && that.removeReachedGoalsList == null) {
            areEqual = this.goalPredicate.equals(that.goalPredicate) &&
                    this.priority == that.priority &&
                    this.saveGoal == that.saveGoal;
        } else {
            areEqual = false;
        }

        return areEqual;
    }
}
