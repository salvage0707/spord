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

	def user_image_tag(user, option = {})
		if user.image_id
			attachment_image_tag(user, iamge, class: option[:class] )
		else
			image_tag('no_user_image.jpg', class: option[:class] )
		end
	end

end
