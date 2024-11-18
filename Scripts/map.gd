extends Node

@onready var interact_level = $AnimationPlayer
@onready var interact_color = $AnimationPlayer2
@onready var BaseL0 = $BaseL0
@onready var BaseL1 = $BaseL1
@onready var BaseL2 = $BaseL2
@onready var BaseL3 = $BaseL3

var lvcount = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _process(delta):
	if Input.is_action_just_pressed("right"):
		lvcount += 1
	if Input.is_action_just_pressed("left"):
		lvcount -= 1
		
	if lvcount == 0:
		interact_level.play("map_walk_0")
		interact_color.play("color_modulate0")
		BaseL1.modulate = "ffffff"
		BaseL2.modulate = "ffffff"
		BaseL3.modulate = "ffffff"
			
	elif lvcount == 1:
		interact_level.play("map_walk_1")
		interact_color.play("color_modulate1")
		BaseL0.modulate = "ffffff"
		BaseL2.modulate = "ffffff"
		BaseL3.modulate = "ffffff"
		if Input.is_action_just_pressed("interact"):
			get_tree().change_scene_to_file("res://Cenas/dialogo_happy.tscn")
		
	elif lvcount == 2:
		interact_level.play("map_walk_2")
		interact_color.play("color_modulate2")
		BaseL1.modulate = "ffffff"
		BaseL0.modulate = "ffffff"
		BaseL3.modulate = "ffffff"
		if Input.is_action_just_pressed("interact"):
			get_tree().change_scene_to_file("res://Cenas/level_2.tscn")
			
	elif lvcount == 3:
		interact_level.play("map_walk_3")
		interact_color.play("color_modulate3")
		BaseL1.modulate = "ffffff"
		BaseL2.modulate = "ffffff"
		BaseL0.modulate = "ffffff"
		if Input.is_action_just_pressed("interact"):
			get_tree().change_scene_to_file("res://Cenas/level_3.tscn")
	elif lvcount > 3:
		lvcount = 0
	elif lvcount < 0:
		lvcount = 3
