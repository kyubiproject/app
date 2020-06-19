<?php

class UserModel extends User
{

    protected $_password;

    protected function beforeSave()
    {
        if ($this->isNewRecord && post('welcome')) {
            $this->sendWelcome();
        } elseif (post('PasswordForm')) {
            import('backend.models.form.PasswordForm');
            $pass = new PasswordForm();
            if (! $pass->isEmpty()) {
                if ($pass->validate()) {
                    $this->password = CPasswordHelper::hashPassword($pass->password);
                } else {
                    return false;
                }
            }
        }
        return parent::beforeSave();
    }

    public function sendWelcome()
    {
        $this->password = CPasswordHelper::hashPassword($pass = self::randPassword());
        if (empty($this->errors)) {
            $mail = app()->getComponent('mail');
            $to[] = $this->email;
            $to[] = $this->name;
            $mail->send(t($this, 'Welcome subject', [
                '{app}' => app()->name
            ]), t($this, 'Welcome body', [
                '{app}' => app()->name,
                '{name}' => ucwords($this->name),
                '{username}' => $this->username,
                '{password}' => $pass,
                '{refer}' => ucwords(user()->name),
                '{url}' => url(app()->baseUrl)
            ]), $to);
        }
    }

    public function access()
    {
        return user()->access($this->id);
    }

    /**
     * Devuelve una contraseña aleatoria
     *
     * @return string
     */
    public static function randPassword()
    {
        $term[] = substr(str_shuffle('aaeeiioouu'), - 1 * rand(1, 2));
        $term[] = substr(str_shuffle('abcdefghijklmnopqrstuvwxyz'), - 1 * rand(2, 3));
        $term[] = substr(str_shuffle(strtoupper('abcdefghijklmnopqrstuvwxyz')), - 1 * rand(3, 4));
        $term[] = substr(str_shuffle('00112233445566778899'), - 1 * rand(3, 4));
        $term[] = substr(str_shuffle('!@#$%^&*().,'), - 1 * rand(1, 2));
        return str_shuffle(implode('', $pass));
    }

    public function canSimulate()
    {
        return $this->id != user()->id;
    }

    public function canView()
    {
        return true;
    }

    public function canUpdate()
    {
        return $this->id != user()->id && $this->canView();
    }

    public function canDelete()
    {
        return $this->canUpdate();
    }

    public function buttons($route = null)
    {
        $buttons = parent::buttons();
        if (empty($route)) {
            $route = controller()->uniqueId;
        }
        if (model() && ! model()->isNewRecord) {
            $params['id'] = model()->id;
        } else {
            $params = [];
        }
        $buttons['extend'] = [
            '__class' => 'btn-info'
        ];
        $ajaxOptions['success'] = 'function(data, jqXHR){location.reload();}';
        $buttons['extend']['simulate'] = [
            'label' => get_label_action('simulate'),
            'url' => url($route . '/simulate', $params, true),
            'on' => 'view',
            'type' => 'AJAX',
            'ajaxOptions' => $ajaxOptions
        ];
        return $buttons;
    }

    public function buttonsGrid()
    {
        return '{extend.simulate} | {view} {update} | {delete}';
    }
}