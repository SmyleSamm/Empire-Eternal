extends Object
class_name Player 

var counter: Dictionary = {
	"firstCounter": 0,
	"secondCounter": 0
}

func addCount(key: String, value: int) -> void:
	if not key in counter:
		printerr(key," is not a valid counter!")
		print(counter)
		return
	counter[key] += value

func getCounter() -> Dictionary:
	return counter
