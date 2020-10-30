###############################################################################
# configurationGenerator.py
# Ignacio Vellido Expósito
# 30/10/2020
#
# Generates the configuration YAML file
###############################################################################

config = dict(
    domainFile = "domain.pddl",
    problemFile = "problem.pddl",
    domainName = "VGDLGame",
    gameElementsCorrespondence = dict(
        # avatar :
        # - (at ?avatar ?c)
        # - (last-at ?avatar ?c)
        # - (can-move-up ?avatar)

        # turn-keym y demás también ?
    ),
    variableTypes = dict(
        # ?c = "Cell",
        # ?boulder = "boulder"
        # ...
    ),
    cellVariable = "?c",
    avatarVariable = "",
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
    actionsCorrespondence = dict(
        # AVATAR_TURN_UP : ACTION_UP
        # AVATAR_MOVE_UP : ACTION_UP
        # ...
    ),
    goals = dict(

    ),
    additionalPredicates = list(
        # 1 = "(turn-avatar)",
        # 2 = "(turn-sprites)",
        # 3 = "(turn-interactions)",
        # ...
        # (can-move-up ?a)
    )
)

# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------

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
        config["gameElementsCorrespondence"][o] = list()

        # Include predicates
        config["gameElementsCorrespondence"][o].append("(at ?c ?%s)" % o)
        config["gameElementsCorrespondence"][o].append("(last-at ?c ?%s)" % o)

        # ----------------------------------------------------------------------
        # variableTypes --------------------------------------------------------
        variableType = "?%s" % o
        config["variableTypes"][variableType] = o

    # Add avatar variable
    config["avatarVariable"] = "?%s" % listener.avatar.name


    # Add additional predicates
    config["additionalPredicates"].extend([
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
            


    # print(domainGenerator.actions[0].name)

    return config
