extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#rotation = lerp_angle(rotation, %Player.rotation, delta*2)
	global_position = lerp(global_position, %Player.global_position, delta*10) #smooth out camera
	pass
