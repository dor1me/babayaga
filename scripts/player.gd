extends CharacterBody2D
class_name Player

var H_SPEED =  G.player_speed
var V_SPEED = G.player_speed
var F_SPEED = G.player_speed
var JUMP_VELOCITY = G.jump_velocity
var health = G.player_hp
var attack = G.player_attack
var scream_attack = 25
var status =  G.player_status
var x = G.player_posx

var end_dialog = false

#var y = G.player
@onready var shape = $shell_collider
@onready var zindex = $AnimatedSprite2D
@onready var _animated_sprite = $AnimatedSprite2D
@onready var camera = $Camera2D
@onready var cleaner_label = $CleanerHP
@onready var jumping = $jumping
@onready var flying_sound = $flying
@onready var soft_hit = $soft_hit
@onready var attack_collider_right = $attack_collider_right
@onready var attack_collider_left = $attack_collider_left
@onready var attack_timer = $AttackTimer



var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") * 1.5

var fighting = false
var flying = false
var flying_wave = 0;
var flying_wave_delta = 1
var flying_wave_range = 20
var cleaner_hp = 40


func diagonal():
	if shape.position.x < 820 and shape.position.y < 460 :
		shape.disabled = true
		velocity.x += H_SPEED * 1.5
		velocity.y -= V_SPEED / 7
	_animated_sprite.play("fly")
		
func _physics_process(delta):
	
	
	cleaner_label.set_text(String.num(cleaner_hp,0))
	
	if fighting:
		pass	
	
	elif Input.is_action_pressed("scream") and G.player_ultimate >= 100:
		
		G.player_ultimate = 0
		
		for node in get_tree().get_root().get_children(false):
			for child in node.get_children(false):
				if child as BaseEnemy:
					child.damage(Vector2(0,0), scream_attack)
					
				
	elif flying:
		
		if cleaner_hp <= 0:
			cleaner_hp = 0
			flying = false
			
		if cleaner_hp > 0:
			cleaner_hp -= 0.1
		
		_animated_sprite.play("fly")
		if Input.is_action_pressed("ui_right"):
			_animated_sprite.flip_h = false
			
		elif Input.is_action_pressed("ui_left"):
			_animated_sprite.flip_h = true
			
		
		if flying_wave > flying_wave_range || flying_wave < -flying_wave_range:
			flying_wave_delta *=-1
			
		flying_wave += flying_wave_delta
		
		velocity.y = F_SPEED * (Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")) + flying_wave
		velocity.x = F_SPEED * (Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left"))
		
		if !Input.is_action_pressed("shift"):
				flying = false
		
	#not flying
	else: 
		
		velocity.x = H_SPEED * (Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left"))
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY
				
		_animated_sprite.play("run")
		if Input.is_action_pressed("ui_right"):
			_animated_sprite.flip_h = false
		elif Input.is_action_pressed("ui_left"):
			_animated_sprite.flip_h = true
			
		else: 
			_animated_sprite.play("idle")
			velocity.x = 0
		
		if Input.is_action_pressed("lkm_mouse") and is_on_floor():
			fighting = true
			soft_hit.play()
			
			_animated_sprite.play("attack")

			
		if fighting == true:
			H_SPEED = 0
			V_SPEED = 0
			F_SPEED = 0
			velocity.x = 0
			velocity.y = 0
			attack_timer.start()
		else:
			H_SPEED = 400
			V_SPEED = 400
			F_SPEED = 400

		

		
		if not is_on_floor() && Input.is_action_pressed("shift") && cleaner_hp > 10:
			flying_sound.play()
			flying = true
		else:
			flying_sound.stop()
		if is_on_floor():
			if cleaner_hp < 40:
				cleaner_hp += 0.1
				
			if cleaner_hp > 10 && Input.is_action_pressed("shift"):
				flying = true
			
		else:	
			velocity.y += gravity * delta
	
	
	if Input.is_action_pressed("ui_cancel"):
		end_dialog = true
	
	if end_dialog == true: 
		diagonal()
		
		
	if health == 0:
		_animated_sprite.play("death")
		H_SPEED = 0
		V_SPEED = 0
		JUMP_VELOCITY = 0
	

	# Using move_and_slide.
	move_and_slide()
	
		
	
	


func _on_timer_timeout():
	if flying:
		if _animated_sprite.flip_h:
			G.generate_dust(50, (position+Vector2(30,5))*3.5, 1)
		else:
			G.generate_dust(50, (position+Vector2(-40,5))*3.5, -1)
		


func _on_attack_timer_timeout():
	fighting = false
	attack_collider_left.monitoring = false
	attack_collider_right.monitoring = false


func _on_attack_collider_right_body_entered(body):
	var enemy = body as BaseEnemy
	if enemy and _animated_sprite.frame in range(2,4):
		G.player_ultimate = min(100,G.player_ultimate+30)
		enemy.damage(Vector2(attack,attack), attack)


func _on_attack_collider_left_body_entered(body):
	var enemy = body as BaseEnemy
	if enemy and _animated_sprite.frame in range(2,4):
		G.player_ultimate = min(100,G.player_ultimate+30)
		enemy.damage(Vector2(-attack,attack), attack)


func _on_animated_sprite_2d_frame_changed():
	if fighting and _animated_sprite.frame in range(2,4):
		if _animated_sprite.flip_h:
			attack_collider_left.monitoring = true
		else:
			attack_collider_right.monitoring = true
		


func _on_enemy_collider_body_entered(body):
	if body as BaseEnemy:
		G.player_hp -= body.collision_damage
		if body.position.x < position.x:
			#carry enemy out of enemy collider
			
			body.kick(Vector2(-20,-20))
		else:
			body.kick(Vector2(20,-20))
		
