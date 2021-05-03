<?php
if (controller()->defaultAction !== action()->id && count($sections = controller()->sections ?? [])) :
switch (controller()->uniqueId):
    case 'maestro/tarifa':
    case 'maestro/provincia':
    case 'maestro/empresa':
    case 'flota/version':
    case 'cliente/conductor':
?>
	<?php foreach ($sections as $name => $section): ?>
		<div class="card mt-3">
			<div class="card-body pt-3" id="<?= action()->id . '-'. $name ?>">
				<header>
					<h2>
						<?= str_replace('<br>', '&nbsp;', t('__sections', model())[$section['label'] ?? $name] ?? $name) ?>
					</h2>
				</header>
			<?= render($section['view'] ?? $name, $section['params'] ?? []) ?>
			</div>
		</div>
	<?php endforeach; ?>
<?php 
    break;
    default:
?>
<section class="tabs mt-3 card">
	<div class="card-body d-flex flex-md-row flex-column pt-3">
	<div class="col col-md-4 col-lg-3 pl-1">
		<div class="nav nav-pills  flex-column">
			<?php foreach ($sections as $name => $section): ?>
			<a
				class="nav-link<?=array_key_first($sections) == $name ? ' active' : null?>"
				data-toggle="pill" href="#<?= action()->id . '-'. $name ?>">
				<h5 class="font-weight-bold">
					<?= t('__sections', model())[$section['label'] ?? $name] ?? $name ?>
				</h5>
			</a>
			<?php endforeach; ?>
		</div>
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
</section>
<?php endswitch; ?>
<?php endif; ?>