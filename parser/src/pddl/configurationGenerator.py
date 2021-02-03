###############################################################################
# configurationGenerator.py
# Ignacio Vellido Expósito
# 30/10/2020
#
# Generates the configuration YAML file
###############################################################################

import re

# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------

# Basic structure of the configuration file
config = dict(
    domainFile = "domains/domain.pddl",
    problemFile = "problem.pddl",
    domainName = "VGDLGame",
    gameElementsCorrespondence = {},
    variablesTypes = {},
    # numVariable = "?n",
    avatarVariable = "",
    orientation = {},
    orientationCorrespondence = dict(
        UP = "(oriented-up ?object)",
        DOWN = "(oriented-down ?object)",
        LEFT = "(oriented-left ?object)",
        RIGHT = "(oriented-right ?object)"
    ),
    connections = dict(
        UP = "(connected-up ?c ?u)",
        DOWN = "(connected-down ?c ?d)",
        LEFT = "(connected-left ?c ?l)",
        RIGHT = "(connected-right ?c ?r)",
    ),
    actionsCorrespondence = {},
    additionalPredicates = [
        "(turn-avatar)",
        # ... More added according to the predicates
    ],
    addDeadObjects = {},
    goals = []
)

# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------

# Listener should not be needed
def get_config(domainGenerator, listener):
    """ Return configuration YAML 
        - domainGenerator: Contains info about predicates/types ...
        - listener: Contains info about hierarchy/names ...
    """
    predicates = domainGenerator.predicates
    avatar_name = listener.avatar.name
    avatar_predicates = domainGenerator.avatarPDDL.predicates
    spritesPDDL = domainGenerator.spritesPDDL
    actions = domainGenerator.actions

    partner = domainGenerator.partner
    transformTo = listener.transformTo

    config_add_gameElementsCorrespondence_variablesTypes(spritesPDDL, avatar_predicates, avatar_name)
    config_add_avatarVariable(avatar_name)
    config_add_orientation(spritesPDDL, actions, avatar_name)
    config_add_actionsCorrespondence(actions)
    config_add_additionalPredicates()
    config_add_addDeadObjects(partner, transformTo)
    config_add_goals()
  
    return config

# ------------------------------------------------------------------------------
# Functions producing the multiple sections of the config file
# ------------------------------------------------------------------------------

# Also adds some turn-order related predicates in additionalPredicates
def config_add_gameElementsCorrespondence_variablesTypes(spritesPDDL, avatar_predicates, avatar_name):
    config["gameElementsCorrespondence"][avatar_name] = []

    # Avatar predicates
    for predicate in avatar_predicates:
        match = re.search("([\w-])+ ?", predicate) # Only has one occurrence
        config["gameElementsCorrespondence"][avatar_name].append(
            "(%s?%s)" % (match.group(), avatar_name)
        )

    # Add sprites specific predicates
    for sprite in spritesPDDL:
        name = sprite.sprite.name

        if name != "wall":
            # Add variableType
            variableType = "?%s" % name
            config["variablesTypes"][variableType] = name

            config["gameElementsCorrespondence"][name] = [
                "(at ?x ?y ?%s)" % name,
            ]

            for pred in sprite.predicates:
                # Check if resource predicate
                if "got-resource" in pred:
                    match = re.search("([\w-])+ ?", pred) # Only has one occurrence
                    config["gameElementsCorrespondence"][name].append(
                        "(%s%s)" % (match.group(), "n0")
                    )
                # Check if the predicate has parameters
                elif "?" in pred: # Add it to specific predicates
                    match = re.search("([\w-])+ ?", pred) # Only has one occurrence
                    config["gameElementsCorrespondence"][name].append(
                        "(%s?%s)" % (match.group(), name)
                    )

                # else:   # If no parameters include it directly to additional
                    # config["additionalPredicates"].append(pred)

    # Add nums to variablesTypes
    config["variablesTypes"]["?x"] = "num"
    config["variablesTypes"]["?y"] = "num"

# ------------------------------------------------------------------------------

def config_add_avatarVariable(avatar_name):
    # Add avatar variable
    config["avatarVariable"] = "?%s" % avatar_name

# ------------------------------------------------------------------------------

def config_add_orientation(spritesPDDL, actions, avatar_name):
    # Adds objects orientation
    for sp in spritesPDDL:
        sprite = sp.sprite        
        orientation = [x for x in sprite.parameters if "orientation" in x]

        if len(orientation) > 0:
            orientation = orientation[0]
            orientation = orientation.split("=")[1]
            config["orientation"][sprite.name] = orientation

    # Check if avatar needs orientation
    config["orientation"][avatar_name] = "FIND" if any("ACTION_TURN" in act.name for act in actions) else "NONE"

# ------------------------------------------------------------------------------

def config_add_actionsCorrespondence(actions):
    # Adds avatar actions correspondences
    for action in actions:
        if "AVATAR_ACTION_" in action.name:
            name = action.name.replace("AVATAR_ACTION_", "")

            if "USE" in name:
                correspondence = "ACTION_USE"
            elif "NIL" in name:
                correspondence = "ACTION_NIL"
            elif "UP" in name:
                correspondence = "ACTION_UP"
            elif "DOWN" in name:
                correspondence = "ACTION_DOWN"
            elif "LEFT" in name:
                correspondence = "ACTION_LEFT"
            elif "RIGHT" in name:
                correspondence = "ACTION_RIGHT"
            else:
                correspondence = None

            config["actionsCorrespondence"][action.name] = correspondence
        # In case we need to declare all actions
        # else:
        #     config["actionsCorrespondence"][action.name] = None

# ------------------------------------------------------------------------------

def config_add_additionalPredicates():
    pass

# ------------------------------------------------------------------------------

def config_add_addDeadObjects(partner, transformTo):
    # Objects the avatar can produce
    if partner:
        config["addDeadObjects"][partner.name] = 1

    # Objects that can be transformed
    for obj in transformTo:
        config["addDeadObjects"][obj] = 1

    # TODO: Add objects that can be produced (spawnpoints...)

# ------------------------------------------------------------------------------

def config_add_goals():
    pass