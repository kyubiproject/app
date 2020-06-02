<?php
namespace help;

use kyubi\base\Module as BaseModule;
use yii\base\BootstrapInterface;

/**
 * `help` module definition class.
 */
class Module extends BaseModule implements BootstrapInterface
{

    /**
     *
     * @var string
     */
    public $controllerNamespace = __NAMESPACE__ . '\\controllers';

    /**
     *
     * @see \yii\base\Module::init()
     */
    public function init(): void
    {
        parent::init();
    }
    
    /**
     *
     * @see \yii\base\BootstrapInterface::bootstrap()
     */
    public function bootstrap($app): void
    {
        if ($app instanceof \yii\web\Application) {
            //
        } elseif ($app instanceof \yii\console\Application) {
	        //
        }
    }
    
}