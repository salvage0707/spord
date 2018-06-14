// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


// タグを選択したら背景色を変更
// あとで色を変更
function changeBgColor(className) {
	$(document).on('click', "." + className, function(e){
		const parent = $(this).parent();
		const input = $(document).find('input#' + $(this).attr('for'));
		// チェックボックスの状態で変化
		// console.log(alert('#' + $(this).attr('for')))
		if (input.prop('checked')) {
			input.prop('checked', false);
			$(this).parent().css('background-color', '#ccc');
		} else {
			$input.prop('checked', true);
			$(this).parent().css('background-color', 'red');
		}
	})
};

