###############################################################################
# configurationGenerator.py
# Ignacio Vellido Expósito
# 30/10/2020
#
# Generates the configuration YAML file
###############################################################################

import re

# These are some, more are defined later
config = dict(
    domainFile = "domain.pddl",
    problemFile = "problem.pddl",
    domainName = "VGDLGame",
    gameElementsCorrespondence = {},
    variableTypes = {},
    cellVariable = "?c",
    orientationCorrespondence = dict(
        UP = "(oriented-up ?object)",
        DOWN = "(oriented-down ?object)",
        LEFT = "(oriented-left ?object)",
        RIGHT = "(oriented-right ?object)"
    ),
    connections = dict(
        UP = "(connected-up ?c1 ?c2)",
        DOWN = "(connected-down ?c1 ?c2)",
        LEFT = "(connected-left ?c1 ?c2)",
        RIGHT = "(connected-right ?c1 ?c2)",
    ),
    actionsCorrespondence = {},
    goals = {},
    additionalPredicates = []
)

# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------

# Listener should not be needed
def getConfig(domainGenerator, listener):
    """ Produce configuration YAML 
        - domainGenerator: Contains info about predicates/types ...
        - listener: Contains info about hierarchy/names ...
    """

    predicates = domainGenerator.predicates
    # print(predicates)

    # Objects that appears in the level
    objects = listener.long_types

    # Add dict for each object
    for o in objects:
        # ----------------------------------------------------------------------
        # gameElementsCorrespondence -------------------------------------------

        # Include predicates
        config["gameElementsCorrespondence"][o] = [
            # "(object-dead ?%s)" % o,
            "(at ?c ?%s)" % o,
            "(last-at ?c ?%s)" % o,
        ]

        # ----------------------------------------------------------------------
        # variableTypes --------------------------------------------------------
        variableType = "?%s" % o
        config["variableTypes"][variableType] = o

    # Add avatar variable
    avatar_name = listener.avatar.name
    config["avatarVariable"] = "?%s" % avatar_name
    
    # Avatar predicates
    for predicate in domainGenerator.avatarPDDL.predicates:
        match = re.search("([\w-])+ ?", predicate) # Only has one occurrence
        config["gameElementsCorrespondence"][avatar_name].append(
            "(%s?%s)" % (match.group(), avatar_name)
        )


    # Add additional predicates
    config["additionalPredicates"].extend([
        # (object-dead ?object),
        "(turn-avatar)",
        "(turn-sprites)",
        "(turn-interactions)"
    ])

    # Add actions correspondences
    for action in domainGenerator.actions:
        # if "PDDL_AVATAR" in action.name:
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

            config["actionsCorrespondence"][action.name] = correspondence

        else:
            config["actionsCorrespondence"][action.name] = None
            

    # Dict sprite - int, indicating the number of times a sprite object should
    # dead in the PDDL problem
    # Los que tienen produce y el avatar con use, o sea, todos los partner ?
    config["addDeadObjects"] = {}
    if domainGenerator.partner:
        config["addDeadObjects"][domainGenerator.partner.name] = 1

    # Add objects that can be transformed
    for obj in listener.transformTo:
        config["addDeadObjects"][obj] = 10

    # TODO: Add objects that can be produced (spawnpoints...)

    # Add sprites specific predicates
    for sprite in domainGenerator.spritesPDDL:
        name = sprite.sprite.name
        for pred in sprite.predicates:
            # Check if has parameters
            if "?" in pred: # Add it to specific predicates

                # If we haven't found this object yet, include it in the rest of sections
                if name not in config["gameElementsCorrespondence"]:
                    config["gameElementsCorrespondence"][name] = [
                        # "(object-dead ?%s)" % name,
                        "(at ?c ?%s)" % name,
                        "(last-at ?c ?%s)" % name,
                    ]
                    config["variableTypes"]["?%s" % name] = name

                config["gameElementsCorrespondence"][name].append(pred)

            else:   # Include it directly to additional
                config["additionalPredicates"].append(pred)


    # Add objects orientation
    config["orientation"] = {}
    for sp in domainGenerator.spritesPDDL:
        sprite = sp.sprite        
        orientation = [x for x in sprite.parameters if "orientation" in x]

        if len(orientation) > 0:
            orientation = orientation[0]
            orientation = orientation.split("=")[1]
            config["orientation"][sprite.name] = orientation       

    return config
