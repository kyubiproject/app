<?php
if (controller()->defaultAction !== action()->id && count($sections = controller()->sections ?? [])) :
switch (controller()->uniqueId):
    case 'flota/tarifa':
?>
	<?php foreach ($sections as $name => $section): ?>
			<div
				class="tab-pane fade<?=array_key_first($sections) == $name ? ' show active' : null?>"
				id="<?= action()->id . '-'. $name ?>">
				<header>
					<h2><?= t(model(), '__sections')[$section['label'] ?? $name] ?? $name ?></h2>
				</header>
			<?= render($section['view'] ?? $name, $section['params'] ?? []) ?>
			</div>
	<?php endforeach; ?>
<?php 
    break;
    default:
?>
<div class=" d-flex flex-md-row flex-column pt-3">
	<div class="col col-md-4 col-lg-3 nav flex-column nav-pills">
		<?php foreach ($sections as $name => $section): ?>
		<a
			class="nav-link<?=array_key_first($sections) == $name ? ' active' : null?>"
			data-toggle="pill" href="#<?= action()->id . '-'. $name ?>">
			<h5 class="font-weight-bold">
				<?= t(model(), '__sections')[$section['label'] ?? $name] ?? $name ?>
			</h5>
		</a>
		<?php endforeach; ?>
	</div>
	<div class="col col-md-8 col-lg-9 tab-content px-0">
		<?php foreach ($sections as $name => $section): ?>
		<div
			class="tab-pane fade<?=array_key_first($sections) == $name ? ' show active' : null?>"
			id="<?= action()->id . '-'. $name ?>">
		<?= render($section['view'] ?? $name, $section['params'] ?? []) ?>
		</div>
		<?php endforeach; ?>
	</div>
</div>
<?php endswitch; ?>
<?php endif; ?>