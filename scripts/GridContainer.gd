extends GridContainer

var numberOfBalls = 10
var BallScene = preload("res://scenes/ball.tscn")
var balls = []
@warning_ignore("integer_division")
var rows = numberOfBalls/columns

func victory():
	get_tree().change_scene_to_file("res://scenes/victory_screen.tscn")

func evaluateState():
	for x in columns:
		for y in rows:
			if balls[x][y].get_node("Area2D").get_node("Ball").getState() == false:
				return
	victory()
	

func sendInfo(x,y):
	var neighbours = [];

	# TOP
	if y > 0:
		neighbours.append(balls[x][y-1])

	# LEFT
	if x > 0:
		neighbours.append(balls[x-1][y])

   # RIGHT
	if x < len(balls) - 1:
		neighbours.append(balls[x+1][y])

   # BOTTOM
	if y < len(balls[x]) - 1:
		neighbours.append(balls[x][y+1])

	
	# send neighbours
	balls[x][y].get_node("Area2D").get_node("Ball").sendNeighbours(neighbours)
	balls[x][y].get_node("Area2D").get_node("Ball").sendCoordinates(x,y)
# Called when the node enters the scene tree for the first time.
func _ready():
	for x in range(columns):
		balls.append([])
		for y in range(rows):
			var Ball = BallScene.instantiate()
			balls[x].append(Ball)
			add_child(Ball)
	for x in columns:
		for y in rows:
			sendInfo(x,y)

func _process(_delta):
	evaluateState()
