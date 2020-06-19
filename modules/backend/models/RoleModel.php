<?php

class RoleModel extends Role
{
    public function getListUsers()
    {
        return Html::listData(UserModel::model()->findAll(), 'id', 'username');
    }
}
