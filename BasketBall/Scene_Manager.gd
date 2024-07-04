extends Node2D

var Ball = preload("res://Objects/Ball.tscn")

var B_Ball_Force = Vector2(400, 0)
var B_Ball_Ang : float = 0
var Pivot_Position = Vector2(0,0)


var turn = 0 

var Player_1_Score = 0 
var Player_2_Score = 0 

signal Switch_Shirts


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func Switch():
	emit_signal("Switch_Shirts")
	if turn == 1: 
		turn = 2
	else: 
		turn = 1


func _on_shooter_shoot(Rot, Pos):
	B_Ball_Ang = Rot 
	Pivot_Position = Pos
	var ball_instance = Ball.instantiate()
	ball_instance.global_position = Pivot_Position
	ball_instance.rotation = B_Ball_Ang
	ball_instance.initial_velocity = B_Ball_Force.rotated(B_Ball_Ang)
	add_child(ball_instance)


func _on_basket_ball_net_score():
	if turn == 1: 
		Player_1_Score += 2
		get_node("UI/Player_1_Score").text = "Player1: " + str(Player_1_Score)
	else: 
		Player_2_Score += 2
		get_node("UI/Player_2_Score").text = "Player2: " + str(Player_2_Score)
	pass # Replace with function body.

