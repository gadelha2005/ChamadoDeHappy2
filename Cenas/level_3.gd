extends Node


@onready var button1 = get_node("Button1/AnimatedSpriteButton")
@onready var button2 = get_node("Button2/AnimatedSpriteButton")
@onready var button3 = get_node("Button3/AnimatedSpriteButton")
@onready var doorLeft1 = get_node("DoorLeft1")
@onready var doorLeft2 = get_node("DoorLeft2")
@onready var doorLeft3 = get_node("DoorLeft3")
@onready var door1 = get_node("Door1/AnimatedSpriteDoor")
@onready var door2 = get_node("Door2/AnimatedSpriteDoor")

@onready var bola: Area2D = $Bola
var player_count = 0


#Botao 1
func _on_button_1_body_entered(body: Node2D) -> void:
	if body is PlayerLevel:
		button1.play("buttonPressed")
		doorLeft1.get_node("AnimatedSpriteDoorLeft").play("doorLeftOpen")
		doorLeft1.collision_layer = 0


func _on_button_1_body_exited(body: Node2D) -> void:
	if body is PlayerLevel:
		button1.play("buttonNoPressed")
		doorLeft1.get_node("AnimatedSpriteDoorLeft").play("doorLeftClosed")
		doorLeft1.collision_layer = 2


func _on_button_2_body_entered(body: Node2D) -> void:
	if body is PlayerLevel:
		button2.play("buttonPressed")
		doorLeft2.get_node("AnimatedSpriteDoorLeft").play("doorLeftOpen")
		doorLeft2.collision_layer = 0


func _on_button_2_body_exited(body: Node2D) -> void:
	if body is PlayerLevel:
		button2.play("buttonNoPressed")
		doorLeft2.get_node("AnimatedSpriteDoorLeft").play("doorLeftClosed")
		doorLeft2.collision_layer = 2


func _on_button_3_body_entered(body: Node2D) -> void:
	if body is PlayerLevel:
		button3.play("buttonPressed")
		doorLeft3.get_node("AnimatedSpriteDoorLeft").play("doorLeftOpen")
		doorLeft3.collision_layer = 0


func _on_button_3_body_exited(body: Node2D) -> void:
	if body is PlayerLevel:
		button3.play("buttonNoPressed")
		doorLeft3.get_node("AnimatedSpriteDoorLeft").play("doorLeftClosed")
		doorLeft3.collision_layer = 2
	


func _on_bola_body_entered(body: Node2D) -> void:
	if body is PlayerLevel:
		bola.queue_free()
		door1.play("doorOpen")
		door2.play("doorOpen")
		
	
func _on_door_1_body_entered(body: Node2D) -> void:
	if body is PlayerLevel:
		player_count += 1
		_pass_level()


func _on_door_2_body_entered(body: Node2D) -> void:
	if body is PlayerLevel:
		player_count += 1
		_pass_level()


func _on_door_1_body_exited(body: Node2D) -> void:
	if body is PlayerLevel:
		player_count -= 1


func _on_door_2_body_exited(body: Node2D) -> void:
	if body is PlayerLevel:
		player_count -= 1
		
func _pass_level():
	if player_count == 2:
		get_tree().change_scene_to_file("res://Cenas/map.tscn")
