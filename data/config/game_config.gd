class_name GameConfig

const GRID_WIDTH := 7
const GRID_HEIGHT := 10
const TILE_WIDTH := 15.0

const GRID_MIDPOINT := Vector2(GRID_WIDTH * TILE_WIDTH, GRID_HEIGHT * TILE_WIDTH) / 2.0 - Vector2(TILE_WIDTH/2.0,TILE_WIDTH/2.0)
const GRID_OFFSET := Vector2(-60.0, 0.0)

const MINION_EASING := Tween.EaseType.EASE_IN_OUT
const MINION_TRANS := Tween.TransitionType.TRANS_CIRC

const WARRIOR_ACTION_COOLDOWN := 1.0
const WARRIOR_MOVE_TIME := 0.8
const WARRIOR_ATTACK_TIME := 1.2
