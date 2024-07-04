extends Node2D

@export var subject: String
@export var list_to_print_left: Array[String]
@export var list_to_print_right: Array[String]
@export var grade: String
@export var grade_color: Color

@export var LabelSubject_scene: PackedScene
@export var LabelLeft_scene: PackedScene
@export var LabelRight_scene: PackedScene
@export var LabelGrade_scene: PackedScene

@export var BGM_node: AudioStreamPlayer2D
@export var SFX_Subject: AudioStreamPlayer2D
@export var SFX_Labeling: AudioStreamPlayer2D
@export var SFX_Graded: AudioStreamPlayer2D

var list_size: int

const y_center = 240

func _ready():
	list_size = list_to_print_left.size()
	
	await get_tree().create_timer(0.5).timeout
	
	# subject
	var inst_subject = LabelSubject_scene.instantiate()
	inst_subject.text = subject.replace("\\n", "\n")
	inst_subject.position = Vector2(32, 64)
	add_child(inst_subject)
	SFX_Subject.play()
	
	await get_tree().create_timer(0.3).timeout # wait to the end of SFX_subject
	
	# stage clear BGM
	BGM_node.play()
	
	await get_tree().create_timer(1.0).timeout # wait a moment before showing the score for each item
	
	### scores ###
	
	for i in range(list_size):
		var inst_left = LabelLeft_scene.instantiate()
		inst_left.text = list_to_print_left[i]
		inst_left.position = Vector2(0, y_center + 48 * (i - ( float(list_size) / 2)))
		add_child(inst_left)
		var inst_right = LabelRight_scene.instantiate()
		inst_right.text = list_to_print_right[i]
		inst_right.position = Vector2(920, y_center + 48 * (i - ( float(list_size) / 2)))
		add_child(inst_right)
		
		SFX_Labeling.play()
		await get_tree().create_timer(0.5).timeout
	
	###############
	
	# rank
	await get_tree().create_timer(0.5).timeout
	
	var inst_rank = LabelLeft_scene.instantiate()
	inst_rank.text = "rank"
	inst_rank.position = Vector2(0, 464)
	add_child(inst_rank)
	SFX_Labeling.play()
	
	# grade
	await get_tree().create_timer(1.0).timeout
	
	var inst_grade = LabelGrade_scene.instantiate()
	inst_grade.text = grade
	inst_grade.add_theme_color_override("font_color", grade_color)
	inst_grade.position = Vector2(928, 408)
	add_child(inst_grade)
	SFX_Graded.play()

func _process(_delta):
	if Input.is_action_pressed("reset"):
		get_tree().reload_current_scene()
