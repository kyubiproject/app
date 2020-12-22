<?php
use kyubi\ui\widgets\GridView;
use kyubi\helper\Str;
use kyubi\ui\widgets\DetailView;
use yii\helpers\Html;
use yii\data\ActiveDataProvider;

if ($rel = model()->relation($relation) ?? null) {
    $model = model()->relation($relation);
    if ($model instanceof \kyubi\base\ActiveRecord) {
        switch (model()->getScenario()) {
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
                    ]
                ]);
        }
    } elseif ($model) {
        echo GridView::widget([
            'dataProvider' => new ActiveDataProvider([
                'query' => $model
            ]),
            'tableOptions' => [
                'class' => 'table table-striped table-bordered'
            ],
            'layout' => '<header class="row"><div class="col">{summary}</div></header><main class="table-responsive my-2">{items}</main><footer class="d-flex justify-content-between">{summary}{pager}</footer>',
            'options' => [
                'id' => Str::kebab(ref(controller()->modelClass)->getShortName() . '-grid')
            ],
            'rowOptions' => function ($model, $key, $index, $grid) {
                return [
                    'id' => Str::kebab(ref(controller()->modelClass)->getShortName() . '-' . $index)
                ];
            }
        ]);
    }
}