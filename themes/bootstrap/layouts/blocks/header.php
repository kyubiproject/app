<?php if (is_null($header = controller()->header ?? null)): ?>
<header class="d-flex justify-content-between align-items-center">
	<h1>
		<?= controller()->title ?? null ?>
	</h1>
	<div class="btn-toolbar">
		<?=controller()->toolbar ?? null?>
	</div>
</header>
<?php else: ?>
<?php echo $header; ?>
<?php endif; ?>