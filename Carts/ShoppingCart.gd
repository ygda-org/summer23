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
	direction = int(randf() * 2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if(moving == true):
		if(direction == 1):
			$AnimationPlayer.play("rollRight")
			velocity = move_and_slide(Vector2(SPEED, 0))
		if(direction == 0):
			$AnimationPlayer.play("rollLeft")
			velocity = move_and_slide(Vector2(-SPEED, 0))
		if(get_slide_count() > 0):
			for i in get_slide_count():
				if("Player" in get_slide_collision(i).collider.name):
					get_slide_collision(i).collider.dead()
				elif(!"ShoppingCart" in get_slide_collision(i).collider.name):
					queue_free()
#	pass


func _on_Timer_timeout():
	moving = true # Replace with function body.
