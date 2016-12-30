//left
$(document).ready(function () {
	$(document).on("keyup", function (event) {
		if (event.which == 37) {
			$("#previous-link").trigger('click');
		}
	});
});
//right
$(document).ready(function () {
	$(document).on("keyup", function (event) {
		if (event.which == 39) {
			$("#next-link").trigger('click');
		}
	});
});
//random
$(document).ready(function () {
	$(document).on("keyup", function (event) {
		if (event.which == 191) {
			$("#random-link")[0].click();
		}
	});
});
