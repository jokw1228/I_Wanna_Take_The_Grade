extends Node2D

@export var GradeGenerator_node: GradeGenerator
@export var jhan_node: Sprite2D

func _ready():
	GradeGenerator_node.generate_grade()
	await get_tree().create_timer(9.0).timeout
	jhan_node.visible = true
	var tween = get_tree().create_tween()
	tween.tween_property(jhan_node, "modulate", Color(1, 1, 1, 0.2), 1.0)
