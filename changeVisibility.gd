extends Button

var stages
var assignedStage

func _on_changeVariable_pressed():
	for i in stages:
		if i == assignedStage:
			i.visible = true
			print("show ",i)
		else:
			i.visible = false
			print("hide ",i)
