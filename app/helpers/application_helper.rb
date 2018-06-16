module ApplicationHelper

	# <li>
	# 	<p>text1</p>
	# 	<p>text2</p>
	# </li>
	def detail_list(text1, text2 = "",&block)
		content_tag('li') do
			concat content_tag('p', text1)
			concat content_tag('p', text2)
			# ブロックを渡すと表示
			yield if block_given?
		end
	end

	# ユーザーの画像を出力
	def uesr_image_tag(uesr, option = {})
		if uesr.image_id
			attachment_image_tag(uesr, :iamge, class: option[:class] )
		else
			image_tag('no_user_image.jpg', class: option[:class] )
		end
	end

	# モデルの画像を出力
	# no imageを入れたい
	def model_image_tag(model, option = {})
		if model.image_id
			attachment_image_tag(model, :iamge, class: option[:class] )
		else
			input = image_tag('no_sports_image.jpg', class: option[:class])
			# input += "NO IMAGE"
			# input
		end
	end


	# スポーツの画像を出力
	# 大きい方　=> type: :big
	# 小さい方 => type: :small
	def sports_image_tag(sports, option = {type: :small})
		# 小さい画像
		if option[:type] == :small
			if sports.big_image_id
				attachment_image_tag(sports, :big_iamge, class: option[:class] )
			else
				image_tag('no_user_image.jpg', class: option[:class] )
			end
		# 大きい画像
		elsif option[:type] == :big
			if sports.image_id
				attachment_image_tag(sports, :iamge, class: option[:class] )
			else
				image_tag('no_user_image.jpg', class: option[:class] )
			end
		end
	end

end
