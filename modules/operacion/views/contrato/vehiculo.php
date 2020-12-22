<?php
use kyubi\ui\widgets\DetailView;
use yii\helpers\Html;

foreach ([
    'entrega',
    'recogida'
] as $relation) {
    echo Html::beginTag('section');
    echo Html::tag('h4', 'Condiciones de ' . $relation);
    $model = model()->relation($relation);
    if (empty($model->fecha) && $form = get_param('__form')) {
        echo Html::beginTag('div', array_merge([
            'class' => 'form-row'
        ], model()->config('sections')[$relation]['options'] ?? []));
        foreach ($model->safeAttributes() as $attribute) {
            echo $form->field($model, $attribute);
        }
        echo Html::endTag('div');
    } else {
        echo DetailView::widget([
            'model' => $model,
            'options' => [
                'tag' => 'section',
                'class' => 'form-row'
            ]
        ]);
    }
    echo Html::endTag('section');
}