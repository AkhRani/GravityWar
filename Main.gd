extends Node2D

var controller = preload("controller.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
    var ctrl = controller.new();
    $Ship.add_child(ctrl)
    pass # Replace with function body.
