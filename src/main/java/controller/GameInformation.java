/*
 * GameInformation.java
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

import ontology.Types;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Map;
import java.util.List;

/**
 * Class that contains the game's information. It is loaded from a YAML configuration
 * file.
 *
 * @author Vladislav Nikolov Vasilev
 */
public class GameInformation {
    public String domainFile;
    public String problemFile;
    public String domainName;
    public String cellVariable;
    public String avatarVariable;
    public Map<String, ArrayList<String>> gameElementsCorrespondence;
    public Map<String, String> variablesTypes;
    public Map<OrientationType, String> orientationCorrespondence;
    public Map<String, String> fluentsPredicates;
    public Map<String, Types.ACTIONS> actionsCorrespondence;
    public LinkedList<PDDLSingleGoal> goals;
    public List<String> additionalPredicates;
    public Map<String, Integer> addDeadObjects;
    public Map<String, OrientationType> orientation;

    public GameInformation() {
    }
}
