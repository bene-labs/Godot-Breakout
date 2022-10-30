extends Node2D

onready var board = get_tree().root.get_child(0).find_node("BlockBoard")
onready var ball = get_tree().root.get_child(0).find_node("RetroBall")

export var level_configs = [{"rows": 3, "colums": 5, "ball_speed_increase": 25}, \
{"rows": 3, "colums": 6, "ball_speed_increase": 35}, \
{"rows": 4, "colums": 6, "ball_speed_increase": 50},\
{"rows": 4, "colums": 7, "ball_speed_increase": 58},\
{"rows": 5, "colums": 7, "ball_speed_increase": 64},\
{"rows": 5, "colums": 8, "ball_speed_increase": 70},\
{"rows": 6, "colums": 8, "ball_speed_increase": 74},\
{"rows": 6, "colums": 9, "ball_speed_increase": 78},\
{"rows": 6, "colums": 10, "ball_speed_increase": 83},\
{"rows": 7, "colums": 10, "ball_speed_increase": 92},\
{"rows": 8, "colums": 10, "ball_speed_increase": 101}]
var level = 0

func _on_BlockBoard_empty():	
	level += 1
	$LevelLabel.text = "Level " + str(level + 1)
	if level > level_configs.size():
			ball.add_speed(level_configs[-1]["ball_speed_increase"])
	else:
		board.set_dimension(level_configs[level]["colums"], level_configs[level]["rows"])
		ball.add_speed(level_configs[level]["ball_speed_increase"])
	board.fill()
