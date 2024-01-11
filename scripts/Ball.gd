extends CollisionShape2D

var gameWidth = ProjectSettings.get_setting('display/window/size/viewport_width')
var gameHeight = ProjectSettings.get_setting('display/window/size/viewport_height')
var radius = gameWidth * 0.2
var onFlag = false
const colorOff = Color.DEEP_PINK
const colorOn = Color.DEEP_SKY_BLUE
var color = colorOff
var column
var row
var neighbours = []

func getState():
	return onFlag

func sendCoordinates(x,y):
	column = x
	row = y

func sendNeighbours(list):
	neighbours = list

func _ready():
	self.shape.set_radius(radius)

func toggleState():
	if !onFlag:
		onFlag = true
		color = colorOn
	else:
		onFlag = false
		color = colorOff
	queue_redraw()

func toggleNeighbours():
	for ball in neighbours:
		ball.get_node("Area2D").get_node("Ball").toggleState()
		print(ball.get_node("Area2D").get_node("Ball").column,ball.get_node("Area2D").get_node("Ball").row)

func _draw():
	draw_circle(position, radius, color)

func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			toggleState()
			toggleNeighbours()
