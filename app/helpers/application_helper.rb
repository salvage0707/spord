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
	def user_image_tag(uesr, option = {})
		if uesr.image_id
			attachment_image_tag(uesr, :image, class: option[:class] )
		else
			image_tag('no_user_image.jpg', class: option[:class] )
		end
	end

	# boardの画像を出力
	def board_image_tag(board, option = {})
		if board.image_id
			attachment_image_tag(board, :image, class: option[:class] )
		else
			image_tag('no_sports_image.jpg', class: option[:class])
		end
	end

	def community_image_url(board)
		if board.image_id
			attachment_url(board, :image)
		else
			asset_url('no_sports_image.jpg')
		end
	end


	# スポーツの画像を出力
	# 大きい方　=> type: :big
	# 小さい方 => type: :small
	def sports_image_tag(sports, option = {type: :small})
		# 小さい画像
		if option[:type] == :small
			if sports.big_image_id
				attachment_image_tag(sports, :big_image, class: option[:class] )
			else
				image_tag('no_user_image.jpg', class: option[:class] )
			end
		# 大きい画像
		elsif option[:type] == :big
			if sports.image_id
				attachment_image_tag(sports, :image, class: option[:class] )
			else
				image_tag('no_user_image.jpg', class: option[:class] )
			end
		end
	end

end
