<?php
/**
 * @var \yii\web\View $this
 * @var string $content
 */
use kyubi\helper\Str;

\themes\bootstrap\Asset::register($this);

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
	route="<?=Str::slug(controller()->route)?>">
<?php $this->beginBody() ?>
	<header class="container-lg pt-3">
    	<?= get_block('navbar') ?>
    </header>
	<main class="container-lg pt-2">
    	<?= get_block('header') ?>
    	<?= $content ?>
    	<?= get_block('sections') ?>
	</main>
	<footer>
    	<?= get_block('footer') ?>
    </footer>
<?php $this->endBody() ?>
</body>
</html>
<?php
}
$this->endPage();
