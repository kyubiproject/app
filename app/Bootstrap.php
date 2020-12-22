<?php
namespace app;

use kyubi\base\ActiveRecord;
use kyubi\helper\Str;
use yii\base\Event;
use yii\db\ActiveQuery;
use kyubi\ui\widgets\ActiveField;
use kyubi\ui\widgets\GridView;
use yii\web\NotFoundHttpException;

class Bootstrap extends \kyubi\base\Bootstrap
{

    /**
     *
     * {@inheritdoc}
     * @see \kyubi\base\Bootstrap::bootWeb()
     */
    public function bootWeb($app): void
    {
        defined('BASE_IVA') or define('BASE_IVA', 0.21);
        app()->setComponents([
            'user' => [
                'class' => 'yii\web\User',
                'identityClass' => 'app\models\User'
            ]
        ]);
        if (user('delegacion_id')) {
            Event::on(ActiveRecord::className(), ActiveRecord::EVENT_BEFORE_VALIDATE, function (Event $event) {
                if ($event->sender->hasAttribute('delegacion_id')) {
                    $event->sender->delegacion_id = user('delegacion_id');
                }
            });
            Event::on(ActiveRecord::className(), ActiveRecord::EVENT_INIT, function (Event $event) {
                if ($event->sender->hasAttribute('delegacion_id')) {
                    $event->sender->configure([
                        'attributes' => [
                            'delegacion_id' => [
                                'value' => ':' . user('delegacion'),
                                'format' => 'label',
                                'options' => [
                                    'input' => [
                                        'class' => 'disabled'
                                    ]
                                ]
                            ]
                        ]
                    ]);
                    $event->sender->delegacion_id = user('delegacion_id');
                }
            });
            Event::on(GridView::className(), GridView::EVENT_BEFORE_RUN, function (Event $event) {
                $columns = $event->sender->columns;
                foreach ($columns as $c => $column) {
                    if ($column->options['filtrer'] ?? true) {
                        if (Str::startWith($column->attribute, 'delegacion')) {
                            unset($event->sender->columns[$c]);
                        }
                    }
                }
            });
            Event::on(ActiveQuery::className(), ActiveQuery::EVENT_INIT, function (Event $event) {
                if (controller()->uniqueId != 'data') {
                    $modelClass = $event->sender->modelClass;
                    if (method_exists($modelClass, 'recordScenario')) {
                        switch ($modelClass::recordScenario()) {
                            case 'search':
                            case 'view':
                                if (model() && model()::tableName() !== $modelClass::tableName()) {
                                    return;
                                }
                            default:
                                if (isset($modelClass::getTableSchema()->columns['delegacion_id'])) {
                                    $event->sender->andWhere('delegacion_id=' . user('delegacion_id'));
                                }
                        }
                    }
                }
            });
            Event::on(ActiveRecord::className(), ActiveRecord::EVENT_AFTER_FIND, function (Event $event) {
                if (controller()->uniqueId != 'data') {
                    if (! defined('FILTER_MODEL')) {
                        $model = $event->sender;
                        switch ($model->getScenario()) {
                            case 'search':
                                break;
                            default:
                                if ($model->hasAttribute('delegacion_id') && $model->delegacion_id !== user('delegacion_id')) {
                                    throw new NotFoundHttpException('Model not found.', 404);
                                }
                        }
                        define('FILTER_MODEL', true);
                    }
                }
            });
        }
    }

    /**
     *
     * {@inheritdoc}
     * @see \kyubi\base\Bootstrap::bootConsole()
     */
    public function bootConsole($app): void
    {}
}