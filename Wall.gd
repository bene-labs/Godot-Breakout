extends Area2D

enum Type{
	VERTICAL,
	HORIZONTAL
}

export (Type) var type = Type.VERTICAL

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Wall_area_entered(area):
	if type == Type.HORIZONTAL && area.has_method("bounce_vertical"):
		area.bounce_vertical()
	if type == Type.VERTICAL && area.has_method("bounce_horizontal"):
		area.bounce_horizontal()
