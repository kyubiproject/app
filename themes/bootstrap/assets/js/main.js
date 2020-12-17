$(function () {
  $('[data-toggle=tooltip]').tooltip();
});

$(document).on("click", "a[submit]", function() {
	if ($(this).attr("before-send") === undefined || eval($(this).attr("before-send"))) {
		var link = $(this);
		return fetch($(this).attr("submit"), {
			method: $(this).attr("type") !== undefined ? $(this).attr("type")  : 'POST',
			headers: {
				"X-CSRF-Token": $app.request.csrf
			}
		}).then(response => {
			if (response.redirected) {
				window.location.href = response.url.replace(/\/index$/, '');
			}
		});
	}
});
