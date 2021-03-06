<?php
/**
 * @var \yii\web\View $this
 * @var \kyubi\model\ActiveRecord $model
 */
use kyubi\ui\widgets\GridView;
use yii\widgets\Pjax;
use kyubi\helper\Str;

Pjax::begin([
    'clientOptions' => [
        'method' => 'POST'
    ],
    'options' => [
        'class' => 'card'
    ]
]);
echo GridView::widget([
    'dataProvider' => $model->search(),
    'tableOptions' => [
        'class' => 'table table-striped table-bordered'
    ],
    'layout' => '<header class="row"><div class="col">{summary}</div><div class="col d-none d-md-flex justify-content-lg-center">{pager}</div><div class="col">{buttons}</div></header><main class="table-responsive my-2">{items}</main><footer class="d-flex justify-content-between">{summary}{pager}</footer>',
    'options' => [
        'class' => 'card-body'
    ]
]);
Pjax::end();

$this->registerJs('
$("[id$=\"-grid\"] .pagination [data-page], [id$=\"-grid\"] thead [data-sort]").each(function(i, ele) {
    $(ele).prop("href", ele.href.replace(/\/index(.*)/g, "$1"));
});
$(document).on("click", "tr[data-key]", function() {
    location.href = $app.url.create("view/" + this.dataset.key);
});
', $this::POS_END);

require_file(controller()->getTemplatesPath('search-form.php'));
