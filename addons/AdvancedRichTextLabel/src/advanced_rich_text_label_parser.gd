extends Resource

## Used by [code]AdvancedRichTextLabel[/code] to parse and manipulate texts using custom BBcodes.
class_name AdvancedRichTextLabelParser

## Custom tag that will be parsed.
## e.g. [tag]something[/tag]
const PARSE_TAG_PATTERN: String = "\\[$.*?](?<value>.*?)\\[\\/$]"

## Reference to the owning AdvancedRichTextLabel.
var owner: AdvancedRichTextLabel

## Cache the Regex used for parsing.
var _parseRegex: RegEx

## Override this function to return your custom tag.
## e.g. [tag]something[/tag] will have 'tag' as parse tag.
func get_parse_tag() -> String:
	return ""

## Called from AdvancedRichTextLabel to setup it's reference in the parser.
## Use this for any form of [i]_ready[/i] logic.
func initialize(inOwner: AdvancedRichTextLabel) -> void:
	owner = inOwner
	_parseRegex = RegEx.new()
	_parseRegex.compile(PARSE_TAG_PATTERN.replace("$", get_parse_tag()))
	pass

## Override this function for the actual string manipulation.
func parse(regexMatch: RegExMatch) -> String:
	return ""
