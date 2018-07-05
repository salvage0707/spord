// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


// タグを選択したら背景色を変更
// あとで色を変更
function changeBgColor(className) {
	$(document).on('click', "." + className, function(e){
		const parent = $(this).parent();
		const input = '#' + $(this).attr('for');
		// チェックボックスの状態で変化
		if ($(input).prop('checked')) {
			$(this).parent().css('background-color', '#e0ffff');
			// console.log(alert('111'));
		} else {
			$(this).parent().css('background-color', '#ccc');
		}
	})
};


function itemSlid(tag) {
	$(tag).hover(function(){
		item_now_text = $(this).text();
		const add_text = $(this).data("add")
		 $(this).stop().animate({'marginLeft':'15px', 'content':'tesuto'},'normal');
		 $(this).text(add_text)
	},function(){
		 $(this).stop().animate({'marginLeft':'-15px', 'content':'tesuto'},'normal');
		 $(this).text(item_now_text)
	})
}
