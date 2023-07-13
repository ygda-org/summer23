extends KinematicBody2D


export var speed = 200
var velocity = Vector2.ZERO

func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed("a"):
		velocity.x -= 1
		$AnimatedSprite.play("walkLeft")
	elif Input.is_action_pressed("d"):
		velocity.x += 1
		$AnimatedSprite.play("walkRight")
	elif Input.is_action_pressed("w"):
		velocity.y -= 1
		$AnimatedSprite.play("walkUp")
	elif Input.is_action_pressed("s"):
		velocity.y += 1
		$AnimatedSprite.play("walkDown")
	else:
		$AnimatedSprite.play("idle")
	velocity = velocity.normalized() * speed
	
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
