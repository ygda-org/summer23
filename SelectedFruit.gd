extends Panel

#var currentFruit
var numFruits = int(randf() * 5) + 10
var fruitList = ["Apple", "Banana", "Orange", "Milk"]
var curList = []
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.set_text("Shopping List" + "\n")
	newFruit() # Replace with function body.

#func getCurFruit():
	#return currentFruit 
	
func newFruit():
	for i in range(numFruits):
		var index = int(randf() * len(fruitList)) 
		curList.append(fruitList[index])
	for fruit in fruitList:
		var text = ""
		if(curList.count(fruit) > 0):	
			get_parent().set_anchor(MARGIN_BOTTOM, get_parent().anchor_bottom + 0.03)
			text = fruit + " x" + str(curList.count(fruit))
			$Label.set_text($Label.text + "\n" + text)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
