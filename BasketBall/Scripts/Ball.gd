extends CharacterBody2D

var power = 1.3
var initial_velocity = Vector2()
var gravity = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = initial_velocity * power
	await get_tree().create_timer(5).timeout
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.y += gravity * delta
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())

	move_and_slide()
