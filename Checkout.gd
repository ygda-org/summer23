extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player 
var inRange = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Control.visible = false # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if "Player" in body.name:
		player = body # Replace with function body.
		inRange = true
		find_node("Control").visible = true


func _on_Area2D_body_exited(body):
	inRange = false	
	find_node("Control").visible = false# Replace with function body.
