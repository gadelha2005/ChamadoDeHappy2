extends Node


@onready var button1 = get_node("Button1/AnimatedSpriteButton")
@onready var button2 = get_node("Button2/AnimatedSpriteButton")
@onready var button3 = get_node("Button3/AnimatedSpriteButton")
@onready var doorRight1 = get_node("DoorRight1")
@onready var doorRight2 = get_node("DoorRight2")
@onready var doorLeft = get_node("DoorLeft")
@onready var door1 = get_node("Door1/AnimatedSpriteDoor")
@onready var door2 = get_node("Door2/AnimatedSpriteDoor")
@onready var back_pack: Area2D = $Back_pack


var door_open = false
var player_count = 0

# Botao1
func _on_button_1_body_entered(body: Node2D) -> void:
	if body is PlayerLevel:
		button1.play("buttonPressed")
		doorRight1.get_node("AnimatedSpriteDoorRight").play("doorRightOpen")
		doorRight1.collision_layer = 0  # Desativa a colisão da porta

func _on_button_1_body_exited(body: Node2D) -> void:
	if body is PlayerLevel:
		button1.play("buttonNoPressed")
		doorRight1.get_node("AnimatedSpriteDoorRight").play("doorRightClosed")
		doorRight1.collision_layer = 2  # Ativa a colisão da porta

# Botao2
func _on_button_2_body_entered(body: Node2D) -> void:
	if body is PlayerLevel:
		button2.play("buttonPressed")
		doorLeft.get_node("AnimatedSpriteDoorLeft").play("doorLeftOpen")
		doorLeft.collision_layer = 0  # Desativa a colisão da porta

func _on_button_2_body_exited(body: Node2D) -> void:
	if body is PlayerLevel:
		button2.play("buttonNoPressed")
		doorLeft.get_node("AnimatedSpriteDoorLeft").play("doorLeftClosed")
		doorLeft.collision_layer = 2  # Ativa a colisão da porta

# Botao3
func _on_button_3_body_entered(body: Node2D) -> void:
	if body is PlayerLevel:
		button3.play("buttonPressed")
		doorRight2.get_node("AnimatedSpriteDoorRight").play("doorRightOpen")
		doorRight2.collision_layer = 0  # Desativa a colisão da porta

func _on_button_3_body_exited(body: Node2D) -> void:
	if body is PlayerLevel:
		button3.play("buttonNoPressed")
		doorRight2.get_node("AnimatedSpriteDoorRight").play("doorRightClosed")
		doorRight2.collision_layer = 2 # Ativa a colisão da porta

# Controle da Mochila
func _on_back_pack_body_entered(body: Node2D) -> void:
	if body is PlayerLevel:
		back_pack.queue_free()
		door1.play("doorOpen")
		door2.play("doorOpen")  #

# Detecção nas portas centrais para mudança de cena
func _on_door_1_body_entered(body: Node2D) -> void:
	if body is PlayerLevel:
		player_count += 1
		_pass_level()

func _on_door_1_body_exited(body: Node2D) -> void:
	if body is PlayerLevel:
		player_count -= 1

func _on_door_2_body_entered(body: Node2D) -> void:
	if body is PlayerLevel:
		player_count += 1
		_pass_level()

func _on_door_2_body_exited(body: Node2D) -> void:
	if body is PlayerLevel:
		player_count -= 1

func _pass_level():
	if player_count == 2:
		get_tree().change_scene_to_file("res://Cenas/map.tscn")
