extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BananaHitBox_body_entered(body):
	if("Player" in body.name):# Replace with function body.
		var fruit = body.find_node("Objective").getCurFruit()
		if(fruit == get_parent().name):
			var ScoreText = body.find_node("ScoreText")
			ScoreText.increaseScore()
			body.find_node("Objective").newFruit()