extends Label

const playerName: String = "player"
var player
export var counter: String
var playerCounter: Dictionary

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

func checkCounter() -> void:
	if not counter:
		printerr("Counter is null!")
		print("A label needs a counter as a String to display the value of the counter!")
		return
	if not player:
		printerr("There is no player")
		return
	playerCounter = player.getCounter()
	if not counter in playerCounter:
		printerr(counter," is not in the PlayerCounter!")
		print(playerCounter, " are the availible Counters!")
		
func _ready() -> void:
	print("Initializing counterLabel...")
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 0.1
	timer.one_shot = true
	timer.connect("timeout", self, "_on_timer_timeout")
	timer.start()
	
func _on_timer_timeout() -> void:
	player = getPlayer()
	checkCounter()
	print("Label initialisation successfull")
func _process(delta:float) -> void:
	if not player:
		return
	var counterValue: int = playerCounter[counter]
	text = str(counter, ": ", str(counterValue))
