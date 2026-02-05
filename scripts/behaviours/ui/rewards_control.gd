class_name RewardsControl
extends Control

@onready var label: Label = $Label

func _ready() -> void:
    visible = false

func open_with(value: int) -> void:
    visible = true
    label.text = "+%sg" % value
