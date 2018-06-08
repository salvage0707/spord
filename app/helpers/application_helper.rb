module ApplicationHelper

	# <li>
	# 	<p>text1</p>
	# 	<p>text2</p>
	# </li>
	def detail_list(text1, text2)
		content_tag('li') do
			concat content_tag('p', text1)
			concat content_tag('p', text2)
		end
	end
end
