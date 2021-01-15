###############################################################################
# avatarPDDL.py
# Ignacio Vellido Expósito
# 28/09/2020
#
# Multiple classes defining parts of a PDDL domain for an avatar
###############################################################################

from pddl.typesPDDL import *

###############################################################################
# -----------------------------------------------------------------------------
###############################################################################


class AvatarPDDL:
    """ Class that encapsulate the generation of PDDL domain structures 
    for the avatar
    
    Atributes:
        avatar           - SpriteVGDL
        partner          - SpriteVGDL
        hierarchy        - Dict<String,String>
    """

    def __init__(self, avatar: "Sprite", hierarchy: dict, partner: "Sprite" = None):
        self.avatar = avatar
        self.hierarchy = hierarchy
        self.partner = partner

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
        self.actions = AvatarActions(self.avatar, self.hierarchy, self.partner).actions

    # -------------------------------------------------------------------------

    def get_level_predicates(self):
        self.level_predicates = AvatarLevelPredicates(self.avatar).level_predicates

    # -------------------------------------------------------------------------

    def get_predicates(self):
        self.predicates = AvatarPredicates(self.avatar, self.partner).predicates

###############################################################################
# -----------------------------------------------------------------------------
###############################################################################


class AvatarActions:
    """ Returns different actions depending of the avatar 

    Atributes:
        avatar  - SpriteVGDL
        partner - SpriteVGDL
                    If ACTION_USE is available for the avatar, 'partner' is the 
                    sprite that is produced
        actions - List<ActionPDDL>
    """

    def __init__(self, avatar: "Sprite", hierarchy: dict, partner: "Sprite"):
        self.avatar = avatar
        self.hierarchy = hierarchy
        self.partner = partner

        self.actions = []

        # Dict with the functions needed for each avatar
        avatar_action_list = {
            # Can't move but can turn and use object over itself
            "AimedAvatar" : [self.turn_up, self.turn_down, self.turn_left, self.turn_right, self.use_up, self.use_down, self.use_left, self.use_right, self.nil],

            # This avatar should have ammo !!!!!!!!!!
            # Always same orientation, can move horizontally and use object
            "FlakAvatar"  : [self.move_left, self.move_right, self.use_center, self.nil],

            # Always same orientation, can only move left or right
            "HorizontalAvatar": [self.move_left, self.move_right, self.nil],

            # Always same orientation, can move in any direction
            # This avatar doesn't have orientation, so it can move freely
            "MovingAvatar" : [self.move_up, self.move_down, self.move_left, self.move_right, self.nil],

            # Can move and turn in any direction
            "OrientedAvatar" : [self.move_up, self.move_down, self.move_left, self.move_right, self.turn_up, self.turn_down, self.turn_left, self.turn_right, self.nil],

            # Can move and turn in any direction, can use object in the 4 directions
            "ShootAvatar" : [self.move_up, self.move_down, self.move_left, self.move_right, self.turn_up, self.turn_down, self.turn_left, self.turn_right, self.use_up, self.use_down, self.use_left, self.use_right, self.nil],

            # Always same orientation, can only move up or down
            "VerticalAvatar" : [self.move_up, self.move_down]
        }

        self.get_actions(avatar_action_list.get(self.avatar.stype, []))

    # -------------------------------------------------------------------------
    # -------------------------------------------------------------------------

    def get_actions(self, action_list):
        """ Stores in self.actions the actions defined """
        for function in action_list:
            self.actions.append(function())

    # -------------------------------------------------------------------------
    # -------------------------------------------------------------------------

    def move_up(self):
        name = "AVATAR_ACTION_MOVE_UP"
        parameters = [["a", self.avatar.stype], ["c", "cell"], ["c_last", "cell"], ["u", "cell"]]

        # can-move indicates that te avatar has the ability to move in that direction
        preconditions = ["(turn-avatar)", "(or (oriented-up ?a) (oriented-none ?a))",
                         "(at ?c ?a)",
                         "(connected-up ?c ?u)"]

        effects = [
                    "(not (at ?c ?a))", "(at ?u ?a)", 
                    "(not (turn-avatar))", "(turn-sprites)"]

        return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def move_down(self):
        name = "AVATAR_ACTION_MOVE_DOWN"
        parameters = [["a", self.avatar.stype], ["c", "cell"], ["c_last", "cell"], ["d", "cell"]]

        # can-move indicates that te avatar has the ability to move in that direction
        preconditions = ["(turn-avatar)", "(or (oriented-down ?a) (oriented-none ?a))",
                         "(at ?c ?a)",
                         "(connected-down ?c ?d)"]
        effects = [
                    "(not (at ?c ?a))", "(at ?d ?a)", 
                    "(not (turn-avatar))", "(turn-sprites)"]

        return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def move_left(self):
        name = "AVATAR_ACTION_MOVE_LEFT"
        parameters = [["a", self.avatar.stype], ["c", "cell"], ["c_last", "cell"], ["l", "cell"]]

        # can-move indicates that te avatar has the ability to move in that direction
        preconditions = ["(turn-avatar)", "(or (oriented-left ?a) (oriented-none ?a))", 
                         "(at ?c ?a)",
                         "(connected-left ?c ?l)"]
        effects = [
                    "(not (at ?c ?a))", "(at ?l ?a)", 
                    "(not (turn-avatar))", "(turn-sprites)"]

        return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def move_right(self):
        name = "AVATAR_ACTION_MOVE_RIGHT"
        parameters = [["a", self.avatar.stype], ["c", "cell"], ["c_last", "cell"], ["r", "cell"]]

        # can-move indicates that te avatar has the ability to move in that direction
        preconditions = ["(turn-avatar)", "(or (oriented-right ?a) (oriented-none ?a))", 
                         "(at ?c ?a)",
                         "(connected-right ?c ?r)"]
        effects = [
                    "(not (at ?c ?a))", "(at ?r ?a)", 
                    "(not (turn-avatar))", "(turn-sprites)"]

        return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    # This method should only be called if the avatar can turn
    def turn_up(self):
        name = "AVATAR_ACTION_TURN_UP"
        parameters = [["a", self.avatar.stype]]

        # If not (can-change-orientation ?a), the avatar cannot use this action
        # preconditions = ["(turn-avatar)", "(can-change-orientation ?a)","(not (oriented-up ?a))"]
        # can-change-orientation maybe not needed
        preconditions = ["(turn-avatar)", "(not (oriented-up ?a))"]

        effect_down = """
                    (when
                        (oriented-down ?a )
                        (not (oriented-down ?a))
                    )"""
        effect_left = """
                    (when
                        (oriented-left ?a )
                        (not (oriented-left ?a))
                    )"""
        effect_right = """
                    (when
                        (oriented-right ?a )
                        (not (oriented-right ?a))
                    )"""

        effects = [effect_down, effect_right, effect_left, "(oriented-up ?a)", "(not (turn-avatar))", "(turn-sprites)"]

        return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def turn_down(self):
        name = "AVATAR_ACTION_TURN_DOWN"
        parameters = [["a", self.avatar.stype]]

        # If not (can-change-orientation ?a), the avatar cannot use this action
        # preconditions = ["(turn-avatar)", "(can-change-orientation ?a)","(not (oriented-down ?a))"]
        # can-change-orientation maybe not needed
        preconditions = ["(turn-avatar)", "(not (oriented-down ?a))"]

        effect_up = """
                    (when
                        (oriented-up ?a )
                        (not (oriented-up ?a))
                    )"""
        effect_left = """
                    (when
                        (oriented-left ?a )
                        (not (oriented-left ?a))
                    )"""
        effect_right = """
                    (when
                        (oriented-right ?a )
                        (not (oriented-right ?a))
                    )"""

        effects = [effect_left, effect_right, effect_up, "(oriented-down ?a)", "(not (turn-avatar))", "(turn-sprites)"]

        return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def turn_left(self):
        name = "AVATAR_ACTION_TURN_LEFT"
        parameters = [["a", self.avatar.stype]]

        # If not (can-change-orientation ?a), the avatar cannot use this action
        # preconditions = ["(turn-avatar)", "(can-change-orientation ?a)","(not (oriented-left ?a))"]
        preconditions = ["(turn-avatar)", "(not (oriented-left ?a))"]

        effect_down = """
                    (when
                        (oriented-down ?a )
                        (not (oriented-down ?a))
                    )"""
        effect_up = """
                    (when
                        (oriented-up ?a )
                        (not (oriented-up ?a))
                    )"""
        effect_right = """
                    (when
                        (oriented-right ?a )
                        (not (oriented-right ?a))
                    )"""

        effects = [effect_down, effect_right, effect_up, "(oriented-left ?a)", "(not (turn-avatar))", "(turn-sprites)"]

        return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    def turn_right(self):
        name = "AVATAR_ACTION_TURN_RIGHT"
        parameters = [["a", self.avatar.stype]]

        # If not (can-change-orientation ?a), the avatar cannot use this action
        # preconditions = ["(turn-avatar)", "(can-change-orientation ?a)","(not (oriented-right ?a))"]
        preconditions = ["(turn-avatar)", "(not (oriented-right ?a))"]

        effect_down = """
                    (when
                        (oriented-down ?a )
                        (not (oriented-down ?a))
                    )"""
        effect_up = """
                    (when
                        (oriented-up ?a )
                        (not (oriented-up ?a))
                    )"""
        effect_left = """
                    (when
                        (oriented-left ?a )
                        (not (oriented-left ?a))
                    )"""

        effects = [effect_down, effect_left, effect_up, "(oriented-right ?a)", "(not (turn-avatar))", "(turn-sprites)"]

        return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    # can-use is a predicate that should not be active in case there is no ammo
    def use_center(self):
        """ Generates the partner object in the same tile as the avatar

        partner:     Sprite that is generated
        """
        if self.partner == None:
            raise TypeError('Argument "partner" is not defined')

        name = "AVATAR_ACTION_USE_CENTER"
        parameters = [["a", self.avatar.stype], ["p", self.partner.name], ["c", "cell"]]
        preconditions = ["(turn-avatar)", "(at ?c ?a)"]

        effects = ["(at ?c ?p)", "(not (turn-avatar))", "(turn-sprites)"]

        return Action(name, parameters, preconditions, effects)

    # can-use is a predicate that should not be active in case there is no ammo
    def use_up(self):
        """ Generates the partner object in front of the avatar (UP)

        partner:     Sprite that is generated
        """
        if self.partner == None:
            raise TypeError('Argument "partner" is not defined')

        name = "AVATAR_ACTION_USE_UP"
        parameters = [["a", self.avatar.stype], ["p", self.partner.name], ["c", "cell"], ["u", "cell"]]
        preconditions = ["(turn-avatar)", "(at ?c ?a)", "(oriented-up ?a)", "(connected-up ?c ?u)"]

        effects = ["(at ?u ?p)", "(not (turn-avatar))", "(turn-sprites)"]

        return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    # can-use is a predicate that should not be active in case there is no ammo
    def use_down(self):
        """ Generates the partner object in front of the avatar (UP)

        partner:     Sprite that is generated
        """
        if self.partner == None:
            raise TypeError('Argument "partner" is not defined')

        name = "AVATAR_ACTION_USE_DOWN"
        parameters = [["a", self.avatar.stype], ["p", self.partner.name], ["c", "cell"], ["d", "cell"]]
        preconditions = ["(turn-avatar)", "(at ?c ?a)", "(oriented-down ?a)", "(connected-down ?c ?d)"]

        effects = ["(at ?d ?p)", "(not (turn-avatar))", "(turn-sprites)"]

        return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    # can-use is a predicate that should not be active in case there is no ammo
    def use_left(self):
        """ Generates the partner object in front of the avatar (UP)

        partner:     Sprite that is generated
        """
        if self.partner == None:
            raise TypeError('Argument "partner" is not defined')

        name = "AVATAR_ACTION_USE_LEFT"
        parameters = [["a", self.avatar.stype], ["p", self.partner.name], ["c", "cell"], ["l", "cell"]]
        preconditions = ["(turn-avatar)", "(at ?c ?a)", "(oriented-left ?a)", "(connected-left ?c ?l)"]

        effects = ["(at ?l ?p)", "(not (turn-avatar))", "(turn-sprites)"]

        return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    # can-use is a predicate that should not be active in case there is no ammo
    def use_right(self):
        """ Generates the partner object in front of the avatar (UP)

        partner:     Sprite that is generated
        """
        if self.partner == None:
            raise TypeError('Argument "partner" is not defined')

        name = "AVATAR_ACTION_USE_RIGHT"
        parameters = [["a", self.avatar.stype], ["p", self.partner.name], ["c", "cell"], ["r", "cell"]]
        preconditions = ["(turn-avatar)", "(at ?c ?a)", "(oriented-right ?a)", "(connected-right ?c ?r)"]

        effects = ["(at ?r ?p)", "(not (turn-avatar))", "(turn-sprites)"]

        return Action(name, parameters, preconditions, effects)

    # -------------------------------------------------------------------------

    # Probably will not work
    def nil(self):
        """ Avatar doesn't do anything """
        name = "AVATAR_ACTION_NIL"
        parameters = [["a", self.avatar.stype]]
        preconditions = ["(turn-avatar)"]
        effects = ["(not (turn-avatar))", "(turn-sprites)"]

        return Action(name, parameters, preconditions, effects)


###############################################################################
# -----------------------------------------------------------------------------
###############################################################################


class AvatarPredicates:
    """ Returns different predicates depending of the avatar """

    def __init__(self, avatar: "Sprite", partner: "Sprite" = None):
        self.avatar = avatar
        self.partner = partner

        self.predicates = []
        self.get_predicates()

    # -------------------------------------------------------------------------
    # -------------------------------------------------------------------------

    def get_predicates(self):
        """ Return a list of predicates depending of the avatar """
        # To avoid errors in dict
        if not self.partner:
            partner_name = ""
        else:
            partner_name = self.partner.name


        # Dict with the predicates needed for each avatar
        avatar_predicates_list = {
            # Can't move but can use object
            "AimedAvatar" : [],

            # This avatar should have ammo !!!!!!!!!!
            # Always same orientation, can move horizontally and use object  
            "FlakAvatar"  : [],

            # Always same orientation, can only move left or right
            "HorizontalAvatar": [],

            # Always same orientation, can move in any direction
            # This avatar don't have orientation, so it can move freely
            "MovingAvatar" : [],

            # Can move and aim in any direction, can't use object
            "OrientedAvatar" : [],

            # Can move and aim in any direction, can use object
            "ShootAvatar" : [],

            # Always same orientation, can only move up or down
            "VerticalAvatar" : []
        }

        self.predicates.extend(avatar_predicates_list.get(self.avatar.stype, []))


