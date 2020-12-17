<?php
use kyubi\ui\widgets\GridView;
use kyubi\helper\Str;
use kyubi\ui\widgets\DetailView;
use yii\helpers\Html;
use yii\data\ActiveDataProvider;

if ($rel = model()->relations()[$relation] ?? null) {
    $relation = 'get' . ucfirst($relation);
    $relation = model()->$relation();
    switch ($rel['type']) {
        case 'hasOne':
            $modelClass = $relation->modelClass;
            $model = $relation->one() ?? (new $modelClass());
            switch (model()->getScenario()) {
                case 'create':
                case 'update':
                    if ($form = get_param('__form')) {
                        $model->setScenario($model->isNewRecord ? 'create' : model()->getScenario());
                        echo Html::beginTag('div', [
                            'class' => 'form-row'
                        ]);
                        foreach ($model->safeAttributes() as $attribute) {
                            echo $form->field($model, $attribute);
                        }
                        echo Html::endTag('div');
                    }
                    break;
                default:
                    if (! $model->isNewRecord) {
                        echo DetailView::widget([
                            'model' => $model,
                            'options' => [
                                'tag' => 'section',
                                'class' => 'form-row'
                            ]
                        ]);
                    }
            }
            break;
        case 'hasMany':
            if (is_object($relation)) {
                echo GridView::widget([
                    'dataProvider' => new ActiveDataProvider([
                        'query' => $relation
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
            break;
    }
}