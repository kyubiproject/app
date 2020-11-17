<?php
use yii\widgets\Breadcrumbs;

if ($links = (controller()->breadcrumb ?? true)) {
    if (! is_array($links)) {
        $links = [];
        $links[] = [
            'label' => '<i class="fa fa-home"></i>',
            'url' => app()->homeUrl
        ];
        if (module()->id !== 'app') {
            $links[] = [
                'label' => module()->id,
                'url' => url('/' . module()->id)
            ];
        }
        if (controller()->id !== module()->defaultRoute) {
            $links[] = [
                'label' => controller()->id,
                'url' => url('/' . controller()->uniqueId)
            ];
        }
        if (action()->id !== controller()->defaultAction) {
            $links[] = [
                'label' => action()->id,
                'url' => request()->getUrl()
            ];
        }
    }
    echo Breadcrumbs::widget([
        'tag' => 'ol',
        'itemTemplate' => '<li class="breadcrumb-item">{link}</li>',
        'activeItemTemplate' => '<li class="breadcrumb-item active">{link}</li>',
        'encodeLabels' => false,
        'homeLink' => false,
        'links' => $links
    ]);
}