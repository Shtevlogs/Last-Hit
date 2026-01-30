class_name VfxManager
extends Node2D

const MAX_VFX_TIME := 5.0

static var _I: VfxManager
func _ready() -> void:
    _I = self

const VFX_FLOATING_NUMBER : PackedScene = preload("uid://c1kxjbme1gqgs")
const VFX : Array[PackedScene] = [
    VFX_FLOATING_NUMBER
]

static func spawn_vfx(vfx_position: Vector2, vfx: PackedScene, param: Variant = null) -> void:
    var new_vfx := vfx.instantiate() as Vfx
    _I.get_parent().add_child(new_vfx)
    new_vfx.position = vfx_position
    new_vfx.initialize(param)
    
    await _I.get_tree().create_timer(MAX_VFX_TIME).timeout
    
    if new_vfx && !new_vfx.is_queued_for_deletion():
        new_vfx.queue_free()
