extends KinematicBody2D
var bullet_scene = preload("res://KBullet.tscn")
const Utils = preload("res://Utils.gd")

const THRUST := .05
const YAW := .1
const BULLET_SPEED := 200

onready var WIDTH:int = ProjectSettings.get_setting("display/window/size/width")
onready var HEIGHT:int = ProjectSettings.get_setting("display/window/size/height")

var _vel := Vector2(0,0)
var _thrust := 0.0
var _yaw := 0.0
var _fire := false

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
    # No idea why this doesn't work: rotate(_yaw * YAW)
    rotation += _yaw * YAW
    if _thrust > 0.0:
        var delta_vee = Vector2(THRUST * _thrust, 0).rotated(rotation)
        _vel += delta_vee
        $ThrustParticles.emitting = true
    else:
        $ThrustParticles.emitting = false
    move_and_collide(_vel)
    # wrap around
    position.x = Utils.wrap(position.x, WIDTH)
    position.y = Utils.wrap(position.y, HEIGHT)

    if _fire:
        _fire = false
        var bullet : RigidBody2D = bullet_scene.instance()
        bullet.position = position + Vector2(40, 0).rotated(rotation) * scale
        # /delta to convert from pixels per delta to pixels per second
        var vel = _vel/delta + Vector2(BULLET_SPEED, 0).rotated(rotation)
        bullet.set_linear_velocity(vel)
        get_parent().add_child(bullet)


func rotate(r: float):
    _yaw = clamp(r, -1, 1)

func thrust(t: float):
    _thrust = clamp(t, 0, 1)

func fire():
    _fire = true
