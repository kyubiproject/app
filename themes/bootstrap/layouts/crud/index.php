<?php
/**
 * @var \yii\web\View $this
 * @var \kyubi\base\ActiveRecord $model
 */
use themes\bootstrap\widgets\GridView;
use yii\widgets\Pjax;
use kyubi\helper\Str;


view()->blocks['toolbar'] = $model->toolbar ?? null;
Pjax::begin([
    'id' => 'ajax-grid',
    'clientOptions' => [
        'method' => 'POST'
    ]
]);
echo GridView::widget([
    'dataProvider' => $model->search(),
    'columns' => $model->safeAttributes(),
    'tableOptions' => ['class' => 'table table-striped table-bordered'],
    'layout' => '<header class="row"><div class="col">{summary}</div><div class="col d-none d-md-flex justify-content-lg-center">{pager}</div><div class="col">{buttons}</div></header><main class="table-responsive my-2">{items}</main><footer class="d-flex justify-content-between">{summary}{pager}</footer>',
    'options' => [
        'id' => Str::kebab(ref(controller()->modelClass)->getShortName() . '-grid')
    ],
    'rowOptions' => function ($model, $key, $index, $grid) {
        return [
            'id' => Str::kebab(ref(controller()->modelClass)->getShortName() . '-' . $index)
        ];
    }
]);
$this->registerJs('
$("[id$=\"-grid\"] .pagination [data-page], [id$=\"-grid\"] thead [data-sort]").each(function(i, ele) {
    $(ele).prop("href", ele.href.replace(/\/index(.*)/g, "$1"));
});
$(document).on("click", "tr[data-key]", function() {
    location.href = location.href.replace(/(.*)(\/index|\?).*$/g, "$1") + "/" + this.dataset.key;
});
', $this::POS_END);
Pjax::end();

require_file(controller()->getTemplatesPath('search-form.php'));
