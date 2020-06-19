<?php

class LoginAction extends CAction
{

    public function run()
    {
        if (user()->isGuest) {
            $data['model'] = new LoginForm();
            if (request()->isPostRequest) {
                $data['model']->setAttributes(post($data['model']));
                if ($data['model']->validate()) {
                    controller()->redirect(user()->returnUrl);
                }
            }
            controller()->render($this->id, $data);
        } else {
            controller()->redirect(app()->homeUrl);
        }
    }
}