###############################################################################
# -----------------------------------------------------------------------------
###############################################################################


class AvatarLevelPredicates:
    """ Returns different level predicates depending of the avatar """

    def __init__(self, avatar: "Sprite"):
        self.avatar = avatar

        self.level_predicates = []
        self.get_level_predicates()

    # -------------------------------------------------------------------------
    # -------------------------------------------------------------------------

    # Avatar is defined as ?a to be substituted later for the real name
    def get_level_predicates(self):
        """ Return a list of predicates depending of the avatar """

        # Generic orientation for all avatars
        self.level_predicates.append("(oriented-up ?a)")

        # Dict with the predicates needed for each avatar
        avatar_levelPredicates_list = {
            # Can't move but can use object
            "AimedAvatar" : [],

            # This avatar should have ammo !!!!!!!!!!
            # Always same orientation, can move horizontally and use object  
            "FlakAvatar"  : [],

            # Always same orientation, can only move left or right
            "HorizontalAvatar": [],

            # Always same orientation, can move in any direction
            # This avatar don't have orientation, so it can move freely
            "MovingAvatar" : [],

            # Can move and aim in any direction, can't use object
            "OrientedAvatar" : [],

            # Can move and aim in any direction, can use object
            "ShootAvatar" : [],

            # Always same orientation, can only move up or down
            "VerticalAvatar" : []
        }

        self.level_predicates.extend(avatar_levelPredicates_list.get(self.avatar.stype, []))