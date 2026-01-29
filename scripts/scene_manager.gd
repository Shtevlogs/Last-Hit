class_name SceneManager
extends Node

const MAIN_MENU : PackedScene = preload("uid://c2el26t2s3eyj")
const GAME : PackedScene = preload("uid://bkgnymwh1s6iy")

static var _I : SceneManager
func _ready() -> void:
    _I = self

@onready var scene_root: Node = $"../SceneRoot"

static func load_scene(scene: PackedScene) -> void:
    if _I.scene_root.get_child_count() != 0:
        _I.scene_root.get_child(0).queue_free()
    var new_scene := scene.instantiate() as Node
    _I.scene_root.add_child(new_scene)
