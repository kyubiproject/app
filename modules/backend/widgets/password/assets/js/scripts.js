setTimeout(function() {
	$("input[id*=password]").attr("readonly",null);
}, 300);

$("a.show-password").on("click", function() {
	var $container = $(this);
	var $input = $(this).closest(".control-group").children("input");
	$input.attr("type", function(index, attr) {
		if (attr == "password") {
			$container.addClass("slash");
			return "text";
		} else {
			$container.removeClass("slash");
			return "password";
		}
	});
});
