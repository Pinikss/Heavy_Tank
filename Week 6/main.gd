extends Node2D

@onready var pintu = $Pintu

func _on_timbangan_timbangan_seimbang(apakah_seimbang: bool) -> void:
	pintu.buka_pintu(apakah_seimbang)
