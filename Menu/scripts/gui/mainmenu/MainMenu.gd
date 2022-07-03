extends Control

# Labels
onready var select1 = get_node("Margin/HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer/Label")
onready var select2 = get_node("Margin/HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer/Label2")
onready var select3 = get_node("Margin/HBoxContainer/VBoxContainer/HBoxContainer/VBoxContainer/Label3")

# Buttons
onready var startbutton = get_node("Margin/HBoxContainer/VBoxContainer/HBoxContainer/ButtonsContainer/StartButton")
onready var settingsbutton = get_node("Margin/HBoxContainer/VBoxContainer/HBoxContainer/ButtonsContainer/SettingsButton")
onready var exitbutton = get_node("Margin/HBoxContainer/VBoxContainer/HBoxContainer/ButtonsContainer/ExitButton")

# Control
onready var control = get_node("Margin/HBoxContainer/VBoxContainer/Control")
onready var menu = get_node("Margin/HBoxContainer/VBoxContainer/HBoxContainer")
onready var back = get_node("Margin/HBoxContainer/VBoxContainer/VBoxContainer")

var current_selection = 0
var nevel1 = 'res://scenes/nevels/nevel1.tscn'

func _ready():
	MusicController.play_msuic()
	set_current_selection(0)

func _process(_delta):
	# Select with arrows
	if Input.is_action_just_pressed("ui_down") and current_selection < 2:
		current_selection += 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_up") and current_selection > 0:
		current_selection -= 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_accept"):
		handle_selection(current_selection)

	# Select Color
	if current_selection == 0:
		startbutton.add_color_override("font_color", Color(0, 0, 255, 1))
		settingsbutton.add_color_override("font_color", Color(255, 255, 255, 1))
		exitbutton.add_color_override("font_color", Color(255, 255, 255, 1))
	elif current_selection == 1:
		settingsbutton.add_color_override("font_color", Color(0, 0, 255, 1))
		startbutton.add_color_override("font_color", Color(255, 255, 255, 1))
		exitbutton.add_color_override("font_color", Color(255, 255, 255, 1))
	elif current_selection == 2:
		exitbutton.add_color_override("font_color", Color(255, 0, 0, 1))
		startbutton.add_color_override("font_color", Color(255, 255, 255, 1))
		settingsbutton.add_color_override("font_color", Color(255, 255, 255, 1))

	# Select with cursor
	if startbutton.is_hovered() == true:
		current_selection = 0
		set_current_selection(current_selection)
	elif settingsbutton.is_hovered() == true:
		current_selection = 1
		set_current_selection(current_selection)
	elif exitbutton.is_hovered() == true:
		current_selection = 2
		set_current_selection(current_selection)

# Execute funcions with selected
func handle_selection(_current_selection):
	if _current_selection == 0:
		_on_StartButton_pressed()
	elif _current_selection == 1:
		_on_SettingsButton_pressed()
	elif _current_selection == 2:
		_on_ExitButton_pressed()

# Arrow select
func set_current_selection(_current_selection):
	select1.text = ''
	select2.text = ''
	select3.text = ''
	if current_selection == 0:
		select1.text = '<'
	elif current_selection == 1:
		select2.text = '<'
	elif current_selection == 2:
		select3.text = '<'

# Pressed Button Funcion
func _on_StartButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene(nevel1)

func _on_SettingsButton_pressed():
	control.visible = !control.visible
	menu.visible = !menu.visible
	back.visible = !back.visible

func _on_ExitButton_pressed():
	get_tree().quit()

func _on_BackButton_pressed():
	control.visible = !control.visible
	menu.visible = !menu.visible
	back.visible = !back.visible
