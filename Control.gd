extends Control

export (Array, NodePath) var scenes
var stages:Array
var buttons:Array
const buttonPath: String = "res://changeVariable.tscn"

func _ready():
	for i in range(len(scenes)):
		stages.append(get_node(scenes[i])) 
	print(stages)
	createButtons()
	
func createButtons() -> void:
	for i in range(len(stages)):
		var button_scene = preload(buttonPath)
		var button = button_scene.instance()
		button.rect_position = Vector2(25+220*i, 0)
		button.text = "Stage"+str(i+1)
		button.boolValue = false
		button.variableName = "counter"+str(i)
		buttons.append(button)
		add_child(button)
	print(buttons)
	for i in buttons:
		print(i.rect_position)
