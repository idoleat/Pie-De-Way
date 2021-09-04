extends Panel

onready var title = get_node("Title")
onready var comment = get_node("Comment")

func switch_visible(is_visible : bool):
	visible = is_visible
	title.visible = is_visible
	comment.visible = is_visible

func change_ending_texts(title_text : String, comment_text : String):
	title.text = title_text
	comment.text = comment_text
