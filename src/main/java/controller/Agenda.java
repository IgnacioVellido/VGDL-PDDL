/*
 * Agenda.java
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

import java.util.Comparator;
import java.util.LinkedList;
import java.util.stream.Collectors;

/**
 * Class that represents an agenda like data structure. The agenda is made up
 * of a list of pending goals (those goals that haven't been explored yet),
 * a list of preempted goals (those goals that have been suspended due to a discrepancy)
 * and a list of reached goals (those goals that have been completed). Also, it stores
 * the current goal, which is the one that the agent is trying to achieve at
 * the moment.
 * <p>
 * The lists of pending goals and preempted goals are sorted by priority. See
 * {@link PDDLSingleGoal} to get more information.
 *
 * @author Vladislav Nikolov Vasilev
 */
public class Agenda {
    private LinkedList<PDDLSingleGoal> pendingGoals;
    private LinkedList<PDDLSingleGoal> preemptedGoals;
    private LinkedList<PDDLSingleGoal> reachedGoals;
    private PDDLSingleGoal currentGoal;

    /**
     * Class constructor.
     *
     * @param goals List of goals
     */
    public Agenda(LinkedList<PDDLSingleGoal> goals) {
        this.pendingGoals = this.sortListByPriority(goals);
        this.preemptedGoals = new LinkedList<>();
        this.reachedGoals = new LinkedList<>();
        this.currentGoal = null;
    }

    public LinkedList<PDDLSingleGoal> getPendingGoals() {
        return this.pendingGoals;
    }

    public LinkedList<PDDLSingleGoal> getPreemptedGoals() {
        return this.preemptedGoals;
    }

    public LinkedList<PDDLSingleGoal> getReachedGoals() {
        return this.reachedGoals;
    }

    public PDDLSingleGoal getCurrentGoal() {
        return this.currentGoal;
    }

    /**
     * Method that sets the current goal. It chooses between the first goal of the pending
     * goals list and the first one of the preempted goals list. The goal's priority is
     * considered when choosing between them.
     *
     * @return Returns true if the goal has been set successfully or false otherwise.
     */
    public boolean setCurrentGoal() {
        // Variable that tells if the goal has been set successfully or not
        boolean setGoal = true;

        if (!this.pendingGoals.isEmpty() && this.preemptedGoals.isEmpty()) {
            // If there are only pending goals, choose the first one
            this.currentGoal = this.pendingGoals.removeFirst();
        } else if (this.pendingGoals.isEmpty() && !this.preemptedGoals.isEmpty()) {
            // If there are only preempted goals, choose the first one
            this.currentGoal = this.preemptedGoals.removeFirst();
        } else if (!this.pendingGoals.isEmpty() && !this.preemptedGoals.isEmpty()) {
            // If there are both pending and preempted goals, choose the best one according
            // to their priority. Pending goals are preferred over preempted goals in case
            // their priorities are equal
            PDDLSingleGoal firstPending = this.pendingGoals.getFirst(),
                    firstPreempted = this.preemptedGoals.getFirst();

            if (firstPreempted.getPriority() < firstPending.getPriority()) {
                this.currentGoal = firstPreempted;
                this.preemptedGoals.removeFirst();
            } else {
                this.currentGoal = firstPending;
                this.pendingGoals.removeFirst();
            }
        } else {
            // If both lists are empty, then there's no goal to be set
            setGoal = false;
        }

        return setGoal;
    }

    /**
     * Method that allows to halt the current goal in case some discrepancy is found.
     */
    public void haltCurrentGoal() {
        // Store the current goal in the preempted goals list
        this.preemptedGoals.addLast(this.currentGoal);
        this.preemptedGoals = this.sortListByPriority(this.preemptedGoals);

        this.currentGoal = null;
    }

    /**
     * Method that allows to update the reached goals list. It should be called when the
     * current goal has been reached successfully.
     */
    public void updateReachedGoals() {
        // Add the current goal to the reached goals list
        this.reachedGoals.addLast(this.currentGoal);

        this.currentGoal = null;
    }

