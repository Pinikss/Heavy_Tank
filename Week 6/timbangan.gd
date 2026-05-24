extends Node2D

signal timbangan_seimbang(apakah_seimbang: bool)

var berat_kiri: float = 0.0
var berat_kanan: float = 0.0

@export var toleransi: float = 0.1 

func _ready():
	$Kiri.body_entered.connect(_on_kiri_entered)
	$Kiri.body_exited.connect(_on_kiri_exited)
	$Kanan.body_entered.connect(_on_kanan_entered)
	$Kanan.body_exited.connect(_on_kanan_exited)

func cek_keseimbangan():
	var selisih = abs(berat_kiri - berat_kanan)
	
	if berat_kiri > 0 and berat_kanan > 0 and selisih <= toleransi:
		timbangan_seimbang.emit(true)
		print("Timbangan Seimbang!")
	else:
		timbangan_seimbang.emit(false)
		print("Timbangan Tidak Seimbang.")

func _on_kiri_entered(body):
	if "berat" in body:
		berat_kiri += body.berat
		cek_keseimbangan()

func _on_kiri_exited(body):
	if "berat" in body:
		berat_kiri -= body.berat
		cek_keseimbangan()

func _on_kanan_entered(body):
	if "berat" in body:
		berat_kanan += body.berat
		cek_keseimbangan()

func _on_kanan_exited(body):
	if "berat" in body:
		berat_kanan -= body.berat
		cek_keseimbangan()
