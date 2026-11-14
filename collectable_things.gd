extends Area2D

var collected: bool = false

@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	if anim_sprite:
		anim_sprite.play("default")

func _on_body_entered(body: Node2D) -> void:
	print("Something touched coin: ", body.name)
	
	# Check if it's the player (works even if your player node was renamed!)
	if not collected and body.is_in_group("player") or body.name == "Player":
		if collected:
			return
		collected = true
		print("Player collected coin! Calling story_ui...")
		
		get_tree().call_group("story_ui", "show_next_story")
		queue_free()
