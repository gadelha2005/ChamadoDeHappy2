extends CanvasLayer

var count_box = 0
@onready var dialogo1 = $Label2
@onready var dialogo2 = $Label3
@onready var dialogo3 = $Label4
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("interact"):
		count_box += 1
		if count_box == 1:
			dialogo1.visible = false
			dialogo2.visible = true
			dialogo3.visible = false
		elif count_box == 2:
			dialogo1.visible = false
			dialogo2.visible = false
			dialogo3.visible = true
		elif count_box == 3:
			get_tree().change_scene_to_file("res://Cenas/level_1.tscn")
