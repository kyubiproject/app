<?php

class DefaultController extends WebController
{
    
    const PUBLIC_ACTIONS = [
        'index',
        'toggle',
        'login',
        'logout',
        'restore-password',
        'profile'
    ];
    
    public function actions()
    {
        $actions['login'] = 'backend.actions.default.LoginAction';
        $actions['logout'] = 'backend.actions.default.LogoutAction';
        $actions['profile'] = 'backend.actions.default.ProfileAction';
        $actions['restore-password'] = 'backend.actions.default.RestoreAction';
        $actions['change-password'] = 'backend.actions.default.PasswordAction';
        //
        $actions['clear'] = 'backend.actions.default.ClearAction';
        return $actions;
    }
    
    public function filters()
    {
        if (! user()->isGuest) {
            $filters[] = 'accessControl - ' . implode(', ', self::PUBLIC_ACTIONS);
            $filters[] = 'ajaxOnly + toggle';
        } else {
            $filters = parent::filters();
        }
        return $filters;
    }
    
    public function accessRules()
    {
        if (preg_match('/(login|restore-password)$/', $this->action->id)) {
            $rules[] = str_rule('allow;*');
        } else {
            $rules = parent::accessRules();
        }
        return $rules;
    }
    
    public function getHeader()
    {
        if (user()->isGuest) {
            return;
        }
        echo '<h1 class="page-header">';
        echo get_label_action($this->action->id);
        echo '</h1>';
    }
    
    public function actionIndex()
    {
        $this->renderText("Welcome");
    }
    
    public function actionToggle()
    {
        user()->setState('wrappered', empty(user()->getState('wrappered')) ? 'wrappered' : '');
        response(user()->isGuest ? 403 : 204);
    }
    
    protected function beforeAction($action)
    {
        import('backend.models.form.*');
        switch ($action->id) {
            case 'index':
                break;
            case 'login':
                cs()->registerCssFile(assets('css/style.css', 'backend.widgets.password.assets'));
                cs()->registerScriptFile(assets('js/scripts.js', 'backend.widgets.password.assets'), CClientScript::POS_END);
            case 'restore':
                cs()->registerCssFile(assets('css/login.css', 'backend.assets'));
            default:
                controller()->layout = '//layouts/base';
        }
        return true;
    }
}