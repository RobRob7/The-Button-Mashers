# time var
var time = 0.0

# max time var
var max_time = 0.0

# function to initialize cooldown timer
func _init(max_time):
	self.max_time = max_time
	self.time = 0

# function to increment time in real time
func tick(delta):
	time = max(time-delta, 0)

# function determines if cooldown is over or not
func is_ready():
	if time > 0:
		return false
	time = max_time
	return true
