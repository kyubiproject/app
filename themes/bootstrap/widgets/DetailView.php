<?php
namespace themes\bootstrap\widgets;

use yii\helpers\Html;

class DetailView extends \yii\widgets\DetailView
{

    public $containerOptions = [
        'class' => 'form-group col col-md-6 col-lg-4'
    ];

    public $valueOptions = [
        'class' => 'form-control'
    ];

    public $labelOptions = [
        'class' => 'control-label'
    ];

    public $template = '<div{containerOptions}>{label}{value}</div>';

    protected function renderAttribute($attribute, $index)
    {
        if (is_string($this->template)) {
            $terms = [];
            foreach ($attribute as $key => $value) {
                switch ($key) {
                    case 'value':
                        $options = array_merge($this->options, $attribute['options']['value'] ?? []);
                        $value = Html::tag('div', $value ?? $this->model->getAttribute($attribute['name']), $options);
                        break;
                    case 'label':
                        $options = array_merge($this->labelOptions, $attribute['options']['label'] ?? []);
                        $value = $value ? Html::label($value, Html::getInputName($this->model, $attribute['name']), $options) : Html::activeLabel($this->model, $attribute['name'], $options);
                        break;
                    case 'template':
                        if (! is_null($value)) {
                            $template = $value;
                            foreach ($attribute['params'] as $k => $val) {
                                if (! isset($terms[$k = '{' . $k . '}'])) {
                                    $terms[$k] = $val;
                                }
                            }
                        }
                        break;
                    default:
                        $value = null;
                }
                if (! is_null($value)) {
                    $terms['{' . $key . '}'] = $value;
                }
            }
            $terms['{containerOptions}'] = Html::renderTagAttributes(array_merge($this->containerOptions, [
                'data-field' => $attribute['name'],
                'data-type' => $attribute['type']
            ], $attribute['options']['container'] ?? []));
            return strtr($template ?? $this->template, $terms);
        }
        return call_user_func($this->template, $attribute, $index, $this);
    }
}
