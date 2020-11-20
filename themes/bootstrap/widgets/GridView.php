<?php
namespace themes\bootstrap\widgets;

use kyubi\helper\Arr;
use yii\helpers\ArrayHelper;
use yii\widgets\LinkPager;

class GridView extends \yii\grid\GridView
{

    public function renderSection($name)
    {
        switch ($name) {
            case '{buttons}':
                return $this->renderButtons();
            default:
                return parent::renderSection($name);
        }
    }

    public function renderButtons()
    {
        // cs()->registerScript('grid-view', '
        // $(document).on("click", "thead tr:not(.filters)", function() {
        // $(this).parent().find("tr.filters").toggle();
        // });
        // $(document).on("click", "[data-grid=refresh]", function() {
        // $.fn.yiiGridView.update(this.dataset.id);
        // });
        // $(document).on("change", ".container-search input, .container-search select", function() {
        // $.fn.yiiGridView.update($(this).closest(".container-search")[0].dataset.id, {data: JSON.parse(\'{"\' + this.name + \'":"\' + this.value + \'"}\')});
        // });
        // $(document).on("click", ".container-search button", function() {
        // $.fn.yiiGridView.update($(this).closest(".container-search")[0].dataset.id, {data: JSON.parse(\'{"t":"\' + this.nextSibling.value + \'"}\')});
        // });
        // $(document).on("click", ".customize-container .dropdown-menu [filter-col]", function() {
        // $(this).parent().hasClass("active") ? $(this).parent().removeClass("active") : $(this).parent().addClass("active");
        // var cols = [];
        // var curr = $(this).closest(".customize-container");
        // if (curr.length && (curr = curr[0])) {
        // $(curr).find("li.active [filter-col]").each(function(i, ele) {
        // cols.push($(ele).attr("filter-col"));
        // });
        // $.fn.yiiGridView.update(curr.dataset.id, {data: JSON.parse(\'{"cols":"\' + cols.join(",") + \'"}\')});
        // }
        // return false;
        // });');
        return $this->renderFile(__DIR__ . '/grid-view/buttons.php', [
            'grid' => $this
        ]);
    }

    public function renderPager()
    {
        $pagination = $this->dataProvider->getPagination();
        if ($pagination === false || $this->dataProvider->getCount() <= 0) {
            return '';
        }
        /* @var $class LinkPager */
        $pager = $this->pager;
        $class = ArrayHelper::remove($pager, 'class', LinkPager::className());
        $pager['pagination'] = $pagination;
        return $class::widget(Arr::join($pager, [
            'options' => [
                'class' => 'pagination pagination-sm'
            ],
            'disabledPageCssClass' => 'invisible',
            'maxButtonCount' => 5,
            'nextPageLabel' => '<i class="fa fa-chevron-right"></i>',
            'prevPageLabel' => '<i class="fa fa-chevron-left"></i>',
            'firstPageLabel' => '<i class="fa fa-step-backward"></i>',
            'lastPageLabel' => '<i class="fa fa-step-forward"></i>',
            //'disableCurrentPageButton' => true,
            'linkContainerOptions' => [
                'class' => 'page-item'
            ],
            'linkOptions' => [
                'class' => 'page-link'
            ]
        ]));
    }
}
