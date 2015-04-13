extends Timer

var timeout = 0
const INTERVAL = 15
const STATS_INTERVAL = 3
var root

var state = null

const INTRO = 1
const STATS = 2

func _process(delta):
	timeout += delta
	if timeout > self.__get_interval():
		self.stop()

		if state == INTRO:
			root.load_map(1)
			root.load_menu()
			if !root.menu.is_hidden():
				root.toggle_menu()

			root.lock_for_demo()
			self.reset(STATS)

		else:
			root.restart_map()
			self.reset(INTRO)


func inject_root(root_obj):
	root = root_obj

func reset(state = INTRO):
	timeout = 0
	self.state = state

func __get_interval():
	if state == INTRO:
		return INTERVAL
	else:
		return STATS_INTERVAL

