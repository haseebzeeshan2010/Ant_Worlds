extends Sprite2D
var change = false
var alph = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	print(change)
	if change == true:
		alph += 5*delta
	else:
		print("WHY")
		alph -= 5*delta
		
	if alph < 0:
		alph = 0
	if alph > 1:
		alph = 1	
	set_self_modulate(Color(1,1,1,alph))


func _on_hole_enter_body_entered(body):
	change = true
	pass # Replace with function body.


func _on_hole_enter_body_exited(body):
	change = false
	pass # Replace with function body.
