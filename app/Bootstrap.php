<?php
namespace app;

use Kyubi;
use kyubi\model\ActiveRecord;
use kyubi\db\Query;
use yii\base\Event;
use yii\db\ActiveQuery;
use yii\web\NotFoundHttpException;
use app\base\Controller;
use yii\web\ForbiddenHttpException;

class Bootstrap extends \kyubi\base\Bootstrap
{

    /**
     *
     * {@inheritdoc}
     * @see \kyubi\base\Bootstrap::bootWeb()
     */
    public function bootWeb($app): void
    {
        alias('@bower', $app->vendorPath . '/yidas/yii2-bower-asset/bower');
    }

    /**
     *
     * {@inheritdoc}
     * @see \kyubi\base\Bootstrap::bootConsole()
     */
    public function bootConsole($app): void
    {}
}