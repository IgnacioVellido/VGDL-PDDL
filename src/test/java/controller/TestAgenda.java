package controller;

import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import java.util.LinkedList;

public class TestAgenda {
    private Agenda agenda;

    private PDDLSingleGoal goal1;
    private PDDLSingleGoal goal2;
    private PDDLSingleGoal goal3;

    @Before
    public void createAgenda() {
        this.goal1 = new PDDLSingleGoal();
        this.goal2 = new PDDLSingleGoal();
        this.goal3 = new PDDLSingleGoal();

        this.goal1.setGoalPredicate("(has fire-boots)");
        this.goal1.setPriority(1);
        this.goal1.setSaveGoal(false);
        this.goal1.setRemoveReachedGoalsList(null);

        this.goal2.setGoalPredicate("(has ice-boots)");
        this.goal2.setPriority(2);
        this.goal2.setSaveGoal(false);
        this.goal2.setRemoveReachedGoalsList(null);

        this.goal3.setGoalPredicate("(has air-boots)");
        this.goal3.setPriority(2);
        this.goal3.setSaveGoal(false);
        this.goal3.setRemoveReachedGoalsList(null);

        LinkedList<PDDLSingleGoal> goalsList = new LinkedList<>();

        goalsList.addLast(goal1);
        goalsList.addLast(goal2);
        goalsList.addLast(goal3);

        this.agenda = new Agenda(goalsList);
    }

    @Test
    public void testAgendaCreation() {
        assertEquals(this.agenda.getCurrentGoal(), null);
        assertEquals(this.agenda.getPendingGoals().size(), 3);
        assertEquals(this.agenda.getPreemptedGoals().size(), 0);
        assertEquals(this.agenda.getReachedGoals().size(), 0);
    }

    @Test
    public void testSetCurrentGoalBaseVersion() {
        this.agenda.setCurrentGoal();

        assertEquals(this.agenda.getCurrentGoal(), this.goal1);
    }

    @Test
    public void testHaltCurrentGoal() {
        this.agenda.setCurrentGoal();
        this.agenda.haltCurrentGoal();

        assertNull(this.agenda.getCurrentGoal());
        assertEquals(this.agenda.getPreemptedGoals().size(), 1);
    }

    @Test
    public void testUpdateReachedGoals() {
        this.agenda.setCurrentGoal();

        this.agenda.updateReachedGoals();

        assertEquals(this.agenda.getReachedGoals().size(), 1);
        assertEquals(this.agenda.getReachedGoals().get(0), this.goal1);
    }

    @Test
    public void testSetCurrentGoalPreemptedSmallerPriority() {
        this.agenda.setCurrentGoal();
        this.agenda.haltCurrentGoal();
        this.agenda.setCurrentGoal();

        assertEquals(this.agenda.getCurrentGoal(), this.goal1);
    }

    @Test
    public void testSetCurrentGoalPreemptedSamePriority() {
        this.agenda.setCurrentGoal();
        this.agenda.updateReachedGoals();

        this.agenda.setCurrentGoal();
        this.agenda.haltCurrentGoal();

        this.agenda.setCurrentGoal();

        assertEquals(this.agenda.getCurrentGoal(), this.goal3);
    }

    @Test
    public void testContainedPredicateInPendingGoals() {
        String correctPredicate = "(has fire-boots)";
        String wrongPredicate = "(has fire-sword)";

        assertEquals(this.agenda.containedPredicateInPendingGoals(correctPredicate), this.goal1);
        assertNull(this.agenda.containedPredicateInPendingGoals(wrongPredicate));
    }

    @Test
    public void testContainedPredicateInPreemptedGoals() {
        this.agenda.setCurrentGoal();
        this.agenda.haltCurrentGoal();

        String correctPredicate = "(has fire-boots)";
        String wrongPredicate = "(has fire-sword)";

        assertEquals(this.agenda.containedPredicateInPreemptedGoals(correctPredicate), this.goal1);
        assertNull(this.agenda.containedPredicateInPreemptedGoals(wrongPredicate));
    }

    @Test
    public void testSetReachedFromPending() {
        this.agenda.setReachedFromPending(this.goal1);

        assertEquals(this.agenda.getReachedGoals().size(), 1);
        assertEquals(this.agenda.getPendingGoals().size(), 2);
    }

    @Test
    public void testSetReachedFromPreempted() {
        this.agenda.setCurrentGoal();
        this.agenda.haltCurrentGoal();
        this.agenda.setReachedFromPreempted(this.goal1);

        assertEquals(this.agenda.getReachedGoals().size(), 1);
        assertEquals(this.agenda.getPreemptedGoals().size(), 0);
    }
}