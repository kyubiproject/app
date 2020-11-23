<?php
/**
 * @var $this \yii\web\View
 * @var $model \kyubi\base\ActiveRecord
 */
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
    'layout' => '<header class="row"><div class="col">{summary}</div><div class="col d-none d-md-flex justify-content-lg-center">{pager}</div><div class="col">{buttons}</div></header><main class="table-responsive my-2">{items}</main><footer class="d-flex justify-content-between">{summary}{pager}</footer>',
    'options' => [
        'id' => Str::kebab(class_info(controller()->modelClass)->getShortName() . '-grid')
    ],
    'rowOptions' => function ($model, $key, $index, $grid) {
        return [
            'id' => Str::kebab(class_info(controller()->modelClass)->getShortName() . '-' . $index)
        ];
    }
]);
$this->registerJs('
$("[id$=\"-grid\"] .pagination [data-page], [id$=\"-grid\"] thead [data-sort]").each(function(i, ele) {
    $(ele).prop("href", ele.href.replace(/\/index(.*)/g, "$1"));
});', $this::POS_END);
Pjax::end();