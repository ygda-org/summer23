extends KinematicBody2D


export var speed = 200
var velocity = Vector2.ZERO
var direction = 0

func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed("a"):
		velocity.x -= 1
		$AnimatedSprite.play("walkLeft")
		direction = 3
	elif Input.is_action_pressed("d"):
		velocity.x += 1
		$AnimatedSprite.play("walkRight")
		direction = 1
	elif Input.is_action_pressed("w"):
		velocity.y -= 1
		$AnimatedSprite.play("walkUp")
		direction = 0
	elif Input.is_action_pressed("s"):
		velocity.y += 1
		$AnimatedSprite.play("walkDown")
		direction = 2
	else:
		if(direction == 0):
			$AnimatedSprite.play("idleUp")
		if(direction == 1):
			$AnimatedSprite.play("idleRight")
		if(direction == 2):
			$AnimatedSprite.play("idleDown")
		if(direction == 3):
			$AnimatedSprite.play("idleLeft")
	velocity = velocity.normalized() * speed
	
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
