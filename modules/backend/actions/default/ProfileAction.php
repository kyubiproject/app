<?php

class ProfileAction extends CAction
{

    public function run()
    {
        $model = new UserModel('view');
        $data['model'] = $model->findByPk(user()->id);
        controller()->render($this->id, $data);
    }
}
