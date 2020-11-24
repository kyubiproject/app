<?php
/* @var $this \yii\web\View */
/* @var $content string */
\app\assets\Asset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
<title><?= $this->title ?></title>
<meta charset="<?= Yii::$app->charset ?>">
    <?php $this->registerCsrfMetaTags() ?>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>
<main class="container">
    <?= $content ?>
</main>
<footer><?= powered() ?></footer>
<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
