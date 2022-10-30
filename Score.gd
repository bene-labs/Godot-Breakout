extends Node2D

var score = 0

func on_block_destroyed():
	score += 1
	$Label.text = "%04.d" % score
