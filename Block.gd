extends Area2D

export var available_colors = [Color.red, Color.blue, Color.green]
var power_up_scene = preload("res://PowerUp.tscn")
export (int) var powerup_drop_chance = 5 # in percantage, must be positive

signal destroyed

func _ready():
	connect("destroyed", get_parent(), "on_block_destroyed")
	connect("destroyed", get_tree().root.get_child(0).get_node("Score"), "on_block_destroyed")
	$Sprite.self_modulate = available_colors[randi() % available_colors.size()]

func _on_Block_area_entered(area):
	if area.has_method("destroy_block"):
		area.destroy_block(self)

func queue_free() -> void:
	#var block_size = $Sprite.texture.get_size()
	emit_signal("destroyed")
	if randi() % 100 <= powerup_drop_chance:
		var spawned_power_up = power_up_scene.instance()
		spawned_power_up.position = global_position
		spawned_power_up.position.x += 50 #block_size.x / 2
		get_tree().root.add_child(spawned_power_up)
	.queue_free()
