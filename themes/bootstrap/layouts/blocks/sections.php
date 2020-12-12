<?php
if (count($sections = controller()->sections ?? [])) :
?>
<div class="row border-top mt-3 pt-3">
	<div class="col-3">
		<div class="nav flex-column nav-pills">
			<?php foreach ($sections as $name => $section): ?>
			<a
				class="nav-link<?=array_key_first($sections) == $name ? ' active' : null?>"
				data-toggle="pill" href="#<?= action()->id . '-'. $name ?>"><?= t(model(), '__sections')[$section['label'] ?? $name] ?? $name ?></a>
			<?php endforeach; ?>
		</div>
	</div>
	<div class="col-9">
		<div class="tab-content">
			<?php foreach ($sections as $name => $section): ?>
			<div
				class="tab-pane fade<?=array_key_first($sections) == $name ? ' show active' : null?>"
				id="<?= action()->id . '-'. $name ?>">
			<?= render($section['view'] ?? $name, $section['params'] ?? []) ?>
			</div>
			<?php endforeach; ?>
		</div>
	</div>
</div>
<?php endif; ?>