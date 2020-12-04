<?php
namespace themes\bootstrap\widgets;

class ActiveField extends \yii\widgets\ActiveField
{

    public $options = [
        'class' => 'form-group col col-md-6 col-lg-4'
    ];

    public $errorOptions = [
        'class' => 'text-danger'
    ];
}