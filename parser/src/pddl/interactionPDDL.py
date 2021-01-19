###############################################################################
# interaction.py
# Ignacio Vellido Expósito
# 28/09/2020
#
# Multiple classes defining parts of a PDDL domain for interactions
###############################################################################

from pddl.typesPDDL import *

###############################################################################
# -----------------------------------------------------------------------------
###############################################################################


class InteractionPDDL:
    """ Class that encapsulate the generation of PDDL domain structures 
    for interactions 
    
    Attributes:
        interaction - InteractionVGDL
        sprite - Sprite
        partner - Sprite
        hierarchy - Dict<String,String>
    """

    def __init__(
        self,
        interaction: "Interaction",
        sprite: "Sprite",
        partner: "Sprite",
        hierarchy: dict,
    ):
        self.interaction = interaction
        self.sprite = sprite
        self.partner = partner
        self.hierarchy = hierarchy

        self.tasks = []     # Empty
        self.methods = []   # Empty
        self.actions = []
        self.predicates = []
        self.level_predicates = []

        self.get_actions()
        self.get_predicates()
        self.get_level_predicates()

    # -------------------------------------------------------------------------
    # -------------------------------------------------------------------------

    def get_actions(self):
        self.actions = InteractionActions(
            self.interaction, self.sprite, self.partner, self.hierarchy
        ).actions

    # -------------------------------------------------------------------------

    def get_level_predicates(self):
        pass

    # -------------------------------------------------------------------------

    def get_predicates(self):
        pass

###############################################################################
# -----------------------------------------------------------------------------
###############################################################################


class InteractionActions:
    """ Returns an action for each interaction """

    def __init__(
        self,
        interaction: "Interaction",
        sprite: "Sprite",
        partner: "Sprite",
        hierarchy: dict,
    ):
        self.interaction = interaction
        self.sprite = sprite
        self.partner = partner
        self.hierarchy = hierarchy

        self.actions = []
        
        interaction_action_list = {
            # [GVGAI] Adds a certain quantity of health points
            "addHealthPoints":
                [self.addHealthPoints],

            # [GVGAI] Puts health points to max
            "addHealthPointsToMax":
                [self.addHealthPointsToMax],

            # [GVGAI] Changes position and orientation of sprite to partner
            "align":
                [self.align],

            # Randomly changesdirection of partner
            "attractGaze": [],
                # [self.attractGaze],

            # Not sure what it does, seems like the center of the object decides the direction
            "bounceDirection":
                [self.bounceDirection],

            # Sprite tries to move in the opposite direction of partner
            "bounceForward":
                [self.bounceForward_up, self.bounceForward_down, self.bounceForward_left, self.bounceForward_right],

            # Change resource (sprite) in the object (partner) to a given
            "changeResource":
                [self.changeResource],

            # Creates a copy
            "cloneSprite":
                [self.cloneSprite],

            # Increment resource (sprite) in the object (partner)
            "collectResource":
                [self.collectResource],

            # [GVGAI] Decrease speed of all objects of the type of the sprite
            "decreaseSpeedToAll":
                [self.decreaseSpeedToAll],

            # Changes to a random orientation
            "flipDirection":
                [self.flipDirection],

            # [GVGAI] Increase speed of all objects of the sprite type
            "increaseSpeedToAll":
                [self.increaseSpeedToAll],

            # [GVGAI] Kill all sprite of the same type
            "killAll":
                [self.killAll],

            # Sprite and partner dies
            "killBoth":
                [self.killBoth],

            # Kill sprite if partner is not destroyed by the collision
            "killIfAlive":
                [self.killIfAlive],

            # Kill sprite if partner is above him
            "killIfFromAbove":
                [self.killIfFromAbove],

            # If sprite has more resource than parameter (limit), kill it
            "killIfHasMore":
                [self.killIfHasMore],

            # If sprite has less resource than parameter (limit), kill it
            "killIfHasLess":
                [self.killIfHasLess],

            # Kill sprite if speed is higher than the given
            "killIfFast":
                [self.killIfFast],

            # If partner has less resource than parameter (limit), kill sprite
            "killIfOtherHasLess":
                [self.killIfOtherHasLess],

            # If partner has more resource than parameter (limit), kill sprite
            "killIfOtherHasMore":
                [self.killIfOtherHasMore],

            # Kill sprite if speed is lower than the given
            "killIfSlow":
                [self.killIfSlow],

            # Sprite dies
            "killSprite":
                [self.killSprite],

            # Movement of partner is added to sprite (same quantity and direction)
            "pullWithIt":
                [self.pullWithIt],

            # [GVGAI] Changes score of the avatar
            "removeScore":
                [self.removeScore],

            # Changes orientation 180º
            "reverseDirection":
                [self.reverseDirection],

            # [GVGAI] Asigns a specific speed to the sprite
            "setSpeedToAll":
                [self.setSpeedToAll],

            # Creates sprite behind partner
            "spawnBehind":
                [self.spawnBehind],

            # If sprite has less resource than parameter (limit), create new sprite
            "spawnIfHasLess":
                [self.spawnIfHasLess],

            # If sprite has more resource than parameter (limit), create new sprite
            "spawnIfHasMore":
                [self.spawnIfHasMore],

            # Undo last movement
            "stepBack":
                [self.stepBack],

            # [GVGAI] Decrease a certain quantity of health points
            "substractHealthPoints":
                [self.subsctractHealthPoints],

            # Move sprite to partner position (must be a Portal, if not, destroy sprite)
            "teleportToExit":
                [self.teleportToExit],

            # [GVGAI] Changes sprite to stype if there are a certain quantity (stypeCount)
            "transformIfCount":
                [self.transformIfCount],

            # Seems like it creates a new copy of sprite
            "transformTo":
                [self.transformTo],

            # [GVGAI] Transform sprite to one of his childs
            "transformToRandomChild":
                [self.transformToRandomChild],

            # [GVGAI] Transform all sprites of stype to stype_other in the same position
            "transformToSingleton":
                [self.transformToSingleton],

            # Invert orientation
            "turnAround":
                [self.turnAround],

            # Undo movement of every object in the game
            # FOR NOW, NOTHING
            "undoAll": 
                [],
                # [self.undoAll],

            # [GVGAI] Changes the "spawn type" to SpawnPoint
            "updateSpawnType":
                [self.updateSpawnType],

            # Bounce in a perpendicular direction from the wall
            "wallBounce":
                [self.wallBounce],

            # Stops sprite in front of wall
            "wallStop":
                [self.wallStop],

            # Move sprite at the end of the screen in the orientation of sprite
            "wrapAround":
                [self.wrapAround],
        }

        self.get_actions(interaction_action_list[self.interaction.type])

    def get_actions(self, action_list):
        """ Stores in self.actions the actions defined """
        for function in action_list:
            self.actions.append(function())

    # -------------------------------------------------------------------------
    # -------------------------------------------------------------------------

    def addHealthPoints(self):
        name = (
            self.sprite.name.upper()
            + "_"
            + self.partner.name.upper()
            + "_ADDHEALTHPOINTS"
        )
        parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        preconditions = [
            "(= (coordinate_x ?x) (coordinate_x ?y))",
            "(= (coordinate_y ?x) (coordinate_y ?y))",
        ]
        effects = []  # UNFINISHED

        return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def addHealthPointsToMax(self):
        pass
        # name = (
        #     self.sprite.name.upper()
        #     + "_"
        #     + self.partner.name.upper()
        #     + "_ADDHEALTHPOINTSTOMAX"
        # )
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(= (coordinate_x ?x) (coordinate_x ?y))",
        #     "(= (coordinate_y ?x) (coordinate_y ?y))",
        # ]
        # effects = []  # UNFINISHED

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def align(self):
        pass
        # name = self.sprite.name.upper() + "_" + self.partner.name.upper() + "_ALIGN"
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(= (coordinate_x ?x) (coordinate_x ?y))",
        #     "(= (coordinate_y ?x) (coordinate_y ?y))",
        # ]
        # effects = []  # UNFINISHED

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def attractGaze(self):
        pass
        # name = (
        #     self.sprite.name.upper() + "_" + self.partner.name.upper() + "_ATTRACTGAZE"
        # )
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(= (coordinate_x ?x) (coordinate_x ?y))",
        #     "(= (coordinate_y ?x) (coordinate_y ?y))",
        # ]
        # effects = []  # UNFINISHED

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def bounceDirection(self):
        pass
        # name = (
        #     self.sprite.name.upper()
        #     + "_"
        #     + self.partner.name.upper()
        #     + "_BOUNCEDIRECTION"
        # )
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(= (coordinate_x ?x) (coordinate_x ?y))",
        #     "(= (coordinate_y ?x) (coordinate_y ?y))",
        # ]
        # effects = []  # UNFINISHED

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    # DONE
    def bounceForward_up(self):
        """ Move in the same direction of partner """
        name = (
            self.sprite.name.upper()
            + "_"
            + self.partner.name.upper()
            + "_BOUNCEFORWARD_UP"
        )
        parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"], ["new_y", "num"]]
        preconditions = [
            "(turn-interactions)",
            "(not (= ?o1 ?o2))",
            "(or (oriented-up ?o2) (oriented-none ?o2))",
            "(at ?x ?y ?o1)",
            "(at ?x ?y ?o2)",
            "(previous ?y ?new_y)"
        ]
        effects = [
            "(at ?x ?new_y ?o1)",
            "(not (at ?x ?y ?o1))",           
        ]

        return Action(name, parameters, preconditions, effects)

    # DONE
    def bounceForward_down(self):
        """ Move in the same direction of partner """
        name = (
            self.sprite.name.upper()
            + "_"
            + self.partner.name.upper()
            + "_BOUNCEFORWARD_DOWN"
        )
        parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"], ["new_y", "num"]]
        preconditions = [
            "(turn-interactions)",
            "(not (= ?o1 ?o2))",
            "(or (oriented-down ?o2) (oriented-none ?o2))",
            "(at ?x ?y ?o1)",
            "(at ?x ?y ?o2)",
            "(next ?y ?new_y)"
        ]
        effects = [
            "(at ?x ?new_y ?o1)",
            "(not (at ?x ?y ?o1))",
        ]

        return Action(name, parameters, preconditions, effects)

    # DONE
    def bounceForward_left(self):
        """ Move in the same direction of partner """
        name = (
            self.sprite.name.upper()
            + "_"
            + self.partner.name.upper()
            + "_BOUNCEFORWARD_LEFT"
        )
        parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"], ["new_x", "num"]]
        preconditions = [
            "(turn-interactions)",
            "(not (= ?o1 ?o2))",
            "(or (oriented-left ?o2) (oriented-none ?o2))",
            "(at ?x ?y ?o1)",
            "(at ?x ?y ?o2)",
            "(previous ?x ?new_x)"
        ]
        effects = [
            "(at ?new_x ?y ?o1)",
            "(not (at ?x ?y ?o1))"
        ]

        return Action(name, parameters, preconditions, effects)

    # DONE
    def bounceForward_right(self):
        """ Move in the same direction of partner """
        name = (
            self.sprite.name.upper()
            + "_"
            + self.partner.name.upper()
            + "_BOUNCEFORWARD_RIGHT"
        )
        parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"], ["new_x", "num"]]
        preconditions = [
            "(turn-interactions)",
            "(not (= ?o1 ?o2))",
            "(or (oriented-right ?o2) (oriented-none ?o2))",
            "(at ?x ?y ?o1)",
            "(at ?x ?y ?o2)",
            "(next ?x ?new_x)"
        ]
        effects = [
            "(at ?new_x ?y ?o1)",
            "(not (at ?x ?y ?o1))"   
        ]

        return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def changeResource(self):
        pass
        # name = (
        #     self.sprite.name.upper()
        #     + "_"
        #     + self.partner.name.upper()
        #     + "_CHANGERESOURCE"
        # )
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(= (coordinate_x ?x) (coordinate_x ?y))",
        #     "(= (coordinate_y ?x) (coordinate_y ?y))",
        # ]
        # effects = []  # UNFINISHED

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    # Clone sprite (partner dies by another interaction, carefull)
    def cloneSprite(self):
        pass
        # name = (
        #     self.sprite.name.upper() + "_" + self.partner.name.upper() + "_CLONESPRITE"
        # )
        # # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"], ["z", self.sprite.name]]
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"], ["z", self.sprite.name]]
        # preconditions = [
        #     "(turn-interactions)",
        #     "(not (= ?o1 ?o2))",
        #     "(at ?x ?y ?o1)",
        #     "(at ?x ?y ?o2)",
        #     # If we remove this predicate it would be sent to a random cell ?
        #     # But we should be carefull with stepBack or undoAll

        #     "(object-dead ?z)"
        # ]
        # effects = [
        #     "(not (object-dead ?z))",
        #     # This can generate infinite loops
        #     # "(at ?c ?z)",            
        # ]

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    # DONE
    def collectResource(self):
        name = (
            self.sprite.name.upper()
            + "_"
            + self.partner.name.upper()
            + "_COLLECTRESOURCE"
        )
        parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        preconditions = [
            "(turn-interactions)",
            "(not (= ?o1 ?o2))",
            "(at ?x ?y ?o1)",
            "(at ?x ?y ?o2)"
        ]
        effects = [
            "(object-dead ?o1)",
            "(got-resource-" + self.sprite.name + " ?o1)"
        ]

        return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def decreaseSpeedToAll(self):
        pass
        # name = (
        #     self.sprite.name.upper()
        #     + "_"
        #     + self.partner.name.upper()
        #     + "_INCREASESPEEDTOALL"
        # )
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(= (coordinate_x ?x) (coordinate_x ?y))",
        #     "(= (coordinate_y ?x) (coordinate_y ?y))",
        # ]
        # effects = []  # UNFINISHED

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def flipDirection(self):
        pass
        # name = (
        #     self.sprite.name.upper()
        #     + "_"
        #     + self.partner.name.upper()
        #     + "_FLIPDIRECTION"
        # )
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(= (coordinate_x ?x) (coordinate_x ?y))",
        #     "(= (coordinate_y ?x) (coordinate_y ?y))",
        # ]
        # effects = []  # UNFINISHED

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def increaseSpeedToAll(self):
        pass
        # name = (
        #     self.sprite.name.upper()
        #     + "_"
        #     + self.partner.name.upper()
        #     + "_INCREASESPEEDTOALL"
        # )
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(= (coordinate_x ?x) (coordinate_x ?y))",
        #     "(= (coordinate_y ?x) (coordinate_y ?y))",
        # ]
        # effects = []  # UNFINISHED

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def killAll(self):
        pass
        # name = self.sprite.name.upper() + "_" + self.partner.name.upper() + "_KILLALL"
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(= (coordinate_x ?x) (coordinate_x ?y))",
        #     "(= (coordinate_y ?x) (coordinate_y ?y))",
        # ]
        # effects = []  # UNFINISHED

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    # DONE
    def killBoth(self):
        name = self.sprite.name.upper() + "_" + self.partner.name.upper() + "_KILLBOTH"
        parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        preconditions = [
            "(turn-interactions)",
            "(not (= ?o1 ?o2))",
            "(at ?x ?y ?o1)",
            "(at ?x ?y ?o2)"
        ]
        effects = [
            "(not (at ?x ?y ?o1))",
            "(not (at ?x ?y ?o2))",
            "(object-dead ?o1)",
            "(object-dead ?o2)"
        ]

        return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def killIfAlive(self):
        pass
        # name = (
        #     self.sprite.name.upper() + "_" + self.partner.name.upper() + "_KILLIFALIVE"
        # )
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(= (coordinate_x ?x) (coordinate_x ?y))",
        #     "(= (coordinate_y ?x) (coordinate_y ?y))",
        # ]
        # effects = []  # UNFINISHED

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def killIfFromAbove(self):
        pass
        # name = (
        #     self.sprite.name.upper()
        #     + "_"
        #     + self.partner.name.upper()
        #     + "_KILLIFFROMABOVE"
        # )
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(turn-interactions)",
        #     "(not (= ?o1 ?o2))",

        #     "(at ?x ?y ?o1)",
        #     "(at ?x ?y ?o2)",        
        # ]
        # effects = [
        #     "(not (at ?x ?y ?o1))",
        #     "(object-dead ?o1)",
        # ]

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    # Kill sprite if sprite has more

    # ASSUMING SPRITE IS AN AVATAR, THE ACTION IS THE SAME AS KILLIFOTHERHASMORE
    def killIfHasMore(self):
        pass
        # # Get resource name
        # parameters = [p for p in self.interaction.parameters if "resource=" in p]
        # resource = parameters[0].replace("resource=",'')

        # # Get number needed
        # parameters = [p for p in self.interaction.parameters if "limit=" in p]
        # number = parameters[0].replace("limit=",'')
        # number = int(number)

        # name = (
        #     self.sprite.name.upper()
        #     + "_"
        #     + self.partner.name.upper()
        #     + "_KILLIFOTHERHASMORE"
        # )
        
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(turn-interactions)",
        #     "(not (= ?o1 ?o2))",
        #     "(at ?x ?y ?o1)",
        #     "(at ?x ?y ?o2)"
        # ]

        # effects = [
        #     "(object-dead ?o1)"
        # ]


        # # Add number-sprites to parameters
        # for i in range(number):
        #     parameters.append(["r" + str(i), resource])

        # # Add number-preconditions
        # for i in range(number):
        #     preconditions.append("(got-resource-" + resource + " ?r" + str(i) + ")")

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    # Kill sprite if sprite has less
    def killIfHasLess(self):
        pass
        # # Get resource name
        # parameters = [p for p in self.interaction.parameters if "resource=" in p]
        # resource = parameters[0].replace("resource=",'')

        # # Get number needed
        # parameters = [p for p in self.interaction.parameters if "limit=" in p]
        # number = parameters[0].replace("limit=",'')
        # number = int(number)

        # name = (
        #     self.sprite.name.upper() + "_" + self.partner.name.upper()
        #     + "_KILLIFOTHERHASLESS"
        # )
        
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(turn-interactions)",
        #     "(not (= ?o1 ?o2))",
        #     "(at ?x ?y ?o1)",
        #     "(at ?x ?y ?o2)"
        # ]

        # effects = [
        #     "(object-dead ?o1)"
        # ]


        # # Add number-sprites to parameters
        # for i in range(number):
        #     parameters.append(["r" + str(i), resource])

        # # Add number-preconditions
        # for i in range(number):
        #     preconditions.append("(got-resource-" + resource + " ?r" + str(i) + ")")

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def killIfFast(self):
        pass
        # name = (
        #     self.sprite.name.upper() + "_" + self.partner.name.upper() + "_KILLIFFAST"
        # )
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(= (coordinate_x ?x) (coordinate_x ?y))",
        #     "(= (coordinate_y ?x) (coordinate_y ?y))",
        # ]
        # effects = []  # UNFINISHED

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def killIfOtherHasLess(self):
        pass
        # name = (
        #     self.sprite.name.upper()
        #     + "_"
        #     + self.partner.name.upper()
        #     + "_KILLIFOTHERHASLESS"
        # )
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(= (coordinate_x ?x) (coordinate_x ?y))",
        #     "(= (coordinate_y ?x) (coordinate_y ?y))",
        # ]
        # effects = []  # UNFINISHED

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    # Other = partner
    # Kill sprite if partner has more

    # MAYBE NEED TO INCLUDE IN THE PREDICATE THE SECOND OBJECT
    # RIGHT NOW WE ARE MAKING THE ASSUMPTION THAT IT IS THE AVATAR
    def killIfOtherHasMore(self):
        # Get resource name
        parameters = [p for p in self.interaction.parameters if "resource=" in p]
        resource = parameters[0].replace("resource=",'')

        # Get number needed
        parameters = [p for p in self.interaction.parameters if "limit=" in p]
        number = parameters[0].replace("limit=",'')
        number = int(number)

        name = (
            self.sprite.name.upper()
            + "_"
            + self.partner.name.upper()
            + "_KILLIFOTHERHASMORE"
        )
        
        parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        preconditions = [
            "(turn-interactions)",
            "(not (= ?o1 ?o2))",
            "(at ?x ?y ?o1)",
            "(at ?x ?y ?o2)"
        ]

        effects = [
            "(object-dead ?o1)"
        ]


        # Add number-sprites to parameters
        for i in range(number):
            parameters.append(["r" + str(i), resource])

        # Add number-preconditions
        for i in range(number):
            preconditions.append("(got-resource-" + resource + " ?r" + str(i) + ")")

        return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def killIfSlow(self):
        pass
        # name = (
        #     self.sprite.name.upper() + "_" + self.partner.name.upper() + "_KILLIFSLOW"
        # )
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(= (coordinate_x ?x) (coordinate_x ?y))",
        #     "(= (coordinate_y ?x) (coordinate_y ?y))",
        # ]
        # effects = []  # UNFINISHED

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def killSprite(self):
        name = (
            self.sprite.name.upper() + "_" + self.partner.name.upper() + "_KILLSPRITE"
        )
        # partner.stype or partner.name ?
        parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]] 
        preconditions = [
            "(turn-interactions)",
            "(not (= ?o1 ?o2))",

            "(at ?x ?y ?o1)",
            "(at ?x ?y ?o2)"
        ]
        effects = [
            "(not (at ?x ?y ?o1))",
            "(object-dead ?o1)"
        ]

        return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def pullWithIt(self):
        pass
        # name = (
        #     self.sprite.name.upper() + "_" + self.partner.name.upper() + "_PULLWITHIT"
        # )
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(= (coordinate_x ?x) (coordinate_x ?y))",
        #     "(= (coordinate_y ?x) (coordinate_y ?y))",
        # ]
        # effects = []  # UNFINISHED

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def removeScore(self):
        pass
        # name = (
        #     self.sprite.name.upper() + "_" + self.partner.name.upper() + "_REMOVESCORE"
        # )
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(= (coordinate_x ?x) (coordinate_x ?y))",
        #     "(= (coordinate_y ?x) (coordinate_y ?y))",
        # ]
        # effects = []  # UNFINISHED

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def reverseDirection(self):
        pass
        # name = (
        #     self.sprite.name.upper()
        #     + "_"
        #     + self.partner.name.upper()
        #     + "_REVERSEDIRECTION"
        # )
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(= (coordinate_x ?x) (coordinate_x ?y))",
        #     "(= (coordinate_y ?x) (coordinate_y ?y))",
        # ]
        # effects = []  # UNFINISHED

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def setSpeedToAll(self):
        pass
        # name = (
        #     self.sprite.name.upper()
        #     + "_"
        #     + self.partner.name.upper()
        #     + "_SETSPEEDTOALL"
        # )
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(= (coordinate_x ?x) (coordinate_x ?y))",
        #     "(= (coordinate_y ?x) (coordinate_y ?y))",
        # ]
        # effects = []  # UNFINISHED

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def spawnBehind(self):
        pass
        # name = (
        #     self.sprite.name.upper() + "_" + self.partner.name.upper() + "_SPAWNBEHING"
        # )
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(= (coordinate_x ?x) (coordinate_x ?y))",
        #     "(= (coordinate_y ?x) (coordinate_y ?y))",
        # ]
        # effects = []  # UNFINISHED

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def spawnIfHasLess(self):
        pass
        # name = (
        #     self.sprite.name.upper()
        #     + "_"
        #     + self.partner.name.upper()
        #     + "_SPAWNIFHASLESS"
        # )
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(= (coordinate_x ?x) (coordinate_x ?y))",
        #     "(= (coordinate_y ?x) (coordinate_y ?y))",
        # ]
        # effects = []  # UNFINISHED

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def spawnIfHasMore(self):
        pass
        # name = (
        #     self.sprite.name.upper()
        #     + "_"
        #     + self.partner.name.upper()
        #     + "_SPAWNIFHASMORE"
        # )
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(= (coordinate_x ?x) (coordinate_x ?y))",
        #     "(= (coordinate_y ?x) (coordinate_y ?y))",
        # ]
        # effects = []  # UNFINISHED

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def stepBack(self):
        pass
        # name = self.sprite.name.upper() + "_" + self.partner.name.upper() + "_STEPBACK"
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(turn-interactions)",
        #     "(not (= ?o1 ?o2))",

        #     "(at ?x ?y ?o1)",
        #     "(at ?x ?y ?o2)"           
        # ]
        # effects = [
        #     "(not (at ?x ?y ?o1))"
        # ]

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def subsctractHealthPoints(self):
        pass
        # name = (
        #     self.sprite.name.upper()
        #     + "_"
        #     + self.partner.name.upper()
        #     + "_SUBSCTRACTHEALTHPOINTS"
        # )
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(= (coordinate_x ?x) (coordinate_x ?y))",
        #     "(= (coordinate_y ?x) (coordinate_y ?y))",
        # ]
        # effects = []  # UNFINISHED

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def teleportToExit(self):
        pass
        # name = (
        #     self.sprite.name.upper()
        #     + "_"
        #     + self.partner.name.upper()
        #     + "_TELEPORTTOEXIT"
        # )
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(= (coordinate_x ?x) (coordinate_x ?y))",
        #     "(= (coordinate_y ?x) (coordinate_y ?y))",
        # ]
        # effects = []  # UNFINISHED

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def transformIfCount(self):
        pass
        # name = (
        #     self.sprite.name.upper()
        #     + "_"
        #     + self.partner.name.upper()
        #     + "_TRANSFORMIFCOUNT"
        # )
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(= (coordinate_x ?x) (coordinate_x ?y))",
        #     "(= (coordinate_y ?x) (coordinate_y ?y))",
        # ]
        # effects = []  # UNFINISHED

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    # Maintain orientation of the partner object
    def transformTo(self):
        pass
        # # Find object to tranform
        # parameters = [p for p in self.interaction.parameters if "stype=" in p]
        # resulting_sprite = parameters[0].replace("stype=",'')

        # name = (
        #     self.sprite.name.upper() + "_" + self.partner.name.upper() + "_TRANSFORMTO"
        # )
        # parameters = [
        #     ["x", self.sprite.name],
        #     ["y", self.partner.stype],
        #     ["z", resulting_sprite],
        #     ["x", "num"], ["y", "num"]
        # ]
        # preconditions = [
        #     "(turn-interactions)",
        #     "(not (= ?o1 ?o2))",
        #     "(at ?x ?y ?o1)",
        #     "(at ?x ?y ?o2)",
        #     "(object-dead ?z)"
        # ]

        # effects = [
        #     "(not (at ?x ?y ?o1))",
        #     # "(not (at ?x ?y ?o2))",
        #     "(object-dead ?o1)",
        #     # "(object-dead ?o2)",
        #     "(at ?c ?z)",
           
        #     "(not (object-dead ?z))",
        #     """(when
        #                 (oriented-up ?y)
        #                 (oriented-up ?z)
        #             )
        #             (when
        #                 (oriented-down ?y)
        #                 (oriented-down ?z)
        #             )
        #             (when
        #                 (oriented-left ?y)
        #                 (oriented-left ?z)
        #             )
        #             (when
        #                 (oriented-right ?y)
        #                 (oriented-right ?z)
        #             )
        #     """
        # ]

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def transformToRandomChild(self):
        pass
        # name = (
        #     self.sprite.name.upper()
        #     + "_"
        #     + self.partner.name.upper()
        #     + "_TRANSFORMTORANDOMCHILD"
        # )
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(= (coordinate_x ?x) (coordinate_x ?y))",
        #     "(= (coordinate_y ?x) (coordinate_y ?y))",
        # ]
        # effects = []  # UNFINISHED

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def transformToSingleton(self):
        pass
        # name = (
        #     self.sprite.name.upper()
        #     + "_"
        #     + self.partner.name.upper()
        #     + "_TRANSFORMTOSINGLETON"
        # )
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(= (coordinate_x ?x) (coordinate_x ?y))",
        #     "(= (coordinate_y ?x) (coordinate_y ?y))",
        # ]
        # effects = []  # UNFINISHED

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    # Invert orientation of sprite
    def turnAround(self):
        name = (
            self.sprite.name.upper() + "_" + self.partner.name.upper() + "_TURNAROUND"
        )
        parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        preconditions = [
            "(turn-interactions)",
            "(not (= ?o1 ?o2))",
            "(at ?x ?y ?o1)",
            "(at ?x ?y ?o2)"
        ]
        effects = [
            "(when (oriented-up ?o1)    (and (not-oriented-up ?o1)    (oriented-down ?o1))",
            "(when (oriented-down ?o1)  (and (not-oriented-down ?o1)  (oriented-up ?o1))",
            "(when (oriented-left ?o1)  (and (not-oriented-left ?o1)  (oriented-right ?o1))",
            "(when (oriented-right ?o1) (and (not-oriented-right ?o1) (oriented-left ?o1))"
        ]

        return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def undoAll(self):
        pass
        # """ This action always fail to force another movement"""
        # name = self.sprite.name.upper() + "_" + self.partner.name.upper() + "_UNDOALL"
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(turn-interactions)",
        #     "(not (= ?o1 ?o2))",
        #     "(at ?x ?y ?o1)",
        #     "(at ?x ?y ?o2)"
        # ]
        # effects = ["(not (turn-interactions))"]

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def updateSpawnType(self):
        pass
        # name = (
        #     self.sprite.name.upper()
        #     + "_"
        #     + self.partner.name.upper()
        #     + "_UPDATESPAWNTYPE"
        # )
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(= (coordinate_x ?x) (coordinate_x ?y))",
        #     "(= (coordinate_y ?x) (coordinate_y ?y))",
        # ]
        # effects = []  # UNFINISHED

        return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def wallBounce(self):
        pass
        # name = (
        #     self.sprite.name.upper() + "_" + self.partner.name.upper() + "_WALLBOUNCE"
        # )
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(= (coordinate_x ?x) (coordinate_x ?y))",
        #     "(= (coordinate_y ?x) (coordinate_y ?y))",
        # ]
        # effects = []  # UNFINISHED

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def wallStop(self):
        pass
        # name = self.sprite.name.upper() + "_" + self.partner.name.upper() + "_WALLSTOP"
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(= (coordinate_x ?x) (coordinate_x ?y))",
        #     "(= (coordinate_y ?x) (coordinate_y ?y))",
        # ]
        # effects = []  # UNFINISHED

        # return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def wrapAround(self):
        pass
        # name = (
        #     self.sprite.name.upper() + "_" + self.partner.name.upper() + "_WRAPAROUND"
        # )
        # parameters = [["o1", self.sprite.name], ["o2", self.partner.name], ["x", "num"], ["y", "num"]]
        # preconditions = [
        #     "(= (coordinate_x ?x) (coordinate_x ?y))",
        #     "(= (coordinate_y ?x) (coordinate_y ?y))",
        # ]
        # effects = []  # UNFINISHED

        # return Action(name, parameters, preconditions, effects)

