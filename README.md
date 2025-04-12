# Advanced-Rich-Text-Label
Godot's RichTextLabel with custom BBcode and custom parsing.

## Usage
### `AdvancedRichTextLabelParser`
Parses text using this RegEx pattern `[tag]something[/tag]`, where `tag` can be any BBcode you want.

> [!NOTE]
> Remember to overwrite `get_parse_tag()` to return the desired tag.

---
### `AdvancedRichTextLabel`
Contains a list of `AdvancedRichTextLabelParser` that do the parsing. This class uses a weird trick to self trigger `_set(property, value)` using `set("text", text)`.

> [!NOTE]
> `reparse()` should be called when `AdvancedRichTextLabelParser` received updates to manually reevaluate the text. It is not needed when other classes call `AdvancedRichTextLabel.text = 'some text'`.

