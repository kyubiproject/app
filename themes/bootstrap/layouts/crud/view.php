<?php
// @var $this \yii\web\View
// @var $model \kyubi\base\ActiveRecord
use yii\widgets\ListView;
use yii\widgets\DetailView;
use kyubi\helper\Str;
use yii\data\ArrayDataProvider;

if (is_array($model)) {
    echo ListView::widget([
        'dataProvider' => new ArrayDataProvider([
            'allModels' => $model
        ]),
        'itemView' => basename(__FILE__, '.php'),
        'options' => [
            'id' => Str::kebab(class_info(controller()->modelClass)->getShortName() . '-list')
        ]
    ]);
} elseif (is_object($model)) {
    echo DetailView::widget([
        'model' => $model,
        'attributes' => $model->safeAttributes(),
        'options' => [
            'id' => Str::kebab(class_info($model)->getShortName() . '-' . ($index ?? 'view')),
            'data-key' => $model->id
        ],
        'template' => function ($attribute, $index, $widget) {
            return "<tr data-field='{$attribute['attribute']}' data-type='{$attribute['format']}'><th>{$attribute['label']}</th><td>{$attribute['value']}</td></tr>";
        }
    ]);
}