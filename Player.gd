extends KinematicBody2D 


export var speed = 150
var dead = false
var numFruits = 0
var velocity = Vector2.ZERO
var direction = 0
var inventory = {
	
}
func get_input():
	if(dead == false):
		if Input.is_action_pressed("a") || Input.is_action_pressed("ui_left"):
			velocity.y = 0
			velocity.x = -1
			$AnimatedSprite.play("walkLeft")
			direction = 3
		elif Input.is_action_pressed("d") || Input.is_action_pressed("ui_right"):
			velocity.y = 0
			velocity.x = 1
			$AnimatedSprite.play("walkRight")
			direction = 1
		elif Input.is_action_pressed("w") || Input.is_action_pressed("ui_up"):
			velocity.x = 0
			velocity.y = -1
			$AnimatedSprite.play("walkUp")
			direction = 0
		elif Input.is_action_pressed("s") || Input.is_action_pressed("ui_down"):
			velocity.x = 0
			velocity.y = 1
			$AnimatedSprite.play("walkDown")
			direction = 2
		elif(get_slide_count() > 0):
			velocity = Vector2.ZERO
			if(direction == 0):
				$AnimatedSprite.play("idleUp")
			if(direction == 1):
				$AnimatedSprite.play("idleRight")
			if(direction == 2):
				$AnimatedSprite.play("idleDown")
			if(direction == 3):
				$AnimatedSprite.play("idleLeft")
		velocity = velocity.normalized() * speed * (1 + numFruits/15.0)

func addFruit(name):
	var inventoryInterface = $Camera2D/CanvasLayer/Interface/HBoxContainer2/Inventory
	var shoppingList = find_node("Objective").getShoppingList()
	numFruits = numFruits + 1
	if !(name in inventory.keys()):
		inventory[name] = 1
		inventoryInterface.get_parent().set_size(inventoryInterface.get_parent().get_size() + Vector2(0, 17))
	else: 
		inventory[name] = inventory[name] + 1
	var text = ""
	for fruit in inventory:
		shoppingList = find_node("Objective").getShoppingList()
		if fruit in shoppingList:
			if(inventory[fruit] >= shoppingList[fruit]):
				text = text + fruit + " x" + str(inventory[fruit]) + " - !" + "\n"
			else:
				text = text + fruit + " x" + str(inventory[fruit]) + "\n"
		else:
			text = text + fruit + " x" + str(inventory[fruit]) + " - !" + "\n"
	
	inventoryInterface.find_node("Label").text = "Inventory" + "\n" + text

func dead():
	dead = true
	velocity = Vector2()
	$AnimatedSprite.queue_free()
	$CollisionShape2D.queue_free()
	$Timer.start()
	
func getInventory():
	return inventory
func getNumFruits():
	return numFruits
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)


func _on_Timer_timeout():
	get_tree().change_scene("res://Areas/World.tscn") # Replace with function body.
