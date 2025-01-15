extends Control

export (Array, NodePath) var scenes
var stages:Array
var buttons:Array
const buttonPath: String = "res://changeVisibility.tscn"

func _ready():
	for i in range(len(scenes)):
		stages.append(get_node(scenes[i])) 
	createButtons()
	
func createButtons() -> void:
	for i in range(len(stages)):
		var button_scene = preload(buttonPath)
		var button = button_scene.instance()
		button.rect_position = Vector2(25+220*i, 0)
		button.text = "Stage"+str(i+1)
		button.stages = stages
		button.assignedStage = stages[i]
		buttons.append(button)
		add_child(button)
