extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var SPEED = 300
var velocity = Vector2()
var direction 
var moving = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	randomize()
	direction = int(randf() * 4)
	if(moving == false):
		if(direction == 1):
			$Sprite.frame = 0 #right
		if(direction == 3):
			$Sprite.frame = 4 #left
		if(direction == 2):
			$Sprite.frame = 12 #Down
		if(direction == 0):
			$Sprite.frame = 8  #Up

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if(moving == true):
		if(direction == 1):
			$AnimationPlayer.play("rollRight")
			velocity = move_and_slide(Vector2(SPEED, 0))
		if(direction == 3):
			$AnimationPlayer.play("rollLeft")
			velocity = move_and_slide(Vector2(-SPEED, 0))
		if(direction == 2):
			$AnimationPlayer.play("rollDown")
			velocity = move_and_slide(Vector2(0, SPEED))
		if(direction == 0):
			$AnimationPlayer.play("rollUp")
			velocity = move_and_slide(Vector2(0, -SPEED))
		if(get_slide_count() > 0):
			for i in get_slide_count():
				if("Player" in get_slide_collision(i).collider.name):
					get_slide_collision(i).collider.dead()
				#elif(!"ShoppingCart" in get_slide_collision(i).collider.name):
				else:
					queue_free()
#	pass
func setSpeed(speed):
	SPEED = speed
func getSpeed():
	return SPEED
func _on_Timer_timeout():
	moving = true # Replace with function body.
