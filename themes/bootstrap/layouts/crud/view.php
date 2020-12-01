<?php
// @var $this \yii\web\View
// @var $model \kyubi\base\ActiveRecord
use yii\widgets\ListView;
use themes\bootstrap\widgets\DetailView;
use kyubi\helper\Str;
use yii\data\ArrayDataProvider;
use yii\helpers\Html;

if (is_array($model)) {
    echo ListView::widget([
        'dataProvider' => new ArrayDataProvider([
            'allModels' => $model
        ]),
        'itemView' => basename(__FILE__, '.php'),
        'options' => [
            'id' => Str::kebab(ref(controller()->modelClass)->getShortName() . '-list')
        ]
    ]);
} elseif (is_object($model)) {
    echo DetailView::widget([
        'model' => $model,
        'attributes' => $model->fields(),
        'options' => [
            'tag' => 'section',
            'class' => 'form-row',
            'data-model' => basename(get_class($model)),
            'data-key' => $model->id
        ],
    ]);
}