<?php 
/**
 * @var $grid \yii\grid\GridView
 * @var $pagination \yii\data\Pagination
 */
?>
<span  class="text-muted d-flex align-items-center">
	<i class="fa fa-file-o pr-2"></i>
	Pág. <?= $pagination->page + 1 ?> de <?= $pagination->pageCount ?>
	<span  class="btn btn-primary btn-sm ml-2">
	Registros <span class="badge badge-light rounded-pill"><?= $pagination->totalCount ?></span>
	</span>
</span>