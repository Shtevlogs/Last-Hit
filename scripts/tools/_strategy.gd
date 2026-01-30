@abstract
class_name _Strategy

static var strategy_names : Array[StringName] = []
static var strategy_registry : Dictionary = {}

class StrategyDef:
    var str_to_type : Dictionary = {}
class StrategySingletonDef extends StrategyDef:
    var type_to_obj : Dictionary = {}

static func _static_init() -> void:
    # Grab strategy names
    var strategy_class_name := (_Strategy as GDScript).get_global_name()
    var class_list := ProjectSettings.get_global_class_list()
    for class_dict: Dictionary in class_list:
        if class_dict["base"] != strategy_class_name: continue
        strategy_names.append(class_dict["class"])
    
    # Fill strategy registry with each strategy name
    for strategy_name : StringName in strategy_names:
        var strategy_reg_script := """
static func _static_init() -> void:
    _Strategy.register_strategy_root(%s)
""" % strategy_name
        for class_dict: Dictionary in class_list:
            if class_dict["base"] != strategy_name: continue
            strategy_reg_script = strategy_reg_script + """
    _Strategy.register_strategy(%s,%s)
""" % [strategy_name, class_dict["class"]]
        var registrator := GDScript.new()
        registrator.source_code = strategy_reg_script
        var error_code: int = registrator.reload()
        print("Registering strategy %s... %s" % [strategy_name, error_code])

static func _should_save_singletons(script: GDScript) -> bool:
    var callable := Callable(script, "save_singletons")
    if !callable.is_valid():
        return false
    return script.save_singletons()

static func register_strategy_root(script: GDScript) -> void:
    if _should_save_singletons(script):
        strategy_registry[script] = StrategySingletonDef.new()
    else:
        strategy_registry[script] = StrategyDef.new()

static func register_strategy(strategy_root: GDScript, strategy_implementation: GDScript) -> void:
    var strategy_def := strategy_registry[strategy_root] as StrategyDef
    strategy_def.str_to_type[strategy_implementation.get_global_name()] = strategy_implementation
    if strategy_def is StrategySingletonDef:
        strategy_def.type_to_obj[strategy_implementation] = strategy_implementation.new()

static func get_strategy(strategy_root: GDScript, strategy_name: StringName) -> GDScript:
    return strategy_registry[strategy_root].str_to_type[strategy_name]

static func get_strategy_singleton(strategy_root: GDScript, strategy_implementation: GDScript) -> Variant:
    return strategy_registry[strategy_root].type_to_obj[strategy_implementation]