    /**
     * Method that allows to check whether a predicate is contained in the pending
     * goals list.
     *
     * @param predicate Predicate to be searched.
     * @return Returns a PDDLSingleGoal instance containing the predicate if it is
     * found and null otherwise.
     */
    public PDDLSingleGoal containedPredicateInPendingGoals(String predicate) {
        return this.containedPredicateInGoalsList(predicate, this.pendingGoals);
    }

    /**
     * Method that allows to check whether a predicate is contained in the preempted
     * goals list.
     *
     * @param predicate Predicate to be searched.
     * @return Returns a PDDLSingleGoal instance containing the predicate if it is
     * found and null otherwise.
     */
    public PDDLSingleGoal containedPredicateInPreemptedGoals(String predicate) {
        return this.containedPredicateInGoalsList(predicate, this.preemptedGoals);
    }

    /**
     * Method that allows to move a goal instance from the pending goals list
     * to the reached goals list.
     *
     * @param goal PDDLSingleGoal instance to be moved.
     */
    public void setReachedFromPending(PDDLSingleGoal goal) {
        this.setReachedFromList(goal, this.pendingGoals);
    }

    /**
     * Method that allows to move a goal instance from the preempted goals list
     * to the reached goals list.
     *
     * @param goal PDDLSingleGoal instance to be moved.
     */
    public void setReachedFromPreempted(PDDLSingleGoal goal) {
        this.setReachedFromList(goal, this.preemptedGoals);
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("\n--------------------------------------------------------------------------------\n");
        builder.append("\n-----------------------------------  AGENDA  -----------------------------------\n");

        builder.append("\nList of NOT PLANNED goals:");

        for (PDDLSingleGoal pending : this.pendingGoals) {
            builder.append(pending.toString());
        }

        builder.append("\n\nList of PREEMPTED (halted) goals:");

        for (PDDLSingleGoal preempted : this.preemptedGoals) {
            builder.append(preempted.toString());
        }

        builder.append("\n\nList of REACHED goals:");

        for (PDDLSingleGoal reached : this.reachedGoals) {
            builder.append(reached.toString());
        }

        builder.append("\n\nCURRENT goal:");

        if (this.currentGoal != null) {
            builder.append(this.currentGoal.toString());
        }

        builder.append("\n\n--------------------------------------------------------------------------------\n");

        return builder.toString();
    }

    /**
     * Method that sorts a list of goals. The list is sorted by priority.
     *
     * @param list LinkedList of goals to be sorted
     * @return Returns the input list sorted by priority.
     */
    private LinkedList<PDDLSingleGoal> sortListByPriority(LinkedList<PDDLSingleGoal> list) {
        return list
                .stream()
                .sorted(Comparator.comparingInt(PDDLSingleGoal::getPriority))
                .collect(Collectors.toCollection(LinkedList::new));
    }

    /**
     * Method used to check if a PDDL predicate is contained in some list of the
     * agenda.
     *
     * @param predicate Predicate to be searched in a given list.
     * @param goalsList List of PDDLSingleGoal in which the predicate is searched.
     * @return Returns a PDDLSingleGoal instance containing the predicate if it is
     * found and null otherwise.
     */
    private PDDLSingleGoal containedPredicateInGoalsList(String predicate, LinkedList<PDDLSingleGoal> goalsList) {
        PDDLSingleGoal containedGoal = null;

        for (PDDLSingleGoal goal : goalsList) {
            if (goal.getGoalPredicate().equals(predicate)) {
                containedGoal = goal;
            }
        }

        return containedGoal;
    }

    /**
     * Method that allows to move a goal instance from a given list to the reached
     * goals list.
     *
     * @param goal      PDDLSingleGoal instance to be moved.
     * @param goalsList List from which the goal will be removed.
     */
    private void setReachedFromList(PDDLSingleGoal goal, LinkedList<PDDLSingleGoal> goalsList) {
        goalsList.remove(goal);
        this.reachedGoals.addLast(goal);
    }
}
