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

	if FileAccess.file_exists(SAVE_PATH) == false:
		return
	
	var current_line = JSON.parse_string(load_file.get_line())
	if current_line:
		#subject
		GradeGenerator_node.subject = current_line["subject"]
		
		#subject_color
		var subject_color_parse = current_line["subject_color"]
		var subject_color_splitted = subject_color_parse.replace("(", "").replace(")", "").split(",")
		GradeGenerator_node.subject_color = Color(float(subject_color_splitted[0]), float(subject_color_splitted[1]), float(subject_color_splitted[2]), float(subject_color_splitted[3]))
		
		print(current_line["list_to_print_left"])
		#GradeGenerator_node.list_to_print_left = current_line["list_to_print_left"]
		#GradeGenerator_node.list_to_print_right = current_line["list_to_print_right"]
		
		#grade
		GradeGenerator_node.grade = current_line["grade"]
		
		#grade_color
		var grade_color_parse = current_line["grade_color"]
		var grade_color_splitted = grade_color_parse.replace("(", "").replace(")", "").split(",")
		GradeGenerator_node.grade_color = Color(float(grade_color_splitted[0]), float(grade_color_splitted[1]), float(grade_color_splitted[2]), float(grade_color_splitted[3]))
