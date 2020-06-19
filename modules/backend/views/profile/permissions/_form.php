<div id="permissions">
	<?php
foreach (map_controllers() as $moduleID => $module) {
    $out[] = '<div class="panel panel-default">';
    $out[] = '<div class="panel-heading" data-toggle="collapse" href="#set-' . $moduleID . '">';
    $out[] = (isset($module['icon']) ? "<i class=\"fa {$module['icon']}\"></i> " : null) . $module['name'];
    $out[] = '</div>';
    
    $out[] = '<div id="set-' . $moduleID . '" class="panel-collapse collapse in">';
    $out[] = '<div class="panel-body set-module row">';
    foreach ($module['controllers'] as $controllerID => $controller) {
        if (! isset($controller['actions'])) {
            continue;
        }
        $render = true;
        isset($it) ? $it ++ : $it = 0;
        $model = new Permission('insert');
        if (isset(post($model, [])[$it])) {
            $model->setAttributes(post($model)[$it]);
        } else {
            $model->route = $moduleID . '/' . $controllerID;
            if (! $owner->isNewRecord) {
                $saved = Permission::model()->findByAttributes([
                    'profile__id' => $owner->id,
                    'route' => $model->route
                ]);
                if ($saved) {
                    $model->setAttribute('actions', str_to_array($saved->actions));
                }
            }
        }
        $out[] = Html::activeHiddenField($model, "[{$it}]route");
        $out[] = '<div class="set-controller col-xs-6 col-md-4 col-lg-3">';
        $label = isset($controller['icon']) ? "<i class=\"fa {$controller['icon']}\"></i> " : null;
        $label .= Html::tag('span', [], (isset($controller['name']) ? $controller['name'] : $controllerID));
        $out[] = Html::tag('h4', [], Html::label($label, CHtml::activeId($model, "[{$it}]actions")));
        $out[] = Html::activeCheckBoxList($model, "[{$it}]actions", $controller['actions'], [
            'container' => 'ul class="list-unstyled"',
            'separator' => '',
            'template' => '<li>{input} {labelTitle}</li>',
            'checkAll' => Html::tag('u', [], Html::tag('i', [], t('kyubi', 'Select all')))
        ]);
        $out[] = '</div>';
    }
    $out[] = '</div>';
    $out[] = '</div>';
    $out[] = '</div>';
    if (isset($render)) {
        echo implode("\n", $out);
    }
    unset($out, $render);
}
?>
</div>