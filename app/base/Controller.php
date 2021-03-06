<?php
namespace app\base;

use kyubi\helper\Str;
use yii\filters\AccessControl;
use yii\helpers\Html;

class Controller extends \kyubi\api\controllers\CrudController
{

//     public function behaviors()
//     {
//         $behaviors = parent::behaviors();
//         $behaviors['access'] = [
//             'class' => AccessControl::className(),
//             'rules' => [
//                 [
//                     'allow' => true,
//                     'roles' => [
//                         '@'
//                     ]
//                 ]
//             ]
//         ];
//         return $behaviors;
//     }

    /**
     *
     * @param array $params
     * @return NULL|string
     */
    public function getTitle(array $params = [])
    {
        switch ($action = action()->id) {
            case 'index':
                $title = $this->uniqueId;
                $string = '{controller}';
                break;
            case 'create':
                $title = $this->id;
                $string = $action . ' {controller}';
                break;
            case 'view':
            case 'update':
                $title = $this->id;
                if (! model()) {
                    return;
                }
                $string = $action . ' {controller} {model}';
                $params['{model}'] = $params['{model}'] ?? model()->name ?? null;
                break;
            default:
                return;
        }
        $params['{controller}'] = t($title, $this->module->id);
        return t($string, $params['t'] ?? $this->module->id, $params);
    }

    /**
     *
     * @return NULL|string
     */
    public function getToolbar()
    {
        if (count($buttons = $this->buttons())) {
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
                if (! empty($content = $this->renderButtons($options['buttons']))) {
                    $output .= Html::tag('div', $content, [
                        'class' => 'btn-group',
                        'id' => 'btns-' . $action
                    ]);
                }
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
        $label = $options['label'] ?? t($action, module()->id);
        $url = $options['url'] ?? $this->createUrl($action, $options['params'] ?? []);
        $options['class'] = $options['class'] ?? 'btn btn-sm btn-light';
        if (($options['type'] ?? 'GET') !== 'GET') {
            $options['submit'] = $url;
            if (($options['confirm'] ?? true) !== false) {
                $options['confirm'] = t($options['confirm'] ?? 'Are you sure you want to {action} this item?', module()->id, [
                    'action' => Str::lower(strip_tags(t($action, module()->id)))
                ]);
                $options['confirm'] = preg_quote($options['confirm']);
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
        if (is_array($config = model()::config('sections'))) {
            foreach ($config as $name => $section) {
                $term = explode('@', $name, 2);
                $name = array_shift($term);
                if (! count($term) || in_array(model()->getScenario(), Str::toArray(array_pop($term), ' '))) {
                    if (empty($section)) {
                        $section = $name;
                    }
                    if (is_string($section)) {
                        $sections[$name] = [
                            'view' => $section
                        ];
                    }
                    if (is_array($section)) {
                        if (isset($section['relation'])) {
                            $section['view'] = $section['view'] ?? '@themes/bootstrap/layouts/crud/relation';
                        }
                        $section['params'] = $section;
                        $sections[$name] = $section;
                    }
                }
            }
        }
        return $sections ?? [];
    }

    // TODO: Valorar reubicación de botones
    /**
     *
     * @param array $params
     * @param array $buttons
     * @return array
     */
    public function buttons(array $params = [], array $buttons = null): array
    {
        if (model()) {
            if (! model()->isNewRecord) {
                $params['id'] = model()->getPrimaryKey();
            }
            $buttons['curd']['buttons']['create'] = [
                'url' => url('create', true),
                'on' => 'search view'
            ];
            // $buttons['curd']['buttons']['view'] = [
            // 'url' => url(array_merge([
            // 'view'
            // ], $params), true),
            // 'on' => 'update'
            // ];
            $buttons['curd']['buttons']['update'] = [
                'url' => url(array_merge([
                    'update'
                ], $params), true),
                'on' => 'view'
            ];
            $buttons['curd']['buttons']['delete'] = [
                'url' => url(array_merge([
                    'delete'
                ], $params), true),
                'options' => [
                    'data' => [
                        'method' => 'POST'
                    ]
                ],
                'on' => 'view',
                'type' => 'POST',
                'on-success' => 'location.href = "' . url('/' . controller()->uniqueId) . '"'
            ];
            foreach ([
                'prev',
                'next'
            ] as $it) {
                $item = model()->find()
                    ->andWhere('id' . ($it == 'next' ? '>' : '<') . ':t0', [
                    ':t0' => model()->primaryKey
                ])
                    ->one();
                $buttons['nav']['buttons'][$it] = [
                    'url' => $item ? url(array_merge([
                        'view'
                    ], [
                        'id' => $item->id
                    ]), true) : false,
                    'on' => 'view'
                ];
            }
        }
        return $buttons ?? [];
    }
}