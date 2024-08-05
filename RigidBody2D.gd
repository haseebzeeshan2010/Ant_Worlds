extends RigidBody2D

var dir = true
@export var max_speed = 230.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	%PathFollow2D.progress += 120*delta 
	%ant_AI.global_position = %PathFollow2D.global_position
	%ant_AI.global_rotation = lerp(%ant_AI.global_rotation, %PathFollow2D.global_rotation, delta)
	
	%local_mouse_pos.look_at(get_global_mouse_position())
	
	
	if len(%Floor.get_overlapping_bodies()) >1:
		apply_central_force(global_transform.y*800)
		
		var direction = Input.get_axis("ui_left", "ui_right")
		if direction == 1:
			apply_central_force(global_transform.x*700)
			#%RayCast2D.set_target_position(Vector2(85.845,150))
			dir = true
		
		elif direction == -1:
			apply_central_force(global_transform.x*-700)
			#%RayCast2D.set_target_position(Vector2(-85.845,150))
			dir = false
			
		
			
	else:

		rotation = lerp_angle(rotation,rotation*0, delta*10)

	get_node("Node2D/Node2D/AnimationPlayer").set_speed_scale((sqrt(get_linear_velocity().x**2 + get_linear_velocity().y**2)/21))
	if dir == true:
		if %Node2D.transform.x.x < 0.15:
			%Node2D.transform.x.x += 2*delta
		else:
			%Node2D.transform.x.x = 0.15
	elif dir == false:
		if %Node2D.transform.x.x > -0.14:
			%Node2D.transform.x.x -= 2*delta
		else:
			%Node2D.transform.x.x = -0.15
		
		
		
		
		
	pass
	
#Keep Speed Under a Max Value
func _integrate_forces(state):
	if state.linear_velocity.length()>max_speed:
		state.linear_velocity=state.linear_velocity.normalized()*max_speed
