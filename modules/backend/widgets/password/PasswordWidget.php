<?php

class PasswordWidget extends CWidget
{

    public $form;

    public $model;

    public $password = "password";

    public $conf_password = "conf_password";

    public function init()
    {
        $assets = 'backend.widgets.password.assets';
        cs()->registerCssFile(assets('css/style.css', $assets));
        cs()->registerScriptFile(assets('js/scripts.js', $assets), CClientScript::POS_END);
    }

    public function run()
    {
        import('backend.models.form.PasswordForm');
        if (! $this->model) {
            $this->model = new PasswordForm();
        }
        if (! $this->model->isEmpty()) {
            $this->model->validate();
        }
        $this->render('index', [
            'form' => $this->form,
            'model' => $this->model,
            'password' => $this->password,
            'conf_password' => $this->conf_password
        ]);
    }
}