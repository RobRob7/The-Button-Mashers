extends KinematicBody2D

var speed : int = 200
var gravity : int = 800
var velocity : Vector2 = Vector2()

var direction : int = 1

func _physics_process(delta) -> void:
	
	velocity.y += gravity * delta
	
	velocity.x = speed * direction
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	check_if_still_on_platform()

func check_if_still_on_platform():
	if(not $RayCastLeft.is_colliding() && is_on_floor()):
		direction = 1
		$Angery.flip_h = true
	if(not $RayCastRight.is_colliding() && is_on_floor()):
		direction = -1
		$Angery.flip_h = false

func _on_hitbox_body_entered(body):
	if body.get_name() == "Player" && is_on_floor():
		body.respawn()
	if body.is_in_group("wall"):
		direction = -direction
