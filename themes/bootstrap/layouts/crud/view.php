<?php
/**
 * @var \yii\web\View $this
 * @var \kyubi\model\ActiveRecord $model
 */
use kyubi\ui\widgets\DetailView;
use yii\helpers\Html;

echo Html::beginTag('div', [
    'class' => 'card'
]);
echo DetailView::widget([
    'model' => $model,
    'options' => [
        'tag' => 'section',
        'class' => 'form-row card-body'
    ],
    'containerOptions' => [
        'class' => 'col-12 col-md-6 col-lg-4'
    ],
    'valueOptions' => [
        'class' => 'form-control-sm'
    ],
]);
echo Html::endTag('div');

echo render(alias('@theme/layouts/sections'));