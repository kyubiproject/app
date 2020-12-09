<?php
/**
 * @var \yii\web\View $this
 * @var \yii\widgets\ActiveForm $form
 * @var \kyubi\ui\widgets\GridView $grid
 * @var \yii\data\Pagination $pagination
 * @var \kyubi\base\ActiveRecord $model
 */
use \yii\widgets\ActiveForm;
use yii\helpers\Html;

$formId = $grid->id . '-form';
?>
<div class="grid-buttons text-right">
	<a class="btn btn-sm btn-outline-primary" data-toggle="modal"
		data-target="#<?= $formId ?>" href="#"> <i class="fa fa-filter"></i>
	</a> <a class="btn btn-sm btn-outline-primary" href="#"
		data-id="<?= $grid->id ?>" data-grid="refresh"> <i
		class="fa fa-refresh"></i>
	</a>
</div>
<?php
$form = ActiveForm::begin([
    'action' => '#',
    'method' => 'GET',
    'enableClientValidation' => false,
    'fieldClass' => '\kyubi\ui\widgets\ActiveField',
    'errorCssClass' => 'is-invalid',
    'successCssClass' => 'is-valid',
    'validationStateOn' => 'input',
    'options' => [
        'id' => $formId,
        'class' => 'modal fade'
    ]
]);
?>
<div class="modal-dialog modal-lg modal-dialog-centered">
	<div class="modal-content">
		<div class="modal-header">
			<header class="w-100 d-flex justify-content-between align-items-baseline">
    			<h5 class="modal-title">
    				<?=t('app/base', 'Consulta detallada')?>
    			</h5>
    			<?= Html::checkbox('strict', get('strict'), [
    			    'label' => t('app/base', 'Búsqueda estricta'),
    			    'labelOptions' => ['class' => 'm-0 pr-3']
    			]);?>
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
eval('$model = new ' . get_class(model()) . ';');
$model->setScenario(basename(__DIR__));
$model->unsetAttributes();
$model->setAttributes(get('t', []));
foreach ($model->safeAttributes() as $attribute) {
    echo $form->field($model, $attribute, [
        'options' => [
            'class' => 'form-group col-12 col-lg-6'
        ]
    ]);
}
echo Html::endTag('div');
?>
</div>
		<div class="modal-footer d-flex justify-content-between">
			<button type="reset" class="btn btn-warning text-light"
				data-dismiss="modal">
				<i class="fa fa-eraser"></i> <?=t('app/base', 'Borrar filtros')?>
			</button>
			<button type="submit" class="btn btn-success">
				<i class="fa fa-search"></i> <?=t('app/base', 'Buscar')?>
			</button>
		</div>
	</div>
</div>
<?php
$form->end();
view()->registerJs('
$(document).on("click", "#' . $formId . ' button[type=reset]", function (e) {
    $("#' . $formId . '").find("input,select,textarea").val("");
    $("#' . $formId . '").trigger("submit");
});
$(document).on("beforeSubmit", "#' . $formId . '", function (e) {
    $.each($(this).find("input,select,textarea"), function(){
        if(this.value.length){
            this.name = this.name.replace(/\w+/, "t");
        } else {
            this.disabled = true;
        }
    });
});
$(document).on("click", "[data-grid=refresh]", function() {
    let container = $(this).parents("[data-pjax-container]")[0];
    $.pjax.reload({container: "#" + container.id, async: false});
});');