<?php
use kyubi\ui\widgets\DetailView;
use yii\helpers\Html;

if ($rel = model()->relations()[$relation] ?? null) {
    $fn = 'get' . ucfirst($relation);
    $modelClass = $rel['refClass'];
    $model = model()->$fn()->one() ?? (new $modelClass());
    switch ($model->getScenario()) {
        case 'create':
        case 'update':
            if ($form = get_param('__form')) {
                $model->setScenario($model->isNewRecord ? 'create' : model()->getScenario());
                echo Html::beginTag('div', array_merge([
                    'class' => 'form-row'
                ], model()->config('sections')[$relation]['options'] ?? []));
                foreach ([
                    'vehiculo_matricula'
                ] as $attribute) {
                    echo $form->field($model, $attribute);
                }
                echo Html::endTag('div');
            }
            break;
        default:
            if (! $model->isNewRecord) {
                echo DetailView::widget([
                    'model' => $model,
                    'attributes' => [
                        'vehiculo_matricula'
                    ],
                    'options' => [
                        'tag' => 'section',
                        'class' => 'form-row'
                    ]
                ]);
            }
    }
}