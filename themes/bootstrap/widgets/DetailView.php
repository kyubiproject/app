<?php
namespace themes\bootstrap\widgets;

use kyubi\helper\Arr;
use yii\helpers\Html;

class DetailView extends \yii\widgets\DetailView
{

    public $tagName = 'div';

    public $tagValue = 'div';

    public $template = '<{tagName}{containerOptions}>{label}{value}</{tagName}>';

    protected function renderAttribute($attribute, $index)
    {
        if (is_string($this->template)) {
            $terms['{tagName}'] = 'div';
            foreach ($attribute as $key => $value) {
                if (is_array($value)) {
                    switch ($key) {
                        case 'containerOptions':
                            $value = array_merge([
                                'class' => 'form-group col-md-6',
                                'data-field' => $attribute['name'],
                                'data-type' => $attribute['type']
                            ], $value);
                            break;
                        case 'value':
                            $value = Html::tag($value ?? $this->model->getAttributeLabel($attribute['name']));

                            array_merge([
                                'class' => 'form-control'
                            ], $value);
                            break;
                        case 'label':
                            $value = $this->renderLabel($value ?? $this->model->getAttributeLabel($attribute['name']));
                            break;
                    }
                }
                $terms['{' . $key . '}'] = is_array($value) ? Html::renderTagAttributes($value) : $value;
            }
            dd($terms, strtr($this->template, $terms));
            return strtr($this->template, $terms);
        }
        return call_user_func($this->template, $attribute, $index, $this);
    }

    protected function renderLabel($attribute, $options = [])
    {
        echo Html::activeLabel($this->model, $attribute['name'], null, $options);
    }
}
