<?php
// @var $this \yii\web\View
// @var $model \kyubi\base\ActiveRecord
// @var $form \yii\widgets\ActiveForm
use yii\helpers\Html;
use yii\widgets\ActiveForm;

if (isset($form)) {
    echo $form->render();
} else {
    $form = ActiveForm::begin([]);
    // $this->render('_form', [
    // 'form' => $form,
    // 'model' => $model
    // ]);
    foreach ($model->safeAttributes() as $attribute) {
        echo $form->field($model, $attribute);
    }
    echo Html::submitButton(t('kyubi', 'Save'), [
        'class' => 'btn btn-success float-right'
    ]);
    $form->end();
}