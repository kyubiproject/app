<?php
namespace app\base;

use kyubi\helper\Str;
use yii\helpers\Html;

class Controller extends \kyubi\api\controllers\CrudController
{

    /**
     *
     * @return \ReflectionClass
     */
    public function reflection()
    {
        return ref($this)->getParentClass();
    }

    /**
     *
     * @param array $params
     * @return NULL|string
     */
    public function getTitle(array $params = [])
    {
        $params['{controller}'] = t($this->module->id, $this->uniqueId);
        switch ($action = action()->id) {
            case 'index':
                $string = '{controller}';
                break;
            case 'create':
                $string = $action . ' {controller}';
                break;
            case 'view':
            case 'update':
                if (! model()) {
                    return;
                }
                $string = $action . ' {controller} {model}';
                $params['{model}'] = model()->name ?? null;
                break;
            default:
                return;
        }
        return t($params['t'] ?? 'app/base', $string, $params);
    }

    /**
     *
     * @return NULL|string
     */
    public function getToolbar()
    {
        if (method_exists($this->modelClass, 'buttons') && model() && count($buttons = model()->buttons())) {
            $output = $this->renderButtons($buttons);
        }
        return $output ?? null;
    }

    /**
     *
     * @param array $buttons
     * @return NULL|string
     */
    public function renderButtons(array $buttons = [])
    {
        $output = null;
        foreach ($buttons as $action => $options) {
            if (isset($options['buttons'])) {
                $output .= Html::beginTag('div', [
                    'class' => 'btn-group',
                    'id' => 'btns-' . $action
                ]);
                $output .= $this->renderButtons($options['buttons']);
                $output .= Html::endTag('div');
            } else {
                if (isset($options['on']) && ! in_array(model()->getScenario(), Str::toArray($options['on'], ' '))) {
                    continue;
                }
                if (method_exists($options, 'can') && ! $options->can(action()->id)) {
                    continue;
                }
                $output .= $this->renderButton($action, $options);
            }
        }
        return $output;
    }

    /**
     *
     * @param string $action
     * @param array $options
     * @return string
     */
    public function renderButton(string $action, array $options = [])
    {
        $label = $options['label'] ?? t(module()->id, $action);
        $url = $options['url'] ?? $this->createUrl($action, $options['params'] ?? []);
        $options['class'] = $options['class'] ?? 'btn btn-light';
        if (($options['type'] ?? 'GET') !== 'GET') {
            $options['submit'] = $url;
            if (! isset($options['before-send']) && ($options['confirm'] ?? true) !== false) {
                $options['confirm'] = t(module()->id, $options['confirm'] ?? 'Are you sure you want to {action} this item?', [
                    'action' => Str::lower(strip_tags(t(module()->id, $action)))
                ]);
                $options['before-send'] = 'confirm("' . preg_quote($options['confirm']) . '")';
            }
            $url = '#';
        }
        unset($options['label'], $options['url'], $options['params'], $options['on']);
        return Html::a($label, $url ?? '#', $options);
    }

    /**
     *
     * @return array
     */
    public function getSections(): array
    {
        return method_exists(model(), 'config') ? (model()->config('sections') ?? []) : [];
    }
}