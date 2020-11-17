<?php
// @var $this \yii\web\View
// @var $model \kyubi\base\ActiveRecord
use themes\bootstrap\widgets\GridView;
use kyubi\helper\Str;

echo GridView::widget([
    'dataProvider' => $model->search(),
    'columns' => $model->safeAttributes(),
    'layout' => '{pager}{items}',
    'options' => [
        'id' => Str::kebab(class_info(controller()->modelClass)->getShortName() . '-grid')
    ],
    'rowOptions' => function ($model, $key, $index, $grid) {
        return [
            'id' => Str::kebab(class_info(controller()->modelClass)->getShortName() . '-' . $index)
        ];
    }
]);

view()->registerJs('
$("[id$=\"-grid\"] .pagination [data-page], [id$=\"-grid\"] thead [data-sort]").each(function(i, ele) {
    $(ele).prop("href", ele.href.replace(/\/"' . action()->id . '"(.*)/g, "$1"));
});', $this::POS_END);