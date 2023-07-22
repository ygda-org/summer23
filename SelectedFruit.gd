extends Panel

var currentFruit
var fruitList = ["Apple", "Banana", "Orange", "Milk"]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	newFruit() # Replace with function body.

func getCurFruit():
	return currentFruit 
	
func newFruit():
	var index = int(randf() * len(fruitList)) 
	currentFruit = fruitList[index]
	$Label.set_text("Obtain: " + currentFruit)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
