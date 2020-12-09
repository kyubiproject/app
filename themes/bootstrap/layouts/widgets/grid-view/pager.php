<?php
use kyubi\helper\Arr;
use yii\helpers\ArrayHelper;
use yii\widgets\LinkPager;
/**
 *
 * @var \kyubi\ui\widgets\GridView $grid
 * @var \yii\data\Pagination $pagination
 * @var \kyubi\base\ActiveRecord $model
 */

if ($pagination !== false && $grid->dataProvider->getCount()) {
    $pagination->pageSize = get('per-page', $grid::$PAGE_SIZE);
    $pager = $grid->pager;
    $class = ArrayHelper::remove($pager, 'class', LinkPager::className());
    $pager['pagination'] = $pagination;
    echo $class::widget(Arr::join($pager, [
        'options' => [
            'class' => 'pagination pagination-sm'
        ],
        'disabledPageCssClass' => 'invisible',
        'maxButtonCount' => $grid::$PAGE_LIMIT,
        'nextPageLabel' => '<i class="fa fa-chevron-right"></i>',
        'prevPageLabel' => '<i class="fa fa-chevron-left"></i>',
        'firstPageLabel' => '<i class="fa fa-step-backward"></i>',
        'lastPageLabel' => '<i class="fa fa-step-forward"></i>',
        // 'disableCurrentPageButton' => true,
        'linkContainerOptions' => [
            'class' => 'page-item'
        ],
        'linkOptions' => [
            'class' => 'page-link'
        ]
    ]));
}