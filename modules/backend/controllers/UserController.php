<?php

class UserController extends CrudController
{

    public function accessRules()
    {
        if ($this->action->id === 'simulate' && user()->id !== user()->currentUser()) {
            $rules[] = str_rule('allow;@');
        } else {
            $rules[] = access($this->action->id) ? str_rule('allow;@') : str_rule('deny;*');
        }
        return $rules;
    }

    protected function beforeAction($action)
    {
        switch ($action->id) {
            case 'create':
            case 'update':
                import('backend.widgets.user.models.PasswordForm');
                break;
        }
        return parent::beforeAction($action);
    }

    public function actionSimulate($id = null)
    {
        if (is_null($id)) {
            user()->start(user()->currentUser(), false);
        } else {
            $user = UserModel::model()->findByPk($id);
            user()->start($user->id, false);
        }
    }

    public function actionToken($id)
    {
        $model = new UserModel('upgrade');
        $model = $model->findByPk($id);
        $model->setAttributes([
            'token' => db_uuid()
        ]);
        if ($model->update()) {
            response(200, $model->token);
        }
        response(304);
    }
}
