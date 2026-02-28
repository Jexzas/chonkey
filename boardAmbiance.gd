extends Node
var board: Node2D
var timer: float = 0
var reversed: bool = false
var points: Array
var stars: TextureRect
var currentSize: Vector2 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	board = %BoardNode
	stars = %Background
	currentSize = stars.get_minimum_size()
	points = board.get_children()
	for i in points:
		if i is not Marker2D:
			points.erase(i)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	currentSize = Vector2(currentSize.x + .003, currentSize.y + .003)
	stars.custom_minimum_size = currentSize
	if timer >= 3:
		reversed = true
	elif timer <= -3:
		reversed = false
	if reversed: 
		
		timer -= .1 * delta
	else: 
		timer += .1 * delta
	board.rotation_degrees = timer
		
