extends AnimatedSprite2D


func _on_coin_body_entered(body: Node2D) -> void:
	print("I'm a Coin!")
	queue_free()
