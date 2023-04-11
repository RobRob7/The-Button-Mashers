extends KinematicBody2D

var distFromPlay : int = 0
var inView : bool = false
var shootCoolDown : int = 90
var coolDone : bool = false
var velocity : Vector2 = Vector2()
onready var sprite : Sprite = $InActive

func _ready():
	
	$Active.hide()
	velocity.x = 0
	velocity.y = 0

func _physics_process(_delta):

	coolDone = false
	
	distFromPlay = getPlayDist()
	if distFromPlay <= 300:
		inView = true
	else:
		inView = false
		
	if shootCoolDown < 0:
		coolDone = true
	
	if coolDone:
		rangedAttack()
		shootCoolDown = 90
	
	shootCoolDown -= 1
	


func rangedAttack():
	
	var projectile = get_parent().get_node("Projectile")
	var player = get_parent().get_node("Player")
	
	projectile.position = projectile.initPos
	
	var direction = (player.position - self.position).normalized()
	
	projectile.launch(Vector2(1,0).normalized())
	
	

func getPlayDist():
	
	var enemyX : float = self.get_position().x
	var enemyY : float = self.get_position().y
	var playX : float = get_parent().get_node("Player").get_position().x
	var playY : float = get_parent().get_node("Player").get_position().y
	
	var xDiff : float = enemyX - playX
	var yDiff : float = enemyY - playY
	
	return sqrt(( xDiff * xDiff) + ( yDiff * yDiff ))
