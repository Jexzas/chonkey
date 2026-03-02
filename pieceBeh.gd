extends Node
@export var piece: Node2D
@export var defPos: Marker2D
var timer: float
var pScale: Vector2
var rand = RandomNumberGenerator.new()
var deci: int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer = 0
	deci = 10
	pScale = piece.transform.get_scale()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer += delta
	if timer > deci:
		animate(delta)
		deci += 10


func animate(delta: float) -> void:
	var base = pScale
	for i in range(100):
		var my_random_number = rand.randf_range(.995, 1.005)
		piece.apply_scale(Vector2(my_random_number, my_random_number))
		await get_tree().create_timer(.0002 * delta).timeout
	piece.scale = pScale
