extends Node2D

var ShoppingCart = preload("res://Carts/ShoppingCart.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = randf() * 4 + 2
	$Timer.start() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	$Timer.wait_time = randf() * 4 + 2
	var shoppingCart = ShoppingCart.instance()
	shoppingCart.set_position(get_position())
	get_parent().add_child(shoppingCart)
	set_position( Vector2(randf() * get_parent().rect_size.x, randf() * get_parent().rect_size.y))
	#shoppingCart.position = position

	# Replace with function body.
