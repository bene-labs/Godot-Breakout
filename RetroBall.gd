extends Area2D

export var speed = 100
var direction = Vector2(0, 1)

enum Directions{
	UP,
	DOWN,
	LEFT,
	RIGHT
}

func _ready():
	randomize()
	
func _process(delta):
	position += direction * speed * delta

func set_x_direction(x):
	direction.x = x

func bounce_horizontal():
	direction.x = -direction.x
		
func bounce_vertical():
	if direction.x == 0:
		if randi() % 2 == 1:
			direction.x = -1
		else:
			direction.x = 1

	direction.y = -direction.y

func destroy_block(block):
	var block_height = block.get_node("Sprite").get_rect().size.y

	if position.y <= block.global_position.y \
	or position.y >= block.global_position.y + block_height: # below
		bounce_vertical()
	else:
		bounce_horizontal()
	
	block.queue_free()

func add_speed(gained_speed):
	speed += gained_speed
