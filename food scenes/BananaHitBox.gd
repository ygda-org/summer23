extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var inreach = false
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().find_node("Panel").visible = false
	get_parent().find_node("Name").set_text(get_parent().name)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	if(inreach == true && Input.is_action_just_pressed("e") && !"Empty" in get_parent().name):
		player.addFruit(get_parent().name)


func _on_BananaHitBox_body_entered(body):
	if("Player" in body.name):# Replace with function body.
		player = body
		if(!"Empty" in get_parent().name):
			get_parent().find_node("Panel").visible = true
			inreach = true

func _on_BananaHitBox_body_exited(body):
	if("Player" in body.name):
		get_parent().find_node("Panel").visible = false
		inreach = false # Replace with function body.
