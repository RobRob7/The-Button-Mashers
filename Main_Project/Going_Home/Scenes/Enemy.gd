extends KinematicBody2D

var speed : int = 200
var gravity : int = 800

var velocity : Vector2 = Vector2()

onready var sprite : Sprite = get_node("Angery")

func _physics_process(delta):
	
	if sprite.flip_h == true:
		velocity.x = -0.001
	else:
		velocity.x = 0.001
	
	if sprite.flip_h == true:
		velocity.x -= speed
	elif sprite.flip_h == false:
		velocity.x += speed
	
	velocity = velocity.normalized() * speed
	
	var collide = move_and_collide(velocity * delta)
	if collide:
		if sprite.flip_h == true:
			sprite.flip_h = false
		else:
			sprite.flip_h = true
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	velocity.y += gravity * delta
	
	if velocity.x < 0:
		sprite.flip_h = true
	elif velocity.x > 0:
		sprite.flip_h = false
	


func _on_hitbox_body_entered(body):
	if body.get_name() == "Player":
		body.respawn()
