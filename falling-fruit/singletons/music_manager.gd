extends Node

@onready var music_player: AudioStreamPlayer = AudioStreamPlayer.new()

func _ready():
	add_child(music_player)
	music_player.bus = "Music"   # opcional: usar un bus dedicado
	music_player.stream = null
	music_player.autoplay = false
	

func play_music(path: String):
	var stream: AudioStream = load(path)
	if stream:
		# Solo ciertos formatos tienen loop (MP3, OGG)
		if stream is AudioStreamMP3 or stream is AudioStreamOggVorbis:
			stream.loop = true
		music_player.stream = stream
		music_player.play()
	else:
		push_error("No se pudo cargar la música en: " + path)

func stop_music():
	music_player.stop()

func set_volume(db: float):
	music_player.volume_db = db
