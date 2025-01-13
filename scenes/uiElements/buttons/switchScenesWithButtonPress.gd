extends Button

export var newScene: PackedScene 

func _on_switchScenesWithButtonPress_pressed():
	var scenePath = newScene.resource_path
	print(scenePath)
	var instance = load(newScene.resource_path).instance()
	get_tree().current_scene.queue_free()
	get_tree().current_scene = instance
	get_tree().root.add_child(instance)
