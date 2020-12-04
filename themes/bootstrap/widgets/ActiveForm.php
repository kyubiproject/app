<?php
namespace themes\bootstrap\widgets;

class ActiveForm extends \yii\widgets\ActiveForm
{

    public $fieldClass = 'themes\bootstrap\widgets\ActiveField';

    public $errorCssClass = 'is-invalid';

    public $successCssClass = 'is-valid';

    public $validationStateOn = 'input';
}