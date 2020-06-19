<?php

class ProfileModel extends Profile
{

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
        $buttons['extend']['active'] = [
            'label' => get_label_action('active'),
            'url' => url($route . '/active', $params, true),
            'on' => 'view',
            'type' => 'AJAX',
            'htmlOptions' => [
                'class' => 'btn-success'
            ],
            'ajaxOptions' => $ajaxOptions
        ];
        $buttons['extend']['inactive'] = [
            'label' => get_label_action('inactive'),
            'url' => url($route . '/inactive', $params, true),
            'on' => 'view',
            'type' => 'AJAX',
            'htmlOptions' => [
                'class' => 'btn-danger'
            ],
            'ajaxOptions' => $ajaxOptions
        ];
        return $buttons;
    }

    public function canActive()
    {
        return ! $this->is_active || $this->is_active == t($this, '_is_active')[0];
    }

    public function canInactive()
    {
        return ! $this->canActive();
    }

    public function buttonsGrid()
    {
        return '{extend.active} {extend.inactive} | {view} {update} | {delete}';
    }
}