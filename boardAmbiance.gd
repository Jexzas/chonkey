extends Node
var board: Node2D
var timer: float = 0
var reversed: bool = false
var points: Array
var stars: TextureRect
var currentSize: Vector2 
var positions: Dictionary = {}
var piecesReady: int = 0
var sound = preload("res://sound/clump.ogg")
var bing: SceneTreeTimer 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_tree().get_nodes_in_group("markers"):
			positions[child.get_name()] = child.get_position()
	print(positions)
	board = %BoardNode
	stars = %Background
	currentSize = stars.get_minimum_size()
	points = board.get_children()
	for i in points:
		if i is not Marker2D:
			points.erase(i)

func readyThePieces(delta:float):
	for piece in get_tree().get_nodes_in_group("pieces"):
		while piece.position != piece.defPos.position:
			piece.position = piece.position.lerp(piece.defPos.position, .7)
			if !%AudioStreamPlayer2D.is_playing():
				%AudioStreamPlayer2D.stream = sound
				%AudioStreamPlayer2D.play()
		piecesReady += 1
		bing = get_tree().create_timer(.3)
		await bing.timeout
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if piecesReady <= 15:
		readyThePieces(delta)
		
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
		
