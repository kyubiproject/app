<?php
namespace app;

use kyubi\base\ActiveRecord;
use yii\base\Event;
use yii\db\ActiveQuery;
use yii\web\NotFoundHttpException;

class Bootstrap extends \kyubi\base\Bootstrap
{

    public static $catch;

    /**
     *
     * {@inheritdoc}
     * @see \kyubi\base\Bootstrap::bootWeb()
     */
    public function bootWeb($app): void
    {
        if (is_int(user('delegacion_id'))) {
            Event::on(ActiveQuery::className(), ActiveQuery::EVENT_INIT, function (Event $event) {
                if (isset($event->sender->modelClass::getTableSchema()->columns['delegacion_id'])) {
                    $event->sender->andWhere('delegacion_id=' . user('delegacion_id'));
                }
            });
            $foo = &self::$catch;
            Event::on(ActiveRecord::className(), ActiveRecord::EVENT_AFTER_FIND, function (Event $event) use (&$foo) {
                if (is_null($foo)) {
                    if (is_numeric($delegacion = $event->sender->delegacion_id ?? null)) {
                        if ($delegacion !== user('delegacion_id')) {
                            throw new NotFoundHttpException('Model not found.', 404);
                        }
                    }
                }
                $foo = true;
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