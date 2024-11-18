extends Node

@onready var main = $Main
@onready var creditos = $Creditos
@onready var backButton = $"Voltar dos Creditos"
@onready var options = $Options

func _ready():
	creditos.visible = false
	backButton.visible = false



func _process(delta):
	if Input.is_action_just_pressed("left2"):
		_on_voltar_dos_creditos_pressed()

func _on_jogar_pressed():
	get_tree().change_scene_to_file("res://Cenas/map.tscn")


func _on_creditos_buttons_pressed():
	main.visible = false
	creditos.visible = true
	backButton.visible = true
	backButton.grab_focus()

func _on_voltar_dos_creditos_pressed():
	main.visible = true
	creditos.visible = false
	backButton.visible = false
	options.visible = false
	%Jogar.grab_focus()


func _on_opções_pressed():
	main.visible = false
	options.visible = true
	backButton.visible = true
	backButton.grab_focus()
