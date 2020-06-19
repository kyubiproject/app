<?php

class BackendModule extends WebModule
{

    public $theme = '@backend';

    public function getAssets()
    {
        if (! request()->isAjaxRequest) {
            cs()->registerCssFile(assets('css/style.css', 'backend.assets'));
            cs()->registerScriptFile(assets('js/scripts.js', 'backend.assets'), CClientScript::POS_END);
        }
    }

}
