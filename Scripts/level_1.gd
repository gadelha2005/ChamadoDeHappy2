extends Node

@onready var button_1 = get_node("Button1/AnimatedSpriteButton")
@onready var button_2 = get_node("Button2/AnimatedSpriteButton")
@onready var door = get_node("Door/AnimatedSpriteDoor")
@onready var coin: Area2D = $Coins/Coin
@onready var coin_2: Area2D = $Coins/Coin2
@onready var coin_counter_label = get_node("UI/CanvasLayer/Label")


var button_1_pressed = false
var button_2_pressed = false
var playercount = 0
var coin_count = 0

var doorOpen = false

func _on_button_1_body_entered(body):
	if (body is PlayerLevel1):
		button_1.play("buttonPressed")
		button_1_pressed = true
		openTheDoor()


func _on_button_2_body_entered(body):
	if (body is PlayerLevel2):
		button_2.play("buttonPressed")
		button_2_pressed = true
		openTheDoor()

func openTheDoor():
	if button_1_pressed == true && button_2_pressed == true:
		door.play("doorOpen")
		doorOpen = true
		


func _on_button_1_body_exited(body: Node2D) -> void:
	if(body is PlayerLevel1):
		button_1.play("buttonNoPressed")
		if playercount > 0:
			playercount -= 1
		


func _on_button_2_body_exited(body: Node2D) -> void:
	if(body is PlayerLevel2):
		button_2.play("buttonNoPressed")
	

func _on_door_body_entered(body: Node2D):
	if body is PlayerLevel && doorOpen:
		playercount += 1
		_pass()
func _on_door_body_exited(body: Node2D):
	playercount -= 1
	
	
func _pass():
	if playercount == 2:
		get_tree().change_scene_to_file("res://Cenas/map.tscn")
		


func _on_coin_body_entered(body: Node2D) -> void:
	if body is PlayerLevel:
		coin.queue_free()
		on_coin_collected()
		


func _on_coin_2_body_entered(body: Node2D) -> void:
	if body is PlayerLevel:
		coin_2.queue_free()
		on_coin_collected()
	
	
func on_coin_collected():
	# Incrementa o contador de moedas
	coin_count += 1
	# Atualiza o texto do Label para exibir o número de moedas coletadas
	coin_counter_label.text = "COINS = "+ str(coin_count)
