<?php
if (! isset($onlyFields)) {
    $form = $this->beginWidget("CActiveForm", [
        "clientOptions" => [
            "validateOnChange" => true
        ]
    ]);
}
$this->widget('backend.widgets.password.PasswordWidget', [
    'form' => $form,
    'model' => $model
]);
if (! isset($onlyFields)) {
    echo Html::htmlButton(t('backend.base', "Change password"), [
        "class" => "btn btn-primary btn-block",
        "type" => "submit"
    ]);
    $this->endWidget();
}