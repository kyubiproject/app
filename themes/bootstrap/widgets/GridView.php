<?php
namespace themes\bootstrap\widgets;

use kyubi\helper\Arr;
use yii\helpers\ArrayHelper;
use yii\widgets\LinkPager;

class GridView extends \yii\grid\GridView
{

    const PAGE_SIZE = 10;

    const PAGE_LIMIT = 5;

    // public showOnEmpty = false;
    public function renderSection($name)
    {
        if (file_exists($filename = __DIR__ . '/grid-view/' . substr($name, 1, - 1) . '.php')) {
            return $this->renderFile($filename, [
                'grid' => $this,
                'pagination' => $this->dataProvider->getPagination()
            ]);
        }
        return parent::renderSection($name);
    }

    public function renderPager()
    {
        $pagination = $this->dataProvider->getPagination();
        if ($pagination === false || $this->dataProvider->getCount() <= 0) {
            return '';
        }
        $pagination->pageSize = get('per-page', self::PAGE_SIZE);
        /* @var $class LinkPager */
        $pager = $this->pager;
        $class = ArrayHelper::remove($pager, 'class', LinkPager::className());
        $pager['pagination'] = $pagination;
        return $class::widget(Arr::join($pager, [
            'options' => [
                'class' => 'pagination pagination-sm'
            ],
            'disabledPageCssClass' => 'invisible',
            'maxButtonCount' => self::PAGE_LIMIT,
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
}
