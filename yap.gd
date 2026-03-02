extends Node
@export var yapper: Node2D
var bing: Vector2
var yapPos: Vector2
var rander = RandomNumberGenerator.new()
var speed
var flipper = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bing = %center.global_position
	yapPos = yapper.position
	speed = rander.randf_range(1, 303)

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if flipper == false:
		while yapper.global_position != bing:
			yapper.global_position += yapper.global_position.direction_to(bing) * speed * delta
			print(yapper.global_position)
		
		flipper = true
	else:
		if yapper.global_position.x < bing.x - 1000 or yapper.global_position.x > bing.x + 1000 and yapper.global_position.y < bing.y - 1000 or yapper.global_position.y > bing.y + 1000:
			yapper.global_position += yapper.global_position.direction_to(yapPos) * speed * 3 * delta
		else:
			flipper = false
