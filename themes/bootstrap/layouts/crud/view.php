<?php
/**
 * @var \yii\web\View $this
 * @var \kyubi\base\ActiveRecord $model
 */
use themes\bootstrap\widgets\DetailView;

echo DetailView::widget([
    'model' => $model,
    'attributes' => $model->fields(),
    'options' => [
        'tag' => 'section',
        'class' => 'form-row',
        'data-model' => basename(get_class($model)),
        'data-key' => $model->id
    ]
]);
if (($sections = $model->t('sections')) && is_array($sections)) {
    ?>
<div class="row border-top pt-3">
	<div class="col-3">
		<div class="nav flex-column nav-pills">
			<?php foreach ($sections as $name => $label): ?>
			<a class="nav-link<?=array_key_first($sections) == $name ? ' active' : null?>" data-toggle="pill" href="#<?= action()->id . '-'. $name ?>"><?= $label ?></a>
			<?php endforeach; ?>
		</div>
	</div>
	<div class="col-9">
		<div class="tab-content">
			<?php foreach ($sections as $name => $label): ?>
			<div class="tab-pane fade<?=array_key_first($sections) == $name ? ' show active' : null?>" id="<?= action()->id . '-'. $name ?>">
			<?php require_file(controller()->getTemplatesPath(action()->id . '/'. $name . '.php'), $label) ?>
			</div>
			<?php endforeach; ?>
		</div>
	</div>
</div>
<?php } ?>
