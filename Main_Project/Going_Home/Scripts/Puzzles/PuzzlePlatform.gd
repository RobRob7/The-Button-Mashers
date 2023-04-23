extends Node2D



# checks to see if player collides with disappearing platform only when on the surface of it
func _on_Area2D_body_entered(body):
	if(body.get_name() == "Player" and body.is_on_floor()):
		# deletes platform
		queue_free()
