<div id="permissions">
	<?php
foreach (map_controllers() as $moduleID => $module) {
    $out[] = '<div class="panel panel-default">';
    $out[] = '<div class="panel-heading" data-toggle="collapse" href="#set-' . $moduleID . '" data-parent="#permissions">';
    $out[] = (isset($module['icon']) ? "<i class=\"fa {$module['icon']}\"></i> " : null) . $module['name'];
    $out[] = '</div>';
    
    $out[] = '<div id="set-' . $moduleID . '" class="panel-collapse collapse in">';
    $out[] = '<div class="panel-body set-module row">';
    foreach ($module['controllers'] as $controllerID => $controller) {
        isset($it) ? $it ++ : $it = 0;
        if (empty($controller) || empty($model = Permission::model()->findByAttributes([
            'profile__id' => $owner->id,
            'route' => $moduleID . '/' . $controllerID
        ]))) {
            continue;
        }
        foreach (str_to_array($model->actions) as $action) {
            if (isset($controller['actions'][$action])) {
                $actions[] = $controller['actions'][$action];
            }
        }
        if (isset($actions)) {
            $render = true;
            $out[] = '<div class="set-controller col-xs-6 col-md-4 col-lg-3">';
            $label = isset($controller['icon']) ? "<i class=\"fa {$controller['icon']}\"></i> " : null;
            $label .= Html::tag('span', [], (isset($controller['name']) ? $controller['name'] : $controllerID));
            $out[] = Html::tag('h4', [], Html::label($label, CHtml::activeId($model, "[{$it}]actions")));
            $out[] = Html::activeCheckBoxList($model, "[{$it}]actions", $actions, [
                'container' => 'ul class="list-unstyled"',
                'separator' => '',
                'template' => '<li>{labelTitle}</li>'
            ]);
            $out[] = '</div>';
            unset($actions);
        }
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