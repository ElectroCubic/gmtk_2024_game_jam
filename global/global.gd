extends Node

signal stat_change

var tyre_health: int = 100:
	set(value):
		tyre_health = value
		stat_change.emit()

var game_over: bool = false
