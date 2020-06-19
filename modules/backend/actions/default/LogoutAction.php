<?php

class LogoutAction extends CAction
{

    public function __construct($controller, $id)
    {
        define('USER_ACCESS', true);
        parent::__construct($controller, $id);
    }

    public function run()
    {
        user()->logout();
        controller()->redirect(app()->homeUrl);
    }
}
