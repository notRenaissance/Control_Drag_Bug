extends Control

var item  = null
var count = 0
var sprite

const SPRITE_SIZE = 32  # the size of the sprite
const ICON_SIZE = 64
const RAW_LENGTH = 16

func _init(i, c):
	item = i
	count = c
	sprite = Sprite.new()
	add_child(sprite)
	set_size(Vector2(ICON_SIZE, ICON_SIZE))

func _ready():
	set_ignore_mouse(true)
	set_stop_mouse(false)
	layout()

func layout():
	var icon = get_node("/root/item_database").get_item_icon(item)
	sprite.set_pos(get_size()/2)
	sprite.set_scale(get_size()/ICON_SIZE)
	sprite.set_texture(preload("res://items.png"))
	sprite.set_region(true)
	sprite.set_region_rect(Rect2(ICON_SIZE * (icon % RAW_LENGTH), ICON_SIZE * (icon / RAW_LENGTH), ICON_SIZE, ICON_SIZE))

func can_stack(s):
	return s.item == item

func stack(s):
	if s.item == item:
		count += s.count
		layout()
		return true
	else:
		return false

func split(n):
	if count <= n:
		return null
	var script = get_script()
	var s = script.new(item, n)
	count -= n
	layout()
	return s
