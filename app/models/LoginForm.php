<?php
namespace app\models;

use yii\base\Model;

class LoginForm extends Model
{

    public $username;

    public $password;

    public $rememberMe = true;

    private $_user = false;

    public function rules()
    {
        return [
            [
                [
                    'username',
                    'password'
                ],
                'required'
            ],
            [
                'rememberMe',
                'boolean'
            ],
            [
                'password',
                'validatePassword'
            ]
        ];
    }

    public function attributeLabels()
    {
        return [
            'username' => 'Nombre de usuario',
            'password' => 'Contraseña',
            'rememberMe' => 'Mantener iniciada la sesión'
        ];
    }

    public function validatePassword($attribute, $params)
    {
        if (! $this->hasErrors()) {
            $this->_user = User::findOne([
                'username' => $this->username
            ]);
            if (! $this->_user || ! password_verify($this->password, $this->_user->password)) {
                $this->addError($attribute, 'Datos de acceso son incorrectos.');
            }
        }
    }

    public function login()
    {
        if ($this->validate()) {
            $this->_user->start();
            return app()->user->login($this->_user, $this->rememberMe ? 3600 * 24 * 30 : 0);
        }
        return false;
    }
}
