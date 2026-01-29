@abstract
class_name _State

@warning_ignore("unused_signal")
signal updated()
@warning_ignore("unused_signal")
signal destroyed()
@warning_ignore("unused_signal")
signal custom_event(data: Variant)

@abstract func serialize() -> Dictionary

@abstract func deserialize(_data: Dictionary) -> _State

func deserialize_vector2(data: String) -> Vector2:
    var parts: PackedStringArray = data.split(",")
    if parts.size() != 2:
        return Vector2.ZERO
    return Vector2(float(parts[0]), float(parts[1]))

func deserialize_vector2i(data: String) -> Vector2i:
    var parts: PackedStringArray = data.split(",")
    if parts.size() != 2:
        return Vector2i.ZERO
    return Vector2i(int(parts[0]), int(parts[1]))

func serialize_array(array: Variant) -> Array[Dictionary]:
    var to_return: Array[Dictionary] = []
    to_return.assign(array.map(func(item: _State): return item.serialize()))
    return to_return

func deserialize_array(type: GDScript, dest: Variant, array: Array) -> Variant:
    dest.assign(array.map(func(item: Dictionary): return type.new().deserialize(item)))
    return dest
