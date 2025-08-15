extends CharacterBody2D
class_name Player

@export var hp: int = 10 #export allows it to show up in inspector
@export var move_speed: int = 200 #used to adjust speed vector

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = SceneManager.player_spawn_position
	
	#var score: int = 200
	#var username: String = "bob"
	#var is_player_alive: bool = true
	#var my_float: float = 0.0
	#var first_name: String = "Rico"
	#var damage: float = 7.5
	#var hp: int = 100
	
	#print("First name: ", first_name, " Damage: ", damage)	
	#if hp == 1:
	#	print("Very low hp!: ", hp)
	#if damage >= 5:
	#	print("Damage greater than 5: ", damage)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void: #was: func _process(delta: float) -> void:
	#problem with using below with joypad support added; something with deadzones not being absolute
	#var move_vector: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down") #needs to be in this order
	#below fixes it, likely from the "normalized()":
	var move_vector: Vector2 = Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down")).normalized()
	velocity = move_vector * move_speed
	
	if velocity.x < 0:
		$AnimatedSprite2D.play("move_left")
	
	elif velocity.x > 0:
		$AnimatedSprite2D.play("move_right")
		
	elif velocity.y < 0: # y is inverted?
		$AnimatedSprite2D.play("move_up")
		
	elif velocity.y > 0: # y is inverted?
		$AnimatedSprite2D.play("move_down")
		
	else:
		$AnimatedSprite2D.stop()
		
	move_and_slide()
