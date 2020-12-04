<?php
/**
 * @param \yii\web\View $this
 * @var \kyubi\base\ActiveRecord $model
 * @var \themes\bootstrap\widgets\ActiveForm $form
 */
use yii\helpers\Html;
use themes\bootstrap\widgets\ActiveForm;

$form = ActiveForm::begin([]);
echo Html::beginTag('div', [
    'class' => 'form-row'
]);
foreach ($model->safeAttributes() as $attribute) {
    echo $form->field($model, $attribute);
}
echo Html::endTag('div');
echo Html::submitButton(t('kyubi', 'Save'), [
    'class' => 'btn btn-success'
]);
$form->end();
