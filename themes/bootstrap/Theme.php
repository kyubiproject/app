<?php
namespace themes\bootstrap;

class Theme extends \kyubi\ui\base\Theme
{

    /**
     *
     * {@inheritdoc}
     * @see \kyubi\ui\base\Theme::beforeRender()
     */
    public function beforeRender(): bool
    {
        app()->params['navbar'] = require_file(__DIR__ . '/helpers/navbar.php');
        if (parent::beforeRender()) {
        }
        return true;
    }
}