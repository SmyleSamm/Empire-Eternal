extends Button

export var newScene: PackedScene

func _on_switchScenesWithButtonPress_pressed():
	# Ensure the new scene is loaded
	if not newScene:
		printerr("Error: newScene is not set!")
		return
	
	# Instance the new scene
	var instance = newScene.instance()
	
	# Get the current scene
	var current_scene = get_tree().current_scene
	
	# Add the new scene as a child of the root
	get_tree().root.add_child(instance)
	
	# Set the new scene as current AFTER adding it to the tree
	get_tree().current_scene = instance
	
	# Free the old scene after the new one is added
	if current_scene:
		current_scene.queue_free()
