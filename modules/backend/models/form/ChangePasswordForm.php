<?php

class ChangePasswordForm extends PasswordForm
{

    public $username;

    public $token;

    public function rules()
    {
        $rules[] = [
            'username',
            'exist',
            'allowEmpty' => false,
            'attributeName' => 'username',
            'className' => 'User',
            'on' => 'restore'
        ];
        $rules[] = [
            'token',
            'exist',
            'allowEmpty' => false,
            'attributeName' => 'token',
            'className' => 'User',
            'on' => 'restore'
        ];
        $rules[] = [
            'password, conf_password',
            'required'
        ];
        $rules[] = [
            'password',
            'validStrength'
        ];
        return $rules;
    }

    public function init()
    {
        if ($this->scenario == 'restore') {
            list ($this->username, $this->token) = UserModel::decryptToken(get('t'));
        }
    }

    protected function afterValidate()
    {
        if (! empty($this->errors)) {
            return;
        }
        if (user()->isGuest) {
            if (request()->isPostRequest && $this->password) {
                $params[':t0'] = $this->username;
                $params[':t1'] = $this->token;
                if ($user = User::model()->find('username=:t0 AND token=:t1', $params)) {
                    user()->login(new CUserIdentity($this->username, $this->password));
                    user()->start($this->username);
                }
            }
        } else {
            $user = User::model()->findByPk(user()->id);
        }
        if (isset($user) && $user) {
            $user->password = CPasswordHelper::hashPassword($this->password);
            $user->save();
            controller()->redirect(app()->homeUrl);
        }
    }
}
