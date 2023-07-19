extends Control

var world = preload("res://Areas/World.tscn").instance()

func _on_Button_pressed():
	hide()
	get_tree().root.add_child(world)

