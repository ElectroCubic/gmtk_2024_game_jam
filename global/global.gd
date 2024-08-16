extends Node

signal stat_change

var health: int = 100:
	set(value):
		health = value
		stat_change.emit()

var game_over: bool = false
