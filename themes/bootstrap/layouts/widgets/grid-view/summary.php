<?php 
/**
 * @var \kyubi\ui\widgets\GridView $grid
 * @var \yii\data\Pagination $pagination
 */
if (! app()->getUrlManager()->enablePrettyUrl) {
    view()->registerJs('$("a[href*=\"public.php\"]").each(function() {
            this.href = this.href.replace("public.php","public/index.php");
        });');
}
?>
<span  class="grid-summary text-muted d-flex align-items-center">
	<!--<i class="fa fa-file-o pr-2"></i>-->
	Pág. <?= $pagination->page + 1 ?> de <?= ceil($pagination->totalCount / $pagination->pageSize) ?>
	<!--<span  class="btn btn-sm btn-primary ml-2 d-none d-lg-block">
	Registros <span class="badge badge-light rounded-pill"><?= $pagination->totalCount ?></span>
	</span>-->
	<span>Registros <?= $pagination->totalCount ?></span>
</span>