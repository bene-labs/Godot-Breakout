extends Area2D


var direction = Vector2(0, 0)
export var speed = 150

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * speed * delta

func _input(event):
	if event.is_action_pressed("move_left"):
		direction = Vector2(-1, 0)
	elif event.is_action_pressed("move_right"):
		direction = Vector2(1, 0)


func _on_Paddle_area_entered(area):
	if area.has_method("bounce_vertical"):
		area.bounce_vertical()
		if area.has_method("set_x_direction"):
			area.set_x_direction(-1 if area.position.x <= \
			position.x + $Sprite.get_rect().size.x / (2 * $Sprite.scale.x) else 1)
	elif area.has_method("activate_effect"):
		area.activate_effect()
		
func bounce_horizontal():
	direction.x = -direction.x
	position += direction

func add_speed(gained_speed):
	speed += gained_speed
	
func add_size(gained_size):
	var x_size = $Sprite.texture.get_size().x * $Sprite.scale.x
	scale.x = (x_size + gained_size) / x_size
