extends Control

var sprite

const SPRITE_SIZE = 32  # the size of the sprite
const ICON_SIZE = 64
const RAW_LENGTH = 16

func _init():
	sprite = Sprite.new()
	add_child(sprite)
	set_size(Vector2(ICON_SIZE, ICON_SIZE))

func _ready():
	set_ignore_mouse(true)
	set_stop_mouse(false)
	layout()

func layout():
	sprite.set_pos(get_size()/2)
	sprite.set_scale(get_size()/ICON_SIZE)
	sprite.set_texture(preload("icon.png"))
	sprite.set_region(true)
	sprite.set_region_rect(Rect2(0,0,ICON_SIZE,ICON_SIZE))