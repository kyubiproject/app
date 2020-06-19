<?php

class PasswordAction extends CAction
{

    public function run()
    {
        $data['model'] = new ChangePasswordForm();
        if (request()->isPostRequest) {
            $data['model']->setAttributes(post($data['model']));
            $data['model']->validate();
        }
        controller()->render($this->id, $data);
    }
}
