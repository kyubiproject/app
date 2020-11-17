<?php
namespace themes\bootstrap;

class Theme extends \kyubi\base\Theme
{

    /**
     *
     * {@inheritdoc}
     * @see \kyubi\base\Theme::bootstap()
     */
    public function bootstap(): void
    {
        require_file(__DIR__ . '/helpers/helpers.php');
        app()->params['navbar'] = require_file(__DIR__ . '/helpers/navbar.php');
        if (controller()->hasProperty('templatesView')) {
            controller()->templatesView = '@themes/bootstrap/layouts/crud';
        }
        parent::bootstap();
    }

    /**
     *
     * {@inheritdoc}
     * @see \kyubi\base\Theme::beforeRender()
     */
    public function beforeRender(): bool
    {
        if (parent::beforeRender()) {
            // require_file(__DIR__ . '/helpers/helpers.php');
            // view()->registerMetaTag([
            // 'http-equiv' => 'X-UA-Compatible',
            // 'content' => 'IE=edge'
            // ], 'IE-edge');
            // view()->registerMetaTag([
            // 'name' => 'viewport',
            // 'content' => 'width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
            // ], 'viewport');
            // view()->registerLinkTag([
            // 'rel' => 'shortcut icon',
            // 'type' => 'image/png',
            // 'href' => asset(__DIR__ . '/assets') . '/img/icon.png'
            // ], 'icon');
            // // TODO: Revisar icon
            // view()->registerMetaTag([
            // 'name' => 'robots',
            // 'content' => 'noindex'
            // ], 'robots');
        }
        return true;
    }
}