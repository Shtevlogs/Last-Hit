class_name MinionState
extends _State

var position: Vector2i = Vector2i.ZERO
var action_cooldown: float = 0.0
var attack_cooldown: float = 0.0
var move_cooldown: float = 0.0
var enemy: bool = false
var total_health: int = 100
var current_health: int = 100
var minion_class: GDScript = WarriorMinion
var target_uid: int = 0
var uid : int = 0

func serialize() -> Dictionary:
    return {
        "position": position,
        "action_cooldown": action_cooldown,
        "attack_cooldown": attack_cooldown,
        "move_cooldown": move_cooldown,
        "enemy": enemy,
        "total_health": total_health,
        "current_health": current_health,
        "minion_class": minion_class.get_global_name(),
        "target_uid": target_uid,
        "uid": uid
    }

func deserialize(data: Dictionary) -> _State:
    position = deserialize_vector2i(data["position"])
    action_cooldown = float(data["action_cooldown"])
    attack_cooldown = float(data["attack_cooldown"])
    move_cooldown = float(data["move_cooldown"])
    enemy = bool(data["enemy"])
    total_health = int(data["total_health"])
    current_health = int(data["current_health"])
    minion_class = _Strategy.get_strategy(_MinionClass, data["minion_class"])
    target_uid = int(data["target_uid"])
    uid = int(data["uid"])
    return self
