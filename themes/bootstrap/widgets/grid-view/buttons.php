<?php
/**
 * @var $this \yii\web\View
 * @var $grid \yii\grid\GridView
 */
?>
<div class="grid-buttons text-right">
	<a class="btn btn-sm btn-outline-primary"
		data-toggle="modal" data-target="#grid-filters" href="#">
		<i class="fa fa-filter"></i>
	</a>
	<a class="btn btn-sm btn-primary" href="#"
		data-id="<?= $grid->id ?>" data-grid="refresh">
		<i class="fa fa-refresh"></i>
	</a>
</div>
<form class="modal fade" id="grid-filters" tabindex="-1">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Búsqueda detallada</h5>
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
					<div class="form-group">
						<label for="recipient-name" class="col-form-label">Name:</label>
						<input type="text" class="form-control" id="recipient-name">
					</div>
			</div>
			<div class="modal-footer d-flex justify-content-between">
				<button type="reset" class="btn btn-warning text-light" data-dismiss="modal">
					<i class="fa fa-eraser"></i> Borrar filtros
				</button>
				<button type="submit" class="btn btn-success">
					<i class="fa fa-search"></i> Buscar
				</button>
			</div>
		</div>
	</div>
</form>
<?php
$this->registerJs('
$(document).on("click", "#grid-filters button[type=submit]", function () {
    console.log($("#grid-filters form").serialize());
});
$(document).on("click", "[data-grid=refresh]", function() {
    $.pjax.reload({container: "#ajax-grid", async: false});
});');