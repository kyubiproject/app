<?php

class LoginForm extends CFormModel
{

    public $username;

    public $password;

    public $rememberMe;

    private $__identity;

    public function rules()
    {
        $rules[] = [
            'username, password',
            'required'
        ];
        $rules[] = [
            'rememberMe',
            'boolean'
        ];
        $rules[] = [
            '__identity',
            'authenticate'
        ];
        return $rules;
    }

    public function attributeLabels()
    {
        $attributes['username'] = t($this, 'username');
        $attributes['password'] = t($this, 'password');
        $attributes['rememberMe'] = t($this, 'rememberMe');
        return $attributes;
    }

    public function authenticate($attribute)
    {
        if (is_null($this->__identity)) {
            $this->__identity = new CUserIdentity($this->username, $this->password);
        }
        $params[':t0'] = $this->username;
        if ($user = UserModel::model()->find('username=:t0 OR email=:t0', $params)) {
            if (CPasswordHelper::verifyPassword($this->password, $user->password)) {
                if ($user->is_active || $user->group == 'ROOT') {
                    user()->login($this->__identity, $this->rememberMe ? user()->authTimeout : 0);
                    user()->start($user->username);
                    return true;
                } else {
                    $this->addError($attribute, t($this, 'Your account is deactivated.'));
                    return false;
                }
            }
        }
        $this->addError($attribute, t($this, 'The data entered is not valid.'));
    }

    public function lang()
    {
        return 'backend.lang.form.login';
    }
}
