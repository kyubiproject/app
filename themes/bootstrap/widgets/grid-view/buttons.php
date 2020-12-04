<?php
/**
 * @var \yii\web\View $this
 * @var \yii\grid\GridView $grid
 */
?>
<div class="grid-buttons text-right">
	<a class="btn btn-sm btn-outline-primary"
		data-toggle="modal" data-target="#grid-filters" href="#">
		<i class="fa fa-filter"></i>
	</a>
	<a class="btn btn-sm btn-outline-primary" href="#"
		data-id="<?= $grid->id ?>" data-grid="refresh">
		<i class="fa fa-refresh"></i>
	</a>
</div>
<?php
$this->registerJs('
$(document).on("click", "[data-grid=refresh]", function() {
    $.pjax.reload({container: "#ajax-grid", async: false});
});');