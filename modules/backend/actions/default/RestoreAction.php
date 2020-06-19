<?php

class RestoreAction extends CAction
{

    public function run()
    {
        if (user()->isGuest) {
            if (get('t')) {
                $data['model'] = new ChangePasswordForm('restore');
                $params[':t0'] = $data['model']->username;
                $params[':t1'] = $data['model']->token;
                if (! User::model()->exists('username=:t0 AND token=:t1 AND token_expire>NOW()', $params)) {
                    user()->setFlash('danger', t('restore', 'The link to reset your password is invalid.'));
                    controller()->redirect(controller()->createUrl('restore-password'));
                }
            } else {
                $data['model'] = new RestoreForm();
            }
            if (request()->isPostRequest) {
                $data['model']->setAttributes(post($data['model']));
                if ($data['model']->validate() && $data['model'] instanceof RestoreForm) {
                    user()->getFlash('danger');
                    user()->setFlash('success', t('restore', 'We have sent to your email the steps to reset your password.'));
                    controller()->redirect(controller()->createUrl('restore-password'));
                }
            }
            controller()->render($this->id, $data);
        } else {
            controller()->redirect(app()->homeUrl);
        }
    }
}
