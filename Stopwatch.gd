extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var time = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func _process(delta):
	time += delta
	var minutes = int(time/60) 
	var seconds = stepify(time - minutes*60, 0.01)
	var strTime = str(minutes)
	if(minutes > 0 && int(seconds/10)%10 == 0):
		strTime	+= ":0" + str(seconds)
	else:
		strTime += ":" + str(seconds)
	set_text(strTime)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
