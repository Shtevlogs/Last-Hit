class_name SFXManager
extends Node

@onready var sfx_player: AudioStreamPlayer = $"SFXPlayer"
@onready var sfx_player_2: AudioStreamPlayer = $SFXPlayer2

static var _I : SFXManager

const ATTACK : AudioStreamWAV = preload("uid://by7pb4icrjl60")
const HIT : = preload("uid://b73rig7inbr0o")
const GET_HIT : = preload("uid://ddnsjilx5laev")
const LOSE : = preload("uid://7fkyayiefvpa")
const SPAWN : = preload("uid://cu1vdfb2lv6qd")
const CLICK : = preload("uid://c0vkecs6a3xx0")
const WIN : = preload("uid://b366rs7hlbptm")

func _ready() -> void:
    _I = self

#Single lane sfx
static func play(option: AudioStreamWAV, rate : float = 1.0) -> void:
    _I.sfx_player.stop()
    _I.sfx_player.stream = option
    _I.sfx_player.pitch_scale = 1.0 / rate
    _I.sfx_player.play()

static func stop() -> void:
    _I.sfx_player.stop()

static func play_2(option: AudioStreamWAV, rate : float = 1.0) -> void:
    _I.sfx_player_2.stop()
    _I.sfx_player_2.stream = option
    _I.sfx_player_2.pitch_scale = 1.0 / rate
    _I.sfx_player_2.play()

static func stop_2() -> void:
    _I.sfx_player_2.stop()
