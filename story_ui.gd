extends CanvasLayer

@onready var panel: PanelContainer = $PanelContainer
@onready var label: Label = $PanelContainer/Label

# Put all parts of your rabbit's story right here!
var story_lines: Array[String] = [
	"Part 1: Once, a small rabbit chased a fallen star past the edge of the burrow.",
	"Part 2: Every leap left behind a shadow of where he had been.",
	"Part 3: Though he stumbled into the dark, his own echoes lifted him higher.",
	"Part 4: With every fall, the rabbit learned to bounce back toward the light."
]

var current_index: int = 0

func _ready() -> void:
	# Hide the story box when the game starts
	panel.visible = false

func show_next_story() -> void:
	if current_index < story_lines.size():
		label.text = story_lines[current_index]
		current_index += 1
	else:
		label.text = "The rabbit's tale is complete."
		
	panel.visible = true
	
	# Hide the box automatically after 5 seconds
	await get_tree().create_timer(5.0).timeout
	panel.visible = false
