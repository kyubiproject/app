function initSelect2() {
	if (typeof $.fn.select2 == "function") {
		$.each($('select.select2'), function() {
			let config = {};
			if (this.dataset["ajax-Depend"] !== undefined) {
				let $data = JSON.parse(this.dataset["ajax-Depend"]);
				config.ajax = {
					data: function (params) {
						let $result = {
							term: params.term,						
							page: params.page
						};
						$.each($data, function(index, value) {
							$result[index] = $(value).length ? $(value)[0].value : value;	
						});
      					return $result;
					}
				};
			}
			if (this.dataset.tags !== undefined) {
				config.tags = this.dataset.tags; 
			}
			if (this.dataset.placeholder !== undefined) {
				config.placeholder =  this.dataset.placeholder;				
			}
			if (this.attributes.multiple === undefined){
				let value = this.value;
				if (value == undefined) {
					$(this).append('<option selected></option>');;
				}
				config.allowClear = this.dataset.allowClear;
			}
			config.escapeMarkup = function (m) { return m; };
			$(this).select2(config);
		});
	}
}

$(function () {
	$('[data-toggle=tooltip]').tooltip();
	initSelect2();
});

$(document).on("pjax:beforeSend", function(e) {
    if (e.relatedTarget && e.relatedTarget.tagName == "A") {
        location.href = e.relatedTarget.href;
        return false; 
    }
	return true;
});

$(document).on("click", "a[submit]", function() {
	if ($(this).attr("confirm") === undefined || confirm($(this).attr("confirm"))) {
		eval($(this).attr("on-submit") !== undefined ? $(this).attr("on-submit")  : null);		
		return fetch($(this).attr("submit"), {
			method: $(this).attr("type") !== undefined ? $(this).attr("type")  : 'POST',
			headers: {
				"X-CSRF-Token": $app.request.csrf
			}
		}).then(response => {
			if (this.attributes["on-success"] !== undefined) {
				eval(this.attributes["on-success"].nodeValue);				
			} else if (response.redirected) {
				window.location.href = response.url.replace(/\/index$/, '');
			}
			return false;
		});
	}
});
