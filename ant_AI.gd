extends PathFollow2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	progress_ratio +=0.045*delta 
	get_child(0).global_position = lerp(get_child(0).global_position, global_position, delta*10)
	get_child(0).global_rotation = lerp(get_child(0).global_rotation, global_rotation, delta*5)
	
	pass
