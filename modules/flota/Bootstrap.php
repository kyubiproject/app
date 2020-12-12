<?php
namespace flota;

class Bootstrap extends \kyubi\base\Bootstrap
{

    /**
     *
     * {@inheritdoc}
     * @see \kyubi\base\Bootstrap::bootWeb()
     */
    public function bootWeb($app): void
    {
        app()->urlManager->addRules([
            '<module:flota>/<controller:(tipo|tipo-carga)>/<action:(create|index)>' => '<module>/<controller>/<action>',
            '<module:flota>/<controller:(tipo|tipo-carga)>/<action:(update|delete)>/<id>' => '<module>/<controller>/<action>',
            '<module:flota>/<controller:(tipo|tipo-carga)>/<id>' => '<module>/<controller>/view'
        ]);
    }

    /**
     *
     * {@inheritdoc}
     * @see \kyubi\base\Bootstrap::bootConsole()
     */
    public function bootConsole($app): void
    {}
}