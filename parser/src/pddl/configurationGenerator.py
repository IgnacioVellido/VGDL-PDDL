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
        "?c" = "Cell",
        # ?boulder = "boulder"
        # ...
    ),
    cellVariable = "?c",
    avatarVariable = "?a",
    orientationCorrespondence = dict(
        UP = "(oriented-up ?o)",
        DOWN = "(oriented-down ?o)",
        LEFT = "(oriented-left ?o)",
        RIGHT = "(oriented-right ?o)"
    )
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
    )
    goals = dict(

    ),
    additionPredicates = dict(
        1 = "(turn-avatar)",
        2 = "(turn-sprites)",
        3 = "(turn-interactions)",
        # ...
        # (can-move-up ?a)
    )
)

# ------------------------------------------------------------------------------
# ------------------------------------------------------------------------------

def getConfig(domainGenerator):
    """ Produce configuration YAML 
        - domainGenerator: Contains info about predicates/types ...
        - listener: Contains info about hierarchy/names ...
    """