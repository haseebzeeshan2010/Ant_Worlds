extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if len(%Floor3.get_overlapping_bodies()) >1:
		print("hs")
	apply_central_force(global_transform.y*800)
	
	pass
