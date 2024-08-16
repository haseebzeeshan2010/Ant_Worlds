extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var impulse_strength = 100
	var angle = %MeshInstance2D2.rotation
	apply_central_force(%MeshInstance2D2.global_transform.y*8)

	%MeshInstance2D.position = -%NEWPHYSIC.get_collision_normal()*100
	%MeshInstance2D2.look_at(%MeshInstance2D.global_position)
	%NEWPHYSIC.target_position = %MeshInstance2D.global_position
	
	apply_central_force(Vector2(cos(angle), sin(angle)) * impulse_strength)
	pass
