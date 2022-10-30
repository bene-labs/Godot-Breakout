extends Sprite
var Block = preload("res://Block.tscn")
export var rows = 3
export var collumns = 5
var blocks = [[]]
var total_blocks = 0

signal empty

# Called when the node enters the scene tree for the first time.
func _ready():
	fill()
	
func set_dimension(x, y):
	rows = y
	collumns = x
	
func fill():	
	var background_rect = get_rect()
	var size = texture.get_size() #* scale
	var tw = size.x / collumns
	var th = size.y / rows
	var pos = Vector2(0, 0)

	for i in range(rows):
		blocks.append([])
		pos.x = 0
		for j in range(collumns):
			var new_block = Block.instance()
			var block_sprite =  new_block.get_node("Sprite")
			var block_size = block_sprite.texture.get_size() * block_sprite.scale
			
			new_block.scale = Vector2(tw / block_size.x, th / block_size.y)
			new_block.position = background_rect.position + pos
			blocks[i].append(new_block)
			add_child(new_block)
			pos.x += tw
		pos.y += th
	total_blocks = rows * collumns
		
func on_block_destroyed():
	total_blocks -= 1
	if total_blocks == 0:
		emit_signal("empty")
