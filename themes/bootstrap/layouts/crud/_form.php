<?php
/**
 * @param \yii\web\View $this
 * @var \kyubi\model\ActiveRecord $model
 * @var \yii\widgets\ActiveForm $form
 */
use yii\helpers\Html;
use yii\widgets\ActiveForm;

set_param('__form', $form = ActiveForm::begin([
    'fieldConfig' => [
        'class' => '\kyubi\ui\widgets\ActiveField',
        'options' => [
            'class' => 'col-12 col-md-6 col-lg-4'
        ],
        'inputOptions' => [
            'class' => 'form-control-sm'
        ]
    ],
    'errorCssClass' => 'is-invalid',
    'successCssClass' => 'is-valid',
    'validationStateOn' => 'input'
]));

echo Html::beginTag('div', [
    'class' => 'card'
]);
echo Html::beginTag('div', [
    'class' => 'form-row card-body'
]);
foreach ($_GET as $attribute => $value) {
    if ($model->canSetProperty($attribute)) {
        $model->$attribute = $value;
    }
}
foreach ($model->safeAttributes() as $attribute) {
    echo $form->field($model, $attribute);
}
if (count($errors = $model->getErrors('__error'))) {
    echo strtr('<span class="alert alert-danger col-12 my-0 mx-1 px-3">{errors}</span>', [
        '{errors}' => implode('<br>', $errors)
    ]);
}
echo Html::endTag('div');
echo Html::endTag('div');

view()->registerJs('
$("header .btn-toolbar").append("<button class=\"btn btn-sm btn-danger\" onclick=\"window.history.back()\">' . str_replace('"', '\"', t('Cancel')) . '</button>");
$("header .btn-toolbar").append("<button class=\"btn btn-sm btn-success\" data-form=\"' . $form->id . '\">' . str_replace('"', '\"', t('Save')) . '</button>");
', view()::POS_END);

echo render(alias('@theme/layouts/sections'));
