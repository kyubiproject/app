<?php

class PasswordForm extends CFormModel
{

    public $password;

    public $conf_password;

    public function rules()
    {
        $rules[] = [
            'password, conf_password',
            'safe'
        ];
        $rules[] = [
            'password',
            'validStrength'
        ];
        return $rules;
    }

    public function attributeLabels()
    {
        $attribute['password'] = t($this, 'password');
        $attribute['conf_password'] = t($this, 'conf_password');
        return $attribute;
    }

    public function validStrength($attribute)
    {
        $errors[] = $this->password == $this->conf_password;
        $errors[] = count(preg_split("/[a-z]/i", $this->password)) > 3;
        $errors[] = count(preg_split("/[\d]/", $this->password)) > 2;
        $errors[] = count(preg_split("/[A-Z]/", $this->password)) > 1;
        $errors[] = count(preg_split("/[^a-z0-9]/i", $this->password)) > 1;
        if (array_product($errors)) {
            return;
        }
        $this->addError($attribute, t($this, 'Your password does not meet the requirements'));
    }

    public function isEmpty()
    {
        if (request()->isPostRequest) {
            $this->setAttributes(post($this));
        }
        return empty($this->password) && empty($this->conf_password);
    }

    public function lang()
    {
        return 'backend.lang.form.password';
    }
}
