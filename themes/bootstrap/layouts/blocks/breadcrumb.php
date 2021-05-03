<?php
use yii\widgets\Breadcrumbs;

if (($links = controller()->breadcrumb ?? true) === true) {
    $links = [];
    $links[] = [
        'label' => '<i class="fa fa-home"></i>',
        'url' => app()->homeUrl
    ];
    if (module()->id !== 'app') {
        $links[] = [
            'label' => t( module()->id, module()->id),
            'url' => false
        ];
    }
    if (controller()->uniqueId !== module()->defaultRoute) {
        $links[] = [
            'label' => t(controller()->uniqueId, module()->id),
            'url' => url('/' . controller()->uniqueId)
        ];
    }
    if (model() && ! model()->isNewrecord) {
        $links[] = [
            'label' => model()->name ?? null,
            'url' => false
        ];
    } elseif (action()->id !== controller()->defaultAction) {
        $links[] = [
            'label' => t(action()->id, module()->id),
            'url' => false
        ];
    }
}
if (is_array($links) && count($links) > 1) {
    echo Breadcrumbs::widget([
        'tag' => 'ol',
        'itemTemplate' => '<li class="breadcrumb-item">{link}</li>',
        'activeItemTemplate' => '<li class="breadcrumb-item active">{link}</li>',
        'encodeLabels' => false,
        'homeLink' => false,
        'links' => $links
    ]);
}