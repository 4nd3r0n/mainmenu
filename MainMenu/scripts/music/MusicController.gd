extends Node

var titlemusic = load("res://assets/music/mainmenu/Tittle.wav")

func _ready():
	pass
	
func play_msuic():
	$Music.stream = titlemusic
	$Music.play()
