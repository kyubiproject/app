<?php
/* @var $this \yii\web\View */
/* @var $content string */
use yii\helpers\Html;
use app\assets\AppAsset;
// use common\widgets\Alert;

//AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= app()->language ?>">
<head>
	<title><?= Html::encode($this->title) ?></title>
    <meta charset="<?= app()->charset ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?php $this->registerCsrfMetaTags() ?>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>
	<header></header>
    <main class="container">
        <?= $content ?>
    </main>
    <footer></footer>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
