###############################################################################
# domainGeneratorHPDL.py
# Ignacio Vellido Expósito
# 29/11/2019
#
# Generates the different parts of a HPDL domain
###############################################################################

from vgdl.typesVGDL import *
from hpdl.typesHPDL import *
from hpdl.avatarHPDL import *
from hpdl.spriteHPDL import *
from hpdl.interactionHPDL import *

###############################################################################
# -----------------------------------------------------------------------------
###############################################################################


class DomainGeneratorHPDL:
    """ Generates the different parts of a HPDL domain """

    def __init__(
        self,
        sprites: list,
        interactions: list,
        terminations: list,
        mappings: list,
        hierarchy: dict,
        avatar: "Sprite",
    ):
        self.sprites = sprites
        self.interactions = interactions
        self.mappings = mappings  # An array of LevelMapping
        self.hierarchy = hierarchy  # Dictionary with the parents of each long_type
        self.avatar = avatar

        # String arrays
        self.types = []
        self.constants = []
        self.predicates = []
        self.functions = []
        self.tasks = []
        self.actions = []

        # For the level parser
        self.partner = None
        self.short_types = []  # The char part of a LevelMapping
        self.long_types = []  # The sprites part of a LevelMapping
        self.stypes = set()  # All types in the game (bigger than long_types)
        self.transformTo = []  # Objects that can be created
        # ADD LATER THE SPAWNPOINTS TOO

        self.search_partner()
        self.avatarHPDL = AvatarHPDL(self.avatar, self.hierarchy, self.partner)
        self.spritesHPDL = []

        self.assign_types()
        self.assign_constants()
        self.assign_predicates()
        self.assign_functions()
        self.assign_tasks()
        self.assign_actions()

    # -------------------------------------------------------------------------

    def search_partner(self) -> "Sprite":
        """ If it has USE command, search his partner (produced sprite) """

        list_avatar_use = ["FlakAvatar", "AimedAvatar", "ShootAvatar"]
        if self.avatar.stype in list_avatar_use:
            matching = [s for s in self.avatar.parameters if "stype" in s]
            partner_name = matching[0].replace("stype=", "")

            # We have the sprite name, now we need the hole object
            """Probably the entire object is not needed, it must be checked later on"""
            for sprite in self.sprites:
                if sprite.name is not None and partner_name in sprite.name:
                    self.partner = sprite

    # -------------------------------------------------------------------------
    # Auxiliary
    # -------------------------------------------------------------------------

    def find_sprite_by_name(self, name: str) -> "Sprite":
        """ Find a sprite given his name """
        for sprite in self.sprites:
            if sprite.name == name:
                return sprite

    # -------------------------------------------------------------------------

    def find_type_by_name(self, name: str) -> str:
        """ Find the type of a sprite given his name """
        for sprite in self.sprites:
            if sprite.name == name:
                if sprite.stype is not None:
                    return sprite.stype
                else:
                    return sprite.name

    # -------------------------------------------------------------------------

    def find_father_type_by_name(self, name: str) -> str:
        """ Find the type of a sprite given his name """
        for sprite in self.sprites:
            if sprite.name == name:
                if sprite.father is not None:
                    return sprite.father
                else:
                    return sprite.name

    # -------------------------------------------------------------------------

    def find_sprite_by_name(self, name: str) -> "Sprite":
        for sprite in self.sprites:
            if sprite.name == name:
                return sprite

        return None

    # -------------------------------------------------------------------------

    def find_partner(self, obj: "Sprite") -> "Sprite":
        partner = None
        for par in obj.parameters:
            if "stype" in par:
                partner = par.split("=")[1]
                partner = self.find_sprite_by_name(partner)

        return partner

    # -------------------------------------------------------------------------

    # FROM GITHUB
    def invert_dict(self, d: dict) -> dict:
        """ Inverts the key with the values in a dictionary """
        inverse = dict()
        for key in d:
            # Go through the list that is saved in the dict:
            for item in d[key]:
                # Check if in the inverted dict the key exists
                if item not in inverse:
                    # If not create a new list
                    inverse[item] = [key]
                else:
                    inverse[item].append(key)
        return inverse

    # -------------------------------------------------------------------------

    # FROM GITHUB
    def remove_duplicates(self, seq: list) -> list:
        """ Removes duplicates without changing the order """
        seen = set()
        seen_add = seen.add
        return [x for x in seq if not (x in seen or seen_add(x))]

    # -------------------------------------------------------------------------
    # -------------------------------------------------------------------------

    def assign_types(self):
        """ Object, the types of each sprite and the sprites in their hierarchy """
        stypes = []
        names = []

        for sprite in self.sprites:
            names.append(sprite.name)
            self.stypes.add(sprite.name)

            if sprite.stype is not None:
                stypes.append(sprite.stype)
                self.types.append([sprite.stype, sprite.name])
                self.stypes.add(sprite.stype)
            elif sprite.father is not None:  # If no stype, assign the father as stype
                self.types.append([sprite.father, sprite.name])
                self.stypes.add(sprite.father)

        stypes = list(set(stypes))  # Removing duplicates
        stypes.insert(0, "Object")  # Inserting at the beginning

        # Removing duplicates in sprites names and stypes
        names.extend(stypes)
        lower_names = [x.lower() for x in names]
        duplicates = set([x for x in lower_names if lower_names.count(x) > 1])

        if len(duplicates) > 0:
            for dup in duplicates:
                stypes.remove(dup)

        self.types.append(stypes)

        """
        Detect when an sprite is not defined; find childs; remove their type 
        from objects and add them to the sprite part; add the sprite to objects
        """

        inverted_hierarchy = self.invert_dict(self.hierarchy)

        for obj in inverted_hierarchy:
            if obj != "Object":
                to_add = False
                for types in self.types:
                    if obj in types:
                        to_add = True

            if not to_add:
                childs = inverted_hierarchy[obj]

                to_remove = []

                for c in childs:
                    father = self.find_father_type_by_name(c)

                    if father in childs:
                        to_remove.append(self.find_type_by_name(father))
                    if father == obj:
                        to_remove.append(self.find_type_by_name(c))

                to_remove = self.remove_duplicates(to_remove)
                self.types.append([obj] + to_remove)

                copy_types = []
                for i in range(0, len(self.types)):
                    if self.types[i][0] == "Object":
                        for x in to_remove:
                            try:
                                self.types[i].remove(x)
                            except ValueError:
                                pass

                    copy_types.append(self.types[i])

                self.types = copy_types

                for i in range(0, len(self.types)):
                    if self.types[i][0] == "Object":
                        self.types[i].append(obj)

    # -------------------------------------------------------------------------

    def assign_constants(self):
        """ Don't needed right now """
        pass

    # -------------------------------------------------------------------------

    def assign_predicates(self):
        """ Depends of the avatar - Probably more needed to undo operations """
        self.predicates.append("(orientation-up ?o - Object)")
        self.predicates.append("(orientation-down ?o - Object)")
        self.predicates.append("(orientation-left ?o - Object)")
        self.predicates.append("(orientation-right ?o - Object)")

        avatar = self.avatarHPDL.predicates
        self.predicates.extend(avatar)

        self.predicates.append("(evaluate-interaction ?o1 ?o2 - Object)")
        self.predicates.append("(regenerate-interaction ?o1 ?o2 - Object)")

    # -------------------------------------------------------------------------

    def assign_functions(self):
        """ One for each coordinate; one counter for each type of object in the game 
        and one counter for each resource """
        self.functions.append("(coordinate_x ?o - Object)")
        self.functions.append("(coordinate_y ?o - Object)")
        self.functions.append("(last_coordinate_x ?o - Object)")
        self.functions.append("(last_coordinate_y ?o - Object)")

        for sprite in self.types:
            # If resource, add an special counter for the avatar
            if sprite[0] is not None and "Resource" in sprite[0]:
                self.functions.append(
                    "(resource_" + sprite[1] + " ?a - " + self.avatar.name + ")"
                )

        for t in self.hierarchy:
            if t is not "":
                self.functions.append("(counter_" + t + ")")

        self.functions.append("(turn)")

    # -------------------------------------------------------------------------

    def assign_tasks(self):
        # Main task ------------------------------------------------------------
        finish = Method(
            "finish_game", ["(= (turn) 1)"], []
        )  # UNFINISHED PRECONDITIONS
        if self.partner is not None:
            turn = Method(
                "turn",
                [],
                [
                    "(turn_avatar ?a - "
                    + self.avatar.stype
                    + " ?p - "
                    + self.partner.name
                    + ")",
                    "(turn_objects)",
                    "(check-interactions)",
                    "(create-interactions)",
                    "(:inline () (increase (turn) 1))",
                    "(Turn)",
                ],
            )
        else:
            turn = Method(
                "turn",
                [],
                [
                    "(turn_avatar ?a - " + self.avatar.stype + ")",
                    "(turn_objects)",
                    "(check-interactions)",
                    "(create-interactions)",
                    "(:inline () (increase (turn) 1))",
                    "(Turn)",
                ],
            )
        # undone = Method("turn_undone", [], ["(Turn)"])  # UNFINISHED TASKS

        turn_task = Task("Turn", [], [finish, turn])
        self.tasks.append(turn_task)

        # Avatar turn ---------------------------------------------------------
        self.tasks.append(self.avatarHPDL.task)

        # Rest of objects turn ------------------------------------------------
        object_tasks = []

        for obj in self.sprites:
            partner = self.find_partner(obj)
            spriteHPDL = SpriteHPDL(obj, self.hierarchy, partner)
            methods = spriteHPDL.methods
            self.spritesHPDL.append(spriteHPDL)

            for met in methods:
                object_tasks.extend(met.task_predicates)

        turn = Method("turn", [], object_tasks)
        task_object = Task("turn_objects", [], [turn])

        self.tasks.append(task_object)

        # Create interactions -------------------------------------------------
        create_interaction_methods = []
        create_interaction_methods.append(
            Method(
                "create",
                ["(not (evaluate-interaction ?o1 - Object ?o2 - Object))"],
                ["(:inline () (evaluate-interaction ?o1 ?o2))"],
            )
        )

        create_interaction_methods.append(Method("base_case", [], []))  # Base case
        create_interac = Task("create-interactions", [], create_interaction_methods)

        self.tasks.append(create_interac)

        # Check interactions --------------------------------------------------
        object_interac = []
        object_methods = []

        for interaction in self.interactions:
            sprite = self.find_sprite_by_name(interaction.sprite_name)
            partner = self.find_sprite_by_name(interaction.partner_name)
            object_methods.extend(
                InteractionMethods(interaction, sprite, partner, self.hierarchy).methods
            )

        base = Method("base_case", [], [])
        object_methods.append(base)

        check_interac = Task("check-interactions", [], object_methods)

        self.tasks.append(check_interac)

    # -------------------------------------------------------------------------

    def assign_actions(self):
        """ Calls the different actions generators """

        # Getting specific avatar actions
        avatar_actions = self.avatarHPDL.actions
        self.actions.extend(avatar_actions)

        # And one for each deterministic movable object
        for obj in self.sprites:
            partner = self.find_partner(obj)
            actions = SpriteHPDL(obj, self.hierarchy, partner).actions

            if actions:
                self.actions.extend(actions)

        # And one for each interaction
        for interaction in self.interactions:
            sprite = self.find_sprite_by_name(interaction.sprite_name)
            partner = self.find_sprite_by_name(interaction.partner_name)
            self.actions.extend(
                InteractionActions(interaction, sprite, partner, self.hierarchy).actions
            )

    # -------------------------------------------------------------------------
