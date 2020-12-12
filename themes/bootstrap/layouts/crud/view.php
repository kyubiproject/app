<?php
/**
 * @var \yii\web\View $this
 * @var \kyubi\base\ActiveRecord $model
 */
use kyubi\ui\widgets\DetailView;

echo DetailView::widget([
    'model' => $model,
    'options' => [
        'tag' => 'section',
        'class' => 'form-row'
    ]
]);
echo get_block('sections');