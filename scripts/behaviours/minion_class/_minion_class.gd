@abstract
class_name _MinionClass

static var str_to_minion_class := {}
static var minion_class_to_instance := {}

static func _static_init() -> void:
    var minion_class_name := (_MinionClass as GDScript).get_global_name()
    var class_list := ProjectSettings.get_global_class_list()
    for class_dict: Dictionary in class_list:
        if class_dict["base"] != minion_class_name: continue
        var gdScript := load(class_dict["path"]) as GDScript
        str_to_minion_class.set(gdScript.get_global_name(), gdScript)
        minion_class_to_instance.set(gdScript, gdScript.new())

@abstract func get_polygon_data() -> PackedVector2Array
@abstract func get_action_cooldown() -> float
@abstract func get_move_time() -> float
@abstract func get_attack_time() -> float
@abstract func get_lunge_time() -> float
@abstract func get_attack_damage() -> int
@abstract func get_total_health() -> int
@abstract func get_last_hit_reward() -> int
@abstract func get_spawn_cost() -> int
@abstract func get_spawn_cooldown() -> float
@abstract func get_range() -> int
