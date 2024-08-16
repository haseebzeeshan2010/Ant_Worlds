extends RigidBody2D
@export var max_speed = 230.0
var dir = true
var food = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	get_node("Node2D3/Node2D/AnimationPlayer").set_speed_scale((sqrt(get_linear_velocity().x**2 + get_linear_velocity().y**2)/21))
	
	
	if len(%Floor3.get_overlapping_bodies()) >=1:
		apply_central_force(global_transform.y*1200)
		
	else:
		rotation = lerp_angle(rotation,rotation*0, delta*10)

	if dir == true:
		apply_central_force(global_transform.x*700)
		if %Node2D3.transform.x.x < 0.15:
			%Node2D3.transform.x.x += 2*delta
			
		else:
			%Node2D3.transform.x.x = 0.15
	elif dir == false:
		apply_central_force(global_transform.x*-700)
		if %Node2D3.transform.x.x > -0.14:
			%Node2D3.transform.x.x -= 2*delta
		else:
			%Node2D3.transform.x.x = -0.15


	pass
	
func _integrate_forces(state):
	if state.linear_velocity.length()>max_speed:
		state.linear_velocity=state.linear_velocity.normalized()*max_speed


func _on_timer_timeout():

	if randf() >0.5:
		dir = true
	else:
		dir = false
	pass # Replace with function body.


func _on_area_2d_body_entered(body):
	%Essen.visible = true
	print("seen")
	if global_position.x < 3930:
		dir = true
	elif global_position.x > 3930:
		dir = false
	pass # Replace with function body.
