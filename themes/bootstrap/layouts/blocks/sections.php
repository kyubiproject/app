<?php if (count($sections = controller()->sections ?? [])): ?>
<div class="row border-top mt-3 pt-3">
	<div class="col-3">
		<div class="nav flex-column nav-pills">
			<?php foreach ($sections as $name => $alias): ?>
			<a class="nav-link<?=array_key_first($sections) == $name ? ' active' : null?>" data-toggle="pill" href="#<?= action()->id . '-'. $name ?>"><?= model()->t($name) ?></a>
			<?php endforeach; ?>
		</div>
	</div>
	<div class="col-9">
		<div class="tab-content">
			<?php foreach ($sections as $name => $view): ?>
			<div class="tab-pane fade<?=array_key_first($sections) == $name ? ' show active' : null?>" id="<?= action()->id . '-'. $name ?>">
			<?= render($view ?? $name) ?>
			</div>
			<?php endforeach; ?>
		</div>
	</div>
</div>
<?php endif; ?>