<?php
/**
 * @param \yii\web\View $this
 * @var \kyubi\base\ActiveRecord $model
 * @var \yii\widgets\ActiveForm $form
 */
use yii\helpers\Html;
use yii\widgets\ActiveForm;

$form = ActiveForm::begin([
    'fieldClass' => '\kyubi\ui\widgets\ActiveField',
    'errorCssClass' => 'is-invalid',
    'successCssClass' => 'is-valid',
    'validationStateOn' => 'input'
]);
echo Html::beginTag('div', [
    'class' => 'form-row'
]);
foreach ($model->safeAttributes() as $attribute) {
    echo $form->field($model, $attribute);
}
echo Html::endTag('div');
view()->registerJs('
$("#' . $form->id . '").prev().find(".btn-toolbar").append("<button class=\"btn btn-success\" data-form=\"#' . $form->id . '\">' . str_replace('"', '\"', t('kyubi', 'Save')) . '</button>");
$(document).on("click", "button[data-form]", function() {
    $(this.dataset.form).trigger("submit");
})', view()::POS_END);

$form->end();