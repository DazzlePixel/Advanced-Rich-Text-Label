extends RichTextLabel

## Extends [code]RichTextLabel[/code] to conduct custom parsing with custom BBcodes.
## It differs from [code]RichTextEffect[/code] as it only capable of altering the visuals of texts while this actually manipulates the texts itself.
class_name AdvancedRichTextLabel

## Array of parsers that are used in evaluation.
@export var _parsers: Array[AdvancedRichTextLabelParser]

## Cache the string before evaluation, it is used during reparse.
var _source_string: String

func _init() -> void:
	bbcode_enabled = true
	pass

func _ready() -> void:
	for p in _parsers:
		p.initialize(self)
	
	# this is to self trigger _set() function
	# set("text", text) is equivalent to [code]text = text[/code]
	# but in this case, only the former works
	# this is likely a bug
	if not text.is_empty():
		set("text", text)
	pass

## Invalidate the current text and reevaluate the text.
func reparse() -> void:
	set("text", _source_string)
	pass

func _set(property: StringName, value: Variant) -> bool:
	match property:
		"text":
			_source_string = value
			var displayedText = value
			for p in _parsers:
				var matches: Array[RegExMatch] = p._parseRegex.search_all(value)
				for m in matches:
					var ret: String = p.parse(m)
					displayedText = displayedText.replace(m.get_string(), ret)
			text = displayedText
	return true
