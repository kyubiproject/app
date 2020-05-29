<?php
namespace app;

use yii\base\BootstrapInterface;

class Bootstrap implements BootstrapInterface
{

    /**
     *
     * {@inheritdoc}
     * @see \yii\base\BootstrapInterface::bootstrap()
     * @param $app \yii\base\Application
     */
    public function bootstrap($app)
    {
        if ($app instanceof \yii\web\Application) {
            //
        } elseif ($app instanceof \yii\console\Application) {
            //
        }
    }
}