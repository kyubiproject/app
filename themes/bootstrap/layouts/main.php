<?php
/**
 * @var $this \yii\web\View
 * @var $content string
 */
$this->beginPage();
if (request()->isPatch) {
    $this->beginBody();
    echo $content;
    $this->endBody();
} else {
    ?>
<!DOCTYPE html>
<html lang="<?= app()->language ?>">
<head>
<title><?= $this->title ?></title>
<meta charset="<?= app()->charset ?>">
    <?php $this->registerCsrfMetaTags() ?>
    <?php $this->head() ?>
</head>
<body class="<?=basename(controller()->layout, '.php')?> pt-5"
	route="<?=\kyubi\helper\Str::slug(controller()->route)?>">
<?php $this->beginBody() ?>
	<header class="pt-3">
    	<?= blocks('navbar') ?>
    </header>
	<main class="container pt-2">
    	<?= blocks('header') ?>
    	<?= $content ?>
	</main>
	<footer>
    	<?= blocks('footer') ?>
    </footer>
<?php $this->endBody() ?>
</body>
</html>
<?php
}
$this->endPage();
