class_name GeometryHelper

static var _cached_circle_polygon_data: PackedVector2Array
static var _cached_square_polygon_data: PackedVector2Array
static var _cached_triangle_polygon_data: PackedVector2Array

static func get_circle_polygon_data(radius: float) -> PackedVector2Array:
    if _cached_circle_polygon_data.is_empty():
        _cached_circle_polygon_data = _create_circle(radius)
    return _cached_circle_polygon_data

static func get_square_polygon_data(size: float) -> PackedVector2Array:
    if _cached_square_polygon_data.is_empty():
        _cached_square_polygon_data = _create_square(size)
    return _cached_square_polygon_data

static func get_triangle_polygon_data(size: float) -> PackedVector2Array:
    if _cached_triangle_polygon_data.is_empty():
        _cached_triangle_polygon_data = _create_triangle(size)
    return _cached_triangle_polygon_data

static func _create_circle(radius: float) -> PackedVector2Array:
    var polygon_data: PackedVector2Array = []
    for i:int in GameConfig.CIRCLE_POINTS:
        var degree := float(i) * 360.0 / float(GameConfig.CIRCLE_POINTS)
        var angle := deg_to_rad(degree)
        var x := cos(angle)
        var y := sin(angle)
        polygon_data.append(Vector2(x * radius, y * radius))
    return polygon_data

static func _create_square(size: float) -> PackedVector2Array:
    return PackedVector2Array([
        Vector2(-size / 2.0, -size / 2.0),
        Vector2(-size / 2.0, size / 2.0),
        Vector2(size / 2.0, size / 2.0),
        Vector2(size / 2.0, -size / 2.0)
    ])

static func _create_triangle(size: float) -> PackedVector2Array:
    return PackedVector2Array([
        Vector2(0.0, -size / 2.0),
        Vector2(-size / 2.0, size / 2.0),
        Vector2(size / 2.0, size / 2.0)
    ])