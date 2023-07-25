extends Panel

#var currentFruit
var numFruits = int(randf() * 20) + 10
var fruitList = ["Apple", "Banana", "Orange", "Milk"]
var curDict = {}
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$Label.set_text("Shopping List" + "\n")
	newFruit() # Replace with function body.

#func getCurFruit():
	#return currentFruit 
	
func newFruit():
	for i in range(numFruits):
		var index = int(randf() * len(fruitList)) 
		if(!fruitList[index] in curDict.keys()):
			curDict[fruitList[index]] = 1
		else:
			curDict[fruitList[index]] = curDict[fruitList[index]] + 1
	for fruit in curDict:
		var text = ""
		get_parent().set_anchor(MARGIN_BOTTOM, get_parent().anchor_bottom + 0.03)
		text = fruit + " x" + str(curDict[fruit])
		$Label.set_text($Label.text + "\n" + text)
		
func getShoppingList():
	return curDict
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
