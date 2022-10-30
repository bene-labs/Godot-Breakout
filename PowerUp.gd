extends Area2D

enum Effects{
	BIGGER_PADDLE,
	SMALLER_PADDLE,
	FASTER_PADDLE,
	SLOWER_PADDLE,
	FASTER_BALL,
	SLOWER_BALL
}

export (Effects) var effect = Effects.BIGGER_PADDLE
export var pick_random = true
export var fall_speed = 120

# Called when the node enters the scene tree for the first time.
func _ready():
	if pick_random:
		effect = randi() % Effects.values().size()
	$Sprite.frame = effect
		
func _process(delta):
	position.y += fall_speed * delta

func activate_effect():
	var root = get_tree().root.get_child(0)
	
	match effect:
		Effects.BIGGER_PADDLE:
			root.get_node("Paddle").add_size(60)
		Effects.SMALLER_PADDLE:
			root.get_node("Paddle").add_size(-60)
		Effects.FASTER_PADDLE:
			root.get_node("Paddle").add_speed(50)
		Effects.SLOWER_PADDLE:
			root.get_node("Paddle").add_speed(-30)
		Effects.FASTER_BALL:
			root.get_node("RetroBall").add_speed(30)
		Effects.SLOWER_BALL:
			root.get_node("RetroBall").add_speed(-30)
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
