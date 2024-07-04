extends CharacterBody2D

var Speed : int = 250
var Jump_Force : int = 850 
var Gravity : int = 1800
var Jumping : bool = false

var Blue_Shirt = preload("res://Sprites/Blocker_Blue.png")
var Red_Shirt = preload("res://Sprites/Blocker_Red.png") 

func _physics_process(delta):
	
	velocity.x = 0 
	
	if Input.is_key_pressed(KEY_LEFT):
		velocity.x -= Speed
	
	if Input.is_key_pressed(KEY_RIGHT):
		velocity.x += Speed
	
	if Input.is_key_pressed(KEY_ENTER):
		if Jumping == false:
			Jumping = true
			velocity.y =- Jump_Force
	
	move_and_slide()
	velocity.y += Gravity * delta
	
	if is_on_floor() == true and Jumping == true:
		Jumping = false
		
	
func _on_main_switch_shirts():
	if $Sprite2D.texture == Blue_Shirt:
		$Sprite2D.texture = Red_Shirt
	else:
		$Sprite2D.texture = Blue_Shirt
	pass # Replace with function body.

