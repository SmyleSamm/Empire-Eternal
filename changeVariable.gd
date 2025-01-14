extends Button

export var intValue: int
export var boolValue: bool
export var variableName: String
var player: Node
const playerName = "player"
var playerStages

func getPlayer() -> Node:
	var currentScene = get_tree().current_scene
	var children = currentScene.get_children()
	for n in children:
		if n.name == playerName:
			return n
	printerr("The player node was unable to be located!")
	print("I am ",name)
	print("Check if the node is named", playerName, "or is not in another Node")
	print("e.g. SceneNode -> someNode, someNode, player, someNode")
	return null

func _ready() -> void:
	player = getPlayer()
	playerStages = player.counter
	
func _on_changeVariable_pressed():
	if not variableName in playerStages:
		printerr(variableName," does not exist in Playerstages!")
		print(playerStages)
		return
	for i in playerStages:
		if i == variableName:
			pass

func getCurrentValue():
	if intValue:
		return intValue
	else:
		return boolValue
