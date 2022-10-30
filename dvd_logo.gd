extends "res://RetroBall.gd"

export var available_colors = [Color.red, Color.blue, Color.purple]

func _ready():
	$Sprite.self_modulate = available_colors[randi() % available_colors.size()]
	direction = Vector2(1, 1)

func change_color():
#	var prev_color = Color(self_modulate)
	var new_color_index = randi() % (available_colors.size())
	$Sprite.self_modulate = available_colors[new_color_index]
#	available_colors.remove(new_color_index)
#	available_colors.append(prev_color)

func bounce_horizontal():
	.bounce_horizontal()
	change_color()
	
func bounce_vertical():
	.bounce_vertical()
	change_color()
