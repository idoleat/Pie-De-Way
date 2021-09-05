extends Panel

onready var title = $Title
onready var comment = $Comment

func change_ending_texts(title_text : String, comment_text : String):
	title.text = title_text
	comment.text = comment_text
