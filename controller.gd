extends Node

var _target

# Called when the node enters the scene tree for the first time.
func _ready():
    _target = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    _target.thrust(1 if Input.is_action_pressed("ui_up") else 0)
    #    _target.thrust(1)
    #else:
    #    _target.thrust(
    var right := Input.get_action_strength("ui_right")
    var left := Input.get_action_strength("ui_left")
    _target.rotate(right - left)

    if Input.is_action_just_pressed("ui_accept"):
        _target.fire()
