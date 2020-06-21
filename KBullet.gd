extends RigidBody2D

const Utils = preload("res://Utils.gd")

onready var WIDTH:int = ProjectSettings.get_setting("display/window/size/width")
onready var HEIGHT:int = ProjectSettings.get_setting("display/window/size/height")

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _integrate_forces(state):
    # wrap around
    var xform = state.get_transform()
    xform.origin.x = Utils.wrap(xform.origin.x, WIDTH)
    xform.origin.y = Utils.wrap(xform.origin.y, HEIGHT)
    state.set_transform(xform)
