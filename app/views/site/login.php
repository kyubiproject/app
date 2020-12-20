<?php

/* @var $this yii\web\View */
/* @var $form yii\widgets\ActiveForm */
/* @var $model app\models\LoginForm */
use yii\helpers\Html;
use yii\widgets\ActiveForm;

view()->registerCss('
.is-invalid .help-block {   color: var(--danger); }
');

$form = ActiveForm::begin([
    'id' => 'login-form',
    'errorCssClass' => 'is-invalid',
    'successCssClass' => 'is-valid',
    'validationStateOn' => 'container',
    'options' => [
        'class' => 'col-12 offset-md-3 col-md-6 offset-lg-4 col-lg-4 mt-0 mt-md-5 pt-lg-5'
    ]
]);
?>
<center>
	<img class="mb-4" src="<?= asset('@themes/bootstrap/assets')?>/img/bootstrap-solid.svg" alt=""
		width="72" height="72">
	<h1 class="h3 mb-3 font-weight-normal"><?=t('app/base', 'Bienvenido')?></h1>
</center>
<?php
echo $form->field($model, 'username', [
    'template' => '{input}{error}'
])->textInput([
    'autofocus' => true,
    'placeholder' => $model->getAttributeLabel('username')
]);
echo $form->field($model, 'password', [
    'template' => '{input}{error}'
])->passwordInput([
    'placeholder' => $model->getAttributeLabel('password')
]);
// echo $form->field($model, 'rememberMe')->checkbox([
// 'template' => "<div class=\"col-lg-offset-1 col-lg-3\">{input} {label}</div>\n<div class=\"col-lg-8\">{error}</div>"
// ]);
?>

<div class="form-group">
	<div class="col-lg-offset-1 col-lg-11"></div>
</div>

<?= Html::submitButton('<i class="fa fa-sign-in"></i> Iniciar sesión', ['class' => 'btn btn-lg btn-primary btn-block', 'name' => 'login-button']) ?>
<p class="mt-5 mb-3 text-muted text-center"><?= powered() ?> © <?= date('Y') ?></p>
<?php $form->end(); ?>