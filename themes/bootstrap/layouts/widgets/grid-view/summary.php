<?php 
/**
 * @var $grid \yii\grid\GridView
 * @var $pagination \yii\data\Pagination
 */
?>
<span  class="text-muted d-flex align-items-center">
	<i class="fa fa-file-o pr-2"></i>
	Pág. <?= $pagination->page + 1 ?> de <?= $pagination->pageCount ?>
	<span  class="btn btn-sm btn-primary ml-2 d-none d-lg-block">
	Registros <span class="badge badge-light rounded-pill"><?= $pagination->totalCount ?></span>
	</span>
</span>