extends RigidBody2D

@export var velocity_threshold: float = 200.0  # tweak this to whatever counts as "too high"
@export var check_frames: int = 20
@export var push_up_amount: float = 10.0
# Called when the node enters the scene tree for the first time.
var frame_count: int = 0

func _physics_process(_delta):
	if frame_count < check_frames:
		frame_count += 1
		
		if linear_velocity.length() > velocity_threshold:
			linear_velocity = Vector2.ZERO
			global_position.y -= push_up_amount

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
