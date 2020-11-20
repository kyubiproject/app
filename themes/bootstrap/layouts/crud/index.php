<?php
// @var $this \yii\web\View
// @var $model \kyubi\base\ActiveRecord
use themes\bootstrap\widgets\GridView;
use yii\widgets\Pjax;
use kyubi\helper\Str;

Pjax::begin([
    'id' => 'ajax-grid',
    'clientOptions' => [
        'method' => 'POST'
    ]
]);
echo GridView::widget([
    'dataProvider' => $model->search(),
    'columns' => $model->safeAttributes(),
    'layout' => '<header class="d-flex justify-content-between">{summary}{buttons}</header>{items}<footer class="d-flex justify-content-between">{summary}{pager}</footer>',
    'options' => [
        'id' => Str::kebab(class_info(controller()->modelClass)->getShortName() . '-grid')
    ],
    'rowOptions' => function ($model, $key, $index, $grid) {
        return [
            'id' => Str::kebab(class_info(controller()->modelClass)->getShortName() . '-' . $index)
        ];
    }
]);
Pjax::end();

view()->registerJs('
$("[id$=\"-grid\"] .pagination [data-page], [id$=\"-grid\"] thead [data-sort]").each(function(i, ele) {
    $(ele).prop("href", ele.href.replace(/\/index(.*)/g, "$1"));
});', view()::POS_END);