## ADDITIONAL SETUP:
## In the "Audio" tab, there is a "Speech" bus with some

extends Node

# Dictionary of characters and the sound they make
var character_sounds = {}

# Characters for which to pause
@export var space_characters = " .,!?\n\r"
@export var use_character_timer: bool = true

# Adjust pitch scale to change pitch and speed per letter
@onready var audio_player: AudioStreamPlayer = %AudioStreamPlayer
# Amount of time allowed per character. Adjust Wait Time to change speed.
@onready var character_timer: Timer = %CharacterTimer
# Amount of time allowed per pause. Adjust Wait Time to change speed.
@onready var pause_timer: Timer = %PauseTimer

func _ready():
	_load_character_sound_files()

## Reads text out!
func say(text: String):
	text = text.to_lower()
	for character in text:
		await _say_character(character)

## Ready individual character
func _say_character(character: String):
	if character_sounds.has(character):
		var sound = character_sounds.get(character)
		audio_player.stream = sound
		audio_player.play()
		if use_character_timer:
			character_timer.start()
			await character_timer.timeout
		else:
			await audio_player.finished
	elif space_characters.find(character) > -1:
		# TODO: wait
		pause_timer.start()
		await pause_timer.timeout
		pass

## Load sounds to character_sounds dictionary.
## Expects folder of .mp3 files each named for a character, located at /letters
func _load_character_sound_files():
	var file_array = ResourceLoader.list_directory("res://letters")
	if file_array:
		for file_name in file_array:
			# Skip import files
			if file_name.ends_with(".import") or file_name.ends_with(".remap"):
				continue
			# Construct the full path
			var full_path: String = "letters/" + file_name

			# Load the resource dynamically
			var resource = ResourceLoader.load(full_path)
			if resource:
				var character = file_name.replace(".mp3", "")
				character_sounds.set(character, resource)
			else:
				printerr("Failed to load resource: " + full_path)

	else:
		printerr("DirAccess failed.")

## For test purposes:
func _on_button_pressed():
	say(%TextEdit.text)
