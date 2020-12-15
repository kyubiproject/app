<?php
use kyubi\ui\widgets\GridView;
use kyubi\helper\Str;
use kyubi\ui\widgets\DetailView;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kyubi\base\model\RelationBehavior;
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
//$("header .btn-toolbar").append("<button class=\"btn btn-light text-danger\" data-forms>' . str_replace('"', '\"', t('app', 'Save all')) . '</button>");
$("header .btn-toolbar button[data-form]").attr("data-form", null).attr("data-forms", true);
$(document).on("click", "button[data-forms]", function(e) {
    $("form:first").prepend("<input type=\"hidden\" name=\"' . RelationBehavior::INPUT_NAME . '\" value=true>");
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