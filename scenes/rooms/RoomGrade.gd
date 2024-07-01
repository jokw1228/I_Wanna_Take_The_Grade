extends Node2D

@export var BGM_node: AudioStreamPlayer2D

@export var SFX_Subject: AudioStreamPlayer2D
@export var SFX_Labeling: AudioStreamPlayer2D
@export var SFX_Graded: AudioStreamPlayer2D

@export var Label_Subject: Label

@export var Midterm: Node
@export var Assignment: Node
@export var Final: Node

@export var Label_Rank: Label
@export var Label_Grade: Label

func _ready():
	
	await get_tree().create_timer(0.5).timeout
	
	Label_Subject.visible = true
	SFX_Subject.play()
	
	await get_tree().create_timer(0.3).timeout
	
	BGM_node.play()
	
	await get_tree().create_timer(1.0).timeout
	
	Midterm.visible = true
	SFX_Labeling.play()
	
	await get_tree().create_timer(0.5).timeout
	
	Assignment.visible = true
	SFX_Labeling.play()
	
	await get_tree().create_timer(0.5).timeout
	
	Final.visible = true
	SFX_Labeling.play()
	
	await get_tree().create_timer(1.0).timeout
	
	Label_Rank.visible = true
	SFX_Labeling.play()
	
	await get_tree().create_timer(1.0).timeout
	
	Label_Grade.visible = true
	SFX_Graded.play()

func _process(_delta):
	if Input.is_action_pressed("reset"):
		get_tree().reload_current_scene()
