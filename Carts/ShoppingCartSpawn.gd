extends Node2D

var ShoppingCart = preload("res://Carts/ShoppingCart.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = randf() * 4 
	$Timer.start() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	var speed = get_parent().get_parent().get_parent().find_node("Player").getNumFruits()
	$Timer.wait_time = randf() * (3 - speed/(speed + 10.0)*3) + 1
	var shoppingCart = ShoppingCart.instance()
	if(abs((get_parent().get_parent().get_parent().find_node("Player").position - position).x) >= 50 && abs((get_parent().get_parent().get_parent().find_node("Player").position - position).y) >= 50):
		shoppingCart.setSpeed((0.5 + speed/15.0) * shoppingCart.getSpeed())
		shoppingCart.set_position(get_position())
		get_parent().add_child(shoppingCart)
	set_position( Vector2(randf() * get_parent().rect_size.x, randf() * get_parent().rect_size.y))
	#shoppingCart.position = position
	
	# Replace with function body.
	
