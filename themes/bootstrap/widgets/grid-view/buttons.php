<?php
// @var $this \yii\web\View
// @var $grid \themes\bootstrap\widgets\GridView
?>
<div class="grid-buttons">
	<a class="btn btn-sm btn-primary pull-right" href="#"
		data-id="<?= $grid->id ?>" data-grid="refresh">
		<i class="fa fa-refresh"></i>
	</a>
	<a class="btn btn-sm btn-outline-primary"
		data-toggle="modal" data-target="#grid-filters" href="#">
		<i class="fa fa-filter"></i>
	</a>
</div>
<div class="modal fade" id="grid-filters" tabindex="-1"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">New message</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group">
						<label for="recipient-name" class="col-form-label">Name:</label>
						<input type="text" class="form-control" id="recipient-name">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Apply</button>
			</div>
		</div>
	</div>
</div>
<?php
if (! request()->isAjax) {
    view()->registerJs('
    $(document).on("click", "[data-grid=refresh]", function() {
        $.pjax.reload({container: "#ajax-grid", async: false});
    });');
}
?>