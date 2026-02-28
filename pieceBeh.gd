extends Node
@export var piece: Node2D
var timer: float
var pScale: Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer = 0
	pScale = piece.transform.get_scale()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer += delta
	var evenGuy: int = round(timer)
	if evenGuy % 10 == 0:
		animate(piece)


func animate(node: Node2D) -> void:
	for i in range(900):
		piece.transform.scaled(Vector2(i, i))
		
