<?php
/**
 * @param \yii\web\View $this
 * @var \kyubi\base\ActiveRecord $model
 * @var \themes\bootstrap\widgets\ActiveForm $form
 */
use yii\helpers\Html;
use themes\bootstrap\widgets\ActiveForm;

$form = ActiveForm::begin([
    'action' => '#',
    'method' => 'GET',
    'enableClientValidation' => false,
    'options' => [
        'id' => 'grid-filters',
        'class' => 'modal fade'
    ]
]);
?>
<div class="modal-dialog modal-lg modal-dialog-centered">
	<div class="modal-content">
		<div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">Búsqueda detallada</h5>
			<button type="button" class="close" data-dismiss="modal">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="modal-body">
<?php
echo Html::beginTag('div', [
    'class' => 'form-row'
]);
$model = model();
$model->setAttributes(get('t', []));
foreach ($model->safeAttributes() as $attribute) {
    echo $form->field($model, $attribute, [
        'options' => [
            'class' => 'form-group col col-lg-6'
        ]
    ]);
}
echo Html::endTag('div');
?>
</div>
		<div class="modal-footer d-flex justify-content-between">
			<button type="reset" class="btn btn-warning text-light"
				data-dismiss="modal">
				<i class="fa fa-eraser"></i> Borrar filtros
			</button>
			<button type="submit" class="btn btn-success">
				<i class="fa fa-search"></i> Buscar
			</button>
		</div>
	</div>
</div>
<?php $form->end(); ?>
<?php
view()->registerJs('
$(document).on("click", "#grid-filters button[type=reset]", function (e) {
    $("#grid-filters").find("input,select,textarea").attr("disabled");
    $("#grid-filters").trigger("submit");
});
$(document).on("beforeSubmit", "#grid-filters", function (e) {
    $.each($(this).find("input,select,textarea"), function(){
        if(this.value.length){
            this.name = this.name.replace(/\w+/, "t");
        } else {
            this.disabled = true;
        }
    });
});');
?>