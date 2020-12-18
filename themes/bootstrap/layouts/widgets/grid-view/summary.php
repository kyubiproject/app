<?php 
/**
 * @var \kyubi\ui\widgets\GridView $grid
 * @var \yii\data\Pagination $pagination
 */
?>
<span  class="text-muted d-flex align-items-center">
	<i class="fa fa-file-o pr-2"></i>
	Pág. <?= $pagination->page + 1 ?> de <?= ceil($pagination->totalCount / $grid::$PAGE_SIZE) ?>
	<span  class="btn btn-sm btn-primary ml-2 d-none d-lg-block">
	Registros <span class="badge badge-light rounded-pill"><?= $pagination->totalCount ?></span>
	</span>
</span>