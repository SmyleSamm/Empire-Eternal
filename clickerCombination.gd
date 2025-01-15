extends Control

const playerName = "player"
var player
export var counter: String
export var value: int
export var upgradeCost: int
var valueChanged: bool = true
const clickerText: String = "Click me!\nYou will gain\n+"
var playerCounter: Dictionary
onready var clickerForCounter = $HBoxContainer/clickerForCounter
onready var upgradeButton = $HBoxContainer/upgradeButton
var upgrades: int = 1

func _ready():
	print("Initializing clickerButton...")
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 0.1
	timer.one_shot = true
	timer.connect("timeout", self, "_on_timer_timeout")
	timer.start()

func _on_timer_timeout():
	player = getPlayer()
	var faulty: bool = false
	if not player:
		printerr("Player is null!")
		print("A clicker Button needs to be assigned a Player!")
		faulty = true
	if not counter:
		printerr("Counter is null!")
		print("A clicker needs a counter as a String to change the value of the counter!")
		faulty = true
	if not value:
		printerr("Value is null!")
		print("A clicker needs a value to change it accordingly")
		faulty = true
	if faulty:
		printerr("There are one or more errors during compilation in a clicker Button!")
		return
	playerCounter = player.getCounter()
	if not playerCounter:
		printerr("There is no Dictionary recieved from the Player!")
		print("Please check if the Player has a counter Dictionary!")
	else:
		if not counter in playerCounter:
			printerr(counter," is not in the PlayerCounter!")
			print(playerCounter)
			faulty = true
	if faulty:
		printerr("Something whent wrong in the last part of the initialisation of the clicker Button!")
		return
	else:
		print("Clicker initialisation successfull!")
		
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

func increaseValue(increasement: int) -> void:
	value += increasement
	valueChanged=true
	
func _process(delta):
	if valueChanged:
		clickerForCounter.text = clickerText+str(value)
		upgradeButton.text = getUpgradeText()
		valueChanged=false

func _on_upgradeButton_pressed():
	if playerCounter[counter] >= upgradeCost:
		player.addCount(counter, -upgradeCost)
		increaseValue(10)
		upgrades+=1
		upgradeCost = upgradeCost * upgrades
		
func _on_clickerForCounter_pressed():
	playerCounter[counter] += value

func getUpgradeText() -> String:
	var first = "Cost:\n"
	var second = "\nGain:\n"
	return first+str(upgradeCost)+second+str(10)
