<?php

class RestoreForm extends CFormModel
{

    public $email;

    public function rules()
    {
        $rules[] = [
            'email',
            'required'
        ];
        $rules[] = [
            'email',
            'email'
        ];
        $rules[] = [
            'email',
            'exist',
            'allowEmpty' => false,
            'attributeName' => 'email',
            'className' => 'User'
        ];
        return $rules;
    }

    public function attributeLabels()
    {
        $attributes['email'] = t($this, 'email');
        return $attributes;
    }

    protected function afterValidate()
    {
        if (! empty($this->errors)) {
            return false;
        }
        $this->sendEmail();
    }

    protected function sendEmail()
    {
        $mail = app()->getComponent('mail');
        $params[':t0'] = $this->email;
        $user = User::model()->find("email=:t0", $params);
        $user->reset_token = uuid_create();
        $user->update();
        $to[] = $user->email;
        $to[] = $user->name;
        $mail->send(t('restore', 'Restore subject'), t('restore', 'Restore body', [
            '{user}' => $user->username,
            '{link}' => url('restore-password', [
                't' => UserModel::cryptToken($user)
            ])
        ]), $to);
    }

    public function lang()
    {
        return 'backend.lang.form.restore';
    }
}
