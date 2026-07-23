extends Area2D
#@onready var death_particles = $DeathParticles
#@onready var spawn_point = %SpawnPoint

signal player_died(death_position: Vector2)


@export var amplitude := 4
@export var frequency := 5

var time_passed = 0
var initial_position := Vector2.ZERO

#hovering animation
func _ready():
	initial_position = position

func _process(delta):
	chocolate_hover(delta) 

func chocolate_hover(delta):
	time_passed += delta
	var new_y = initial_position.y + amplitude * sin(frequency * time_passed)
	position.y = new_y
	
	
func _on_body_entered(body):
	push_warning("in1")
	if body.is_in_group("Player"):
		push_warning("in2")
		var death_location: Vector2 = global_position
		player_died.emit(death_location)
		AudioManager.death_sfx.play()
		#death_particles.emitting = true
		GameManager.spawn_body(global_position)
	#global_position = spawn_point.global_position
