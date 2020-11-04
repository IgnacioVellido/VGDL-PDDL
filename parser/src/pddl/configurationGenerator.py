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
    variableTypes = {},
    cellVariable = "?c",
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
        "(turn-sprites)",
        "(turn-interactions)"
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

    config_add_gameElementsCorrespondence_variableTypes(spritesPDDL, avatar_predicates, avatar_name)
    config_add_avatarVariable(avatar_name)
    config_add_orientation(spritesPDDL)
    config_add_actionsCorrespondence(actions)
    config_add_additionalPredicates()
    config_add_addDeadObjects(partner, transformTo)
    config_add_goals()
  
    return config

# ------------------------------------------------------------------------------
# Functions producing the multiple sections of the config file
# ------------------------------------------------------------------------------

# Also adds some turn-order related predicates in additionalPredicates
def config_add_gameElementsCorrespondence_variableTypes(spritesPDDL, avatar_predicates, avatar_name):
    # Avatar predicates
    for predicate in avatar_predicates:
        match = re.search("([\w-])+ ?", predicate) # Only has one occurrence
        config["gameElementsCorrespondence"][avatar_name].append(
            "(%s?%s)" % (match.group(), avatar_name)
        )

    # Add sprites specific predicates
    for sprite in spritesPDDL:
        name = sprite.sprite.name

        # Add variableType
        variableType = "?%s" % name
        config["variableTypes"][variableType] = name

        config["gameElementsCorrespondence"][name] = [
            # "(object-dead ?%s)" % o,
            "(at ?c ?%s)" % name,
            "(last-at ?c ?%s)" % name,
        ]

        for pred in sprite.predicates:
            # Check if the predicate has parameters
            if "?" in pred: # Add it to specific predicates
                match = re.search("([\w-])+ ?", pred) # Only has one occurrence
                config["gameElementsCorrespondence"][name].append(
                    "(%s?%s)" % (match.group(), name)
                )

            else:   # If no parameters include it directly to additional
                config["additionalPredicates"].append(pred)

# ------------------------------------------------------------------------------

def config_add_avatarVariable(avatar_name):
    # Add avatar variable
    config["avatarVariable"] = "?%s" % avatar_name

# ------------------------------------------------------------------------------

def config_add_orientation(spritesPDDL):
    # Adds objects orientation
    for sp in spritesPDDL:
        sprite = sp.sprite        
        orientation = [x for x in sprite.parameters if "orientation" in x]

        if len(orientation) > 0:
            orientation = orientation[0]
            orientation = orientation.split("=")[1]
            config["orientation"][sprite.name] = orientation

    # Check if avatar needs orientation

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
        config["addDeadObjects"][partner.name] = 5

    # Objects that can be transformed
    for obj in transformTo:
        config["addDeadObjects"][obj] = 10

    # TODO: Add objects that can be produced (spawnpoints...)

# ------------------------------------------------------------------------------

def config_add_goals():
    pass