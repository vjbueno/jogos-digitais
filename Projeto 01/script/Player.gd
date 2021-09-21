extends KinematicBody2D


const MOVE_SPEED = 25 #velocidade de movimento
var move_dir = 0

const JUMP_FORCE = 1100 #força do pulo
const GRAVITY = 50 #gravidade
const MAX_FALL_SPEED = 500 #velocidade máxima de queda do personagem após o pulo

var y_velo = 0 #velocidade minima

func _physics_process(delta): #FPS
	
	var grounded = is_on_floor();
	var no_chao = $RayD.is_colliding() or $RayE.is_colliding()
	
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
		
	if grounded and Input.is_action_just_pressed("jump"):
		y_velo = -JUMP_FORCE
		$ninjaJubileu.animation = "jump"
		
	move_and_slide(Vector2(move_dir * MOVE_SPEED, y_velo), Vector2(0,-1))
	
	y_velo += GRAVITY
	
	if grounded and y_velo >= 0 :
		y_velo = 5
		
	if y_velo > MAX_FALL_SPEED:
		y_velo = MAX_FALL_SPEED
