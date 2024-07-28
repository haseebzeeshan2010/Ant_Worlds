extends RigidBody2D

var dir = true
@export var max_speed = 400.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	apply_central_force(global_transform.y*5000)
	
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction == 1:
		apply_central_force(global_transform.x*800)
		#%RayCast2D.set_target_position(Vector2(85.845,150))
		dir = true
	
	elif direction == -1:
		apply_central_force(global_transform.x*-800)
		#%RayCast2D.set_target_position(Vector2(-85.845,150))
		dir = false
	#else:
		#%RayCast2D.set_target_position(Vector2(-20,100))
	#print(sqrt(get_linear_velocity().x**2 + get_linear_velocity().y**2)/35)
	#print(get_node("Node2D/Node2D/AnimationPlayer").get_speed_scale())
	
	if dir == true:
		get_node("Node2D/Node2D/AnimationPlayer").set_speed_scale((sqrt(get_linear_velocity().x**2 + get_linear_velocity().y**2)/35))
	elif dir == false:
		get_node("Node2D/Node2D/AnimationPlayer").set_speed_scale((sqrt(get_linear_velocity().x**2 + get_linear_velocity().y**2)/35)*-1)
	#if (%RayCast2D.get_collision_normal() != Vector2(0,0)):
		#%MeshInstance2D.position = global_position+(%RayCast2D.get_collision_normal()*100)
		##print(%RayCast2D.get_collision_normal()*100)
		#%Marker2D.look_at(%MeshInstance2D.global_position)
		#%Node2D.rotation = lerp_angle(%Node2D.rotation, %Marker2D.rotation, delta/2)
	
	pass
	
#Keep Speed Under a Max Value
func _integrate_forces(state):
	if state.linear_velocity.length()>max_speed:
		state.linear_velocity=state.linear_velocity.normalized()*max_speed
