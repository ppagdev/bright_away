extends Control

func setImage(imagePath="res://assets/images/puzzle-texture.png"):
	var image = load(imagePath)
	get_node("Image").set_texture(image)

