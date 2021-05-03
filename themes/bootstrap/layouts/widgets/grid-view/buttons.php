<?php
/**
 * @var \yii\web\View $this
 * @var \yii\widgets\ActiveForm $form
 * @var \kyubi\ui\widgets\GridView $grid
 * @var \yii\data\Pagination $pagination
 * @var \kyubi\model\ActiveRecord $model
 */
use yii\widgets\ActiveForm;
use yii\helpers\Html;

?>
<div class="grid-buttons text-right">
	<a class="btn btn-sm btn-outline-primary" data-toggle="modal"
		data-target="#search-form" href="#"> <i class="fa fa-search"></i>
	</a> <a class="btn btn-sm btn-outline-primary ml-0" href="#"
		data-id="<?= $grid->id ?>" data-grid="refresh"> <i
		class="fa fa-refresh"></i>
	</a>
</div>
<?php
$form = ActiveForm::begin([
    'enableClientValidation' => false,
    'fieldConfig' => [
        'class' => '\kyubi\ui\widgets\ActiveField',
        'options' => [
            'class' => 'col-12 col-md-6 col-lg-4'
        ],
        'inputOptions' => [
            'class' => 'form-control-sm'
        ]
    ],
    'errorCssClass' => 'is-invalid',
    'successCssClass' => 'is-valid',
    'validationStateOn' => 'input',
    'options' => [
        'id' => 'search-form',
        'class' => 'modal fade',
        'data-required' => false
    ]
]);
?>
<div class="modal-dialog modal-lg modal-dialog-centered">
	<div class="modal-content">
		<div class="modal-header">
			<header
				class="w-100 d-flex justify-content-between align-items-baseline">
				<h5 class="modal-title">
    				<?=t( 'Consulta detallada')?>
    			</h5>
    			<?=Html::checkbox('strict', get('strict', ! request()->isPjax), ['name' => 'strict','label' => t('Búsqueda estricta'),'labelOptions' => ['class' => 'm-0 pr-3']]);?>
			</header>
			<button type="button" class="close" data-dismiss="modal">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="modal-body">
<?php
echo Html::beginTag('div', [
    'class' => 'form-row'
]);
$model = model()::instance();
$model->setScenario($model->hasScenario('searchForm') ? 'searchForm' : 'search');
$model->setAttributes(get($model, []));
foreach ($model->safeAttributes() as $name) {
    echo $form->field($model, $name);
}
echo Html::endTag('div');
?>
</div>
		<div class="modal-footer d-flex justify-content-between">
			<button type="reset" class="btn btn-warning text-light">
				<?=t( 'reset-search')?>
			</button>
			<button type="submit" class="btn btn-success">
				<?=t( 'search')?>
			</button>
		</div>
	</div>
</div>
<?php
$form->end();
if (! request()->isPjax) {
    view()->registerJs('
    $(document).on("click", "#search-form button[type=reset]", function (e) {
        $("#search-form .form-row").find(":input:visible").val("");
        $("#search-form").trigger("submit");
        return false;
    });
    $(document).on("beforeSubmit", "#search-form", function (e) {
        let container = $(this).parents("[data-pjax-container]");
        if (container.length) {
             $.pjax.reload({url: this.href, container: "#" + container[0].id, type: "POST", data: $(this).serialize()});
        }
        $("#search-form [data-dismiss=modal]").click();
    	initSelect2();
        return false;
    });
    $(document).on("click", "[data-pjax-container] [data-grid=refresh]", function() {
        let container = $(this).parents("[data-pjax-container]");
        if (container.length) {
             $.pjax.reload({url: this.href, container: "#" + container[0].id});
        }
        return false;
    });');
}
view()->registerJs('
$("#search-form").on("show.bs.modal", function (event) {
    initSelect2();
});');
    