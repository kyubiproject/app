<?php
use kyubi\ui\widgets\DetailView;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kyubi\base\model\RelationBehavior;

$relation = 'get' . ucfirst($relation);
$relation = model()->$relation();
if ($relation->multiple) {
    //echo __FILE__ . count($relation->all());
    // // view()->renderFile(__DIR__ . '/index.php', [
    // // 'dataProvider' => $relation->all()
    // // ]);
} else {
    $modelClass = $relation->modelClass;
    $model = $relation->one() ?? (new $modelClass());
    switch (model()->getScenario()) {
        case 'create':
        case 'update':
            $model->setScenario($model->isNewRecord ? 'create' : model()->getScenario());
            $form = ActiveForm::begin([
                'action' => '#',
                'fieldClass' => '\kyubi\ui\widgets\ActiveField',
                'errorCssClass' => 'is-invalid',
                'successCssClass' => 'is-valid',
                'validationStateOn' => 'input',
                'options' => [
                    'data-required' => false
                ]
            ]);
            echo Html::beginTag('div', [
                'class' => 'form-row'
            ]);
            foreach ($model->safeAttributes() as $attribute) {
                echo $form->field($model, $attribute);
            }
            echo Html::endTag('div');
            view()->registerJs('
$("header .btn-toolbar").append("<button class=\"btn btn-light text-danger\" data-forms>' . str_replace('"', '\"', t('app', 'Save all')) . '</button>");
$(document).on("click", "button[data-forms]", function(e) {
    $("form:first").prepend("<input type=\"hidden\" name=\"' . RelationBehavior::INPUT_NAME . '\">");
    $.post("", $("form").serialize());
    return true;
});
            ', view()::POS_END, 'catch-all');
            $form->end();
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
}