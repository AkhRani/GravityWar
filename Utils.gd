extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

static func wrap(v: float, limit: int) -> float:
    while v > limit:
        v -= limit
    while v < 0:
        v += limit
    return v
