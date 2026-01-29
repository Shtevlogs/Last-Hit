class_name MinionState
extends _State

var position: Vector2i = Vector2i.ZERO
var action_cooldown: float = 0.0
var attack_cooldown: float = 0.0
var move_cooldown: float = 0.0
var enemy: bool = false
var total_health: int = 100
var current_health: int = 100

func serialize() -> Dictionary:
    return {
        "position": position,
        "action_cooldown": action_cooldown,
        "attack_cooldown": attack_cooldown,
        "move_cooldown": move_cooldown,
        "enemy": enemy,
        "total_health": total_health,
        "current_health": current_health,
    }

func deserialize(data: Dictionary) -> _State:
    position = deserialize_vector2i(data["position"])
    action_cooldown = float(data["action_cooldown"])
    attack_cooldown = float(data["attack_cooldown"])
    move_cooldown = float(data["move_cooldown"])
    enemy = bool(data["enemy"])
    total_health = int(data["total_health"])
    current_health = int(data["current_health"])
    return self
