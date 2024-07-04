extends Node2D

@export var GradeGenerator_node: GradeGenerator

func _ready():
	GradeGenerator_node.generate_grade()
