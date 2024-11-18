extends TextureButton


# Called when the node enters the scene tree for the first time.
var music_bus = AudioServer.get_bus_index("Music")


func _on_pressed():
	AudioServer.set_bus_mute(music_bus, not AudioServer.is_bus_mute(music_bus))
