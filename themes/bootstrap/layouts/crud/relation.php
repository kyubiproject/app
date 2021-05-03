<?php
use kyubi\helper\Str;
use kyubi\ui\widgets\GridView;
use kyubi\ui\widgets\DetailView;
use yii\helpers\Html;
use yii\widgets\Pjax;
use yii\data\ActiveDataProvider;

if ($rel = model()->relations()[$relation] ?? null) {
    if ($rel['type'] == 'hasOne') {
        $model = model()->relation($relation);
        $model->setScenario($scenario ?? model()->scenario);
        switch (model()->scenario) {
            case 'create':
            case 'update':
                if ($form = get_param('__form')) {
                    echo Html::beginTag('div', array_merge([
                        'class' => 'form-row'
                    ], model()->config('sections')[$relation]['options'] ?? []));
                    foreach ($model->safeAttributes() as $attribute) {
                        echo $form->field($model, $attribute);
                    }
                    echo Html::endTag('div');
                }
                break;
            default:
                echo DetailView::widget([
                    'model' => $model,
                    'options' => [
                        'tag' => 'section',
                        'class' => 'form-row'
                    ],
                    'containerOptions' => [
                        'class' => 'col-12 col-md-6 col-lg-4'
                    ],
                    'valueOptions' => [
                        'class' => 'form-control-sm'
                    ]
                ]);
        }
    } elseif ($rel['type'] == 'hasMany') {
        $model = model()->relation($relation, false);
        $baseUrl = Str::replace(Str::slug($model->modelClass, true), '#^(.*)-models(-base)?\-(.*)$#', '/$1/$3/');
        if ($link ?? false) {
            if (is_string($link)) {
                $baseUrl = $link;
            }
            $key = array_key_first($model->link);
            echo Html::a('Añadir <i class="fa fa-plus"></i>', url([
                $baseUrl . 'create',
                $key => model()->getAttribute($model->link[$key])
            ]), [
                'class' => 'btn btn-sm btn-primary'
            ]);
        }
        $model->modelClass::recordScenario($scenario ?? 'search');
        Pjax::begin([
            'clientOptions' => []
        ]);
        echo GridView::widget([
            'dataProvider' => new ActiveDataProvider([
                'query' => $model
            ]),
            'tableOptions' => [
                'class' => 'table table-striped table-bordered'
            ],
            'layout' => '<header class="row"><div class="col">{summary}</div></header><main class="table-responsive my-2">{items}</main><footer class="d-flex justify-content-between">{summary}{pager}</footer>',
            'options' => [
                'id' => $relation . '-grid'
            ],
            'rowOptions' => function ($model, $key, $index, $grid) use ($relation) {
                return [
                    'id' => $relation . '-' . $index
                ];
            }
        ]);
        Pjax::end();
        view()->registerJs('
$(document).on("click", "[data-pjax-container] a[data-sort]", function(e) {
    let container = $(this).parents("[data-pjax-container]");
    if (container.length) {
         $.pjax.reload({url: this.href, container: "#" + container[0].id, async: false, push: false, replace: false});
    }
    return false;
});
$(document).on("click", "#' . $relation . '-grid tr[data-key]", function() {
    location.href = $app.url.create("' . ltrim($baseUrl, '/') . 'view/"+ this.dataset.key, "/");
});
');
    }
}