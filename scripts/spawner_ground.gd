extends Node2D
class_name QSpawnerGround

const scn_ground: PackedScene = preload("res://scenes/ground.tscn")

const GROUND_WIDTH       : int = 169
const AMOUNT_TO_FILL_VIEW: int = 2

func _ready() -> void:
  for i in range(AMOUNT_TO_FILL_VIEW):
    spawn_and_move()

func spawn_and_move() -> void:
  spawn_ground()
  go_next_pos()

func spawn_ground() -> void:
  var new_ground: QGround = scn_ground.instance()
  new_ground.connect("tree_exited", self, "spawn_and_move")
  new_ground.position = position
  $container.call_deferred("add_child", new_ground)

func go_next_pos() -> void:
  position.x += GROUND_WIDTH