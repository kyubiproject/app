<?php
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
    	<?= $this->blocks['navbar'] ?? null ?>
    </header>
    <main class="container">
    	<?= $this->blocks['header'] ?? null ?>
    	<?= $content ?>
	</main>
	<footer>
    	<?= $this->blocks['footer'] ?? null ?>
    </footer>
<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
