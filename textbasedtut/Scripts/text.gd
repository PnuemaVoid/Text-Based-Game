extends Control

var all_locations = [
	"cockpit",
	"cabin"
]

var current_location = all_locations[0]

var locations = {
	cockpit = "A dark cockpit, there are four seats up front and the not-so distant stars can be seen outside the windows. There is a [color=#9cd8f2]flashing blue light[/color] on the control panel. The [color=#e8ca9f]cabin[/color] can be seen through the cockpit entry.",
	cabin = "Storage drawers fill the sides of the cabin, there is a table in the middle and some seats around it. The entry to the [color=#e8ca9f]cockpit[/color] can be seen at the front."
}

var items = {
	flashing_blue_light = "The light is indicating that hyper-flight is enabled"
}

var command = false

func _physics_process(delta):
	$Location.text = current_location

func _on_LineEdit_text_entered(new_text):
	
	$LineEdit.text = ""
	
	if command == false:
		$ColorRect/RichTextLabel.bbcode_text += new_text + "\n"
	else:
		pass

	if new_text == "look":
		if current_location == all_locations[0]:
			$ColorRect/RichTextLabel.bbcode_text += locations.cockpit + "\n"
		elif current_location == all_locations[1]:
			$ColorRect/RichTextLabel.bbcode_text += locations.cabin + "\n"
	
	elif new_text == "go to " + "cabin":
		current_location = all_locations[1]
		$ColorRect/RichTextLabel.bbcode_text = ""
	
	elif new_text == "go to " + "cockpit":
		current_location = all_locations[0]
		$ColorRect/RichTextLabel.bbcode_text = ""
	
	elif new_text == "check " + "flashing blue light":
		if current_location == all_locations[0]:
			$ColorRect/RichTextLabel.bbcode_text += items.flashing_blue_light + "\n"


func _on_LineEdit_text_changed(new_text):
	if new_text == "look":
		command = true
	elif new_text == "go to " + "cabin" or new_text == "go to " + "cockpit":
		command = true
	elif new_text == "check flashing blue light":
		command = true
	else:
		command = false
