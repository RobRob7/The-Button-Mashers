extends Node2D

# function checks collision with player, if so respawns player
func _on_Area2D_body_entered(body):
		if body.get_name() == "Player":
			body.respawn()
