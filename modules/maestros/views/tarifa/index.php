<?php

/**
 * @param \yii\web\View $this
 * @var \kyubi\base\ActiveRecord $model
 * @var \yii\widgets\ActiveForm $form
 */
use yii\helpers\Html;
use yii\widgets\ActiveForm;

$model->setScenario('search-maestros');
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
$form->end();

view()->registerJs('
$("#' . $form->id . '").prev().find(".btn-toolbar").append("<button class=\"btn btn-success\" data-form=\"' . $form->id . '\">' . str_replace('"', '\"', t('app', 'Buscar')) . '</button>");
', view()::POS_END);