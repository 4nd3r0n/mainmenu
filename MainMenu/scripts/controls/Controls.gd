extends Control

onready var extlabel = get_node("ExitLabel")
onready var extimer = get_node("ExitTimer")

func _ready():
	extlabel.text = ''
	
# Exit with End Button
func _input(event):
	if event.is_action_pressed("ui_end"):
		extimer.start()
		extlabel.text = 'Exit'
	elif event.is_action_released("ui_end"):
		extimer.stop()
		extlabel.text = ''
		
	if event.is_action_pressed("ui_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen

func _on_ExitTimer_timeout():
	get_tree().quit()
