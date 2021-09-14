extends KinematicBody2D

const MOVE_SPEED = 15
var move_dir = 0


func _physics_process(delta): #FPS
	
	if Input.is_action_pressed("right"):
		
		$ninjaJubileu.animation = "Correndo"
		$ninjaJubileu.flip_h = false
		move_dir += 1
	
	elif Input.is_action_pressed("left"):
		
		$ninjaJubileu.animation = "Correndo"
		$ninjaJubileu.flip_h = true
		move_dir -= 1
	else:
		$ninjaJubileu.animation ="Respirando"
		move_dir = 0
		
	move_and_slide(Vector2(move_dir * MOVE_SPEED, 0), Vector2(0,-1))
