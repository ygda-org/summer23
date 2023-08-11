extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var inreach = false
var player
var fruitName 
# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().find_node("Control").visible = false
	fruitName = get_parent().name
	var i = len(fruitName) - 1
	while(fruitName[i] in "1234567890"):
		fruitName = fruitName.substr(0, i)
		i = i - 1
	get_parent().find_node("Name").set_text(fruitName)
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	if(inreach == true && Input.is_action_just_pressed("e") && !"Empty" in get_parent().name):
		player.addFruit(fruitName)


func _on_BananaHitBox_body_entered(body):
	if("Player" in body.name):# Replace with function body.
		player = body
		if(!"Empty" in get_parent().name):
			get_parent().find_node("Control").visible = true
			inreach = true

func _on_BananaHitBox_body_exited(body):
	if("Player" in body.name):
		get_parent().find_node("Control").visible = false
		inreach = false # Replace with function body.
