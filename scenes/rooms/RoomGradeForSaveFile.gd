extends Node2D

@export var GradeGenerator_node: GradeGenerator

const SAVE_PATH = "res://set_your_grade.dat"

func _ready():
	'''
	const SAVE_PATH = "res://set_your_grade.dat"
	var save_data = {
		"subject" : subject,
		"subject_color" : subject_color,
		"list_to_print_left" : list_to_print_left,
		"list_to_print_right" : list_to_print_right,
		"grade" : grade,
		"grade_color" : grade_color,
	}
	var save_file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var jstr = JSON.stringify(save_data)
	save_file.store_line(jstr)
	'''
	load_savefile()
	GradeGenerator_node.generate_grade()

func load_savefile():
	var load_file = FileAccess.open(SAVE_PATH, FileAccess.READ)

	if FileAccess.file_exists(SAVE_PATH) == true:
		if not load_file.eof_reached():
			var current_line = JSON.parse_string(load_file.get_line())
			if current_line:
				GradeGenerator_node.subject = current_line["subject"]
				GradeGenerator_node.subject_color = current_line["subject_color"]
				GradeGenerator_node.list_to_print_left = current_line["list_to_print_left"]
				GradeGenerator_node.list_to_print_right = current_line["list_to_print_right"]
				GradeGenerator_node.grade = current_line["grade"]
				GradeGenerator_node.grade_color = current_line["grade_color"]
