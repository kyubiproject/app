<?php
/**
 * @var \yii\web\View $this
 * @var \kyubi\base\ActiveRecord $model
 */
use kyubi\ui\widgets\DetailView;

echo DetailView::widget([
    'model' => $model,
    'attributes' => $model->fields(),
    'options' => [
        'tag' => 'section',
        'class' => 'form-row',
        'data-model' => basename(get_class($model)),
        'data-key' => $model->id
    ]
]);
echo get_block('sections');