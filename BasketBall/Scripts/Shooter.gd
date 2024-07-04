extends CharacterBody2D

var Speed : int = 325 
var Jump_Force : int = 600 
var Gravity : int = 1800
var Jumping : bool = false

var Ball_Created : bool = false

var Blue_Shirt = preload("res://Sprites/Shooter_Blue.png")
var Red_Shirt = preload("res://Sprites/Shooter_Red.png") 


signal shoot 
signal shot_done



func _physics_process(delta):
	
	velocity.x = 0 
	
	if Input.is_key_pressed(KEY_A):
		velocity.x -= Speed
	
	if Input.is_key_pressed(KEY_D):
		velocity.x += Speed
	
	if Input.is_key_pressed(KEY_SPACE):
		if Jumping == false:
			Jumping = true
			velocity.y =- Jump_Force
	
	move_and_slide()
	velocity.y += Gravity * delta
	
	if is_on_floor() == true and Jumping == true:
		Jumping = false
		
	if Input.is_key_pressed(KEY_B):
		if Ball_Created == false: 
			Ball_Created = true
			
			emit_signal("shoot", get_node("Ball_Sprite/Pivot").rotation, get_node("Ball_Sprite/Pivot").global_position)
			get_node("Ball_Sprite").visible = false
			
			await get_tree().create_timer(5).timeout
			get_parent().Switch()
			
			
			Ball_Created = false
			get_node("Ball_Sprite").visible = true
	
	if Input.is_key_pressed(KEY_Q):
		get_node("Ball_Sprite/Pivot").rotation -= 0.15
	if Input.is_key_pressed(KEY_E):
		get_node("Ball_Sprite/Pivot").rotation += 0.15
	pass
	


func _on_main_switch_shirts():
	if $Sprite2D.texture == Blue_Shirt:
		$Sprite2D.texture = Red_Shirt
	else:
		$Sprite2D.texture = Blue_Shirt
	pass # Replace with function body.
