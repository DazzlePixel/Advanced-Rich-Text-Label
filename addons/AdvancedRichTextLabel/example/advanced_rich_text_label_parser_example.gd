extends AdvancedRichTextLabelParser
## An example parser for [code]AdvancedRichTextParser[/code].
class_name AdvancedRichTextLabelParser_Example

## Cache the data from any source.
var _data: String

func get_parse_tag() -> String:
	return "example"

func initialize(inOwner: AdvancedRichTextLabel) -> void:
	super.initialize(inOwner)
	
	## This is the data source where we get our data to reevaluate the texts
	ExampleSignal.example.connect(_example)
	pass

func _example(data: String) -> void:
	_data = data
	
	# Trigger the reevaluation of the text with updated data
	owner.reparse()
	pass

func parse(regexMatch: RegExMatch) -> String:
	# Return the cache data for string substitution
	# Effectively [code][example]...[/example][/code] is substituted with contents of [code]_data[/code].
	return _data
