<?php
if (request()->isAjax) {
    die($content);
}
/* @var $this \yii\web\View */
/* @var $content string */
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= app()->language ?>">
<head>
<title><?= $this->title ?></title>
<meta charset="<?= app()->charset ?>">
    <?php $this->registerCsrfMetaTags() ?>
    <?php $this->head() ?>
</head>
<body class="<?=basename(controller()->layout, '.php')?>"
	route="<?=\kyubi\helper\Str::slug(controller()->route)?>">
<?php $this->beginBody() ?>
	<header class="mt-5">
    	<?= blocks('navbar') ?>
    </header>
	<main class="container">
    	<?= blocks('header') ?>
    	<?= $content ?>
	</main>
	<footer>
    	<?= blocks('footer') ?>
    </footer>
<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
