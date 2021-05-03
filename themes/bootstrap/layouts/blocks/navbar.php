<?php if (user()): ?>
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-primary">
	<div
		class="container-lg d-flex justify-content-between align-items-center"
		data-target="#navbar-toggle">
		<a class="navbar-brand" href="<?= app()->homeUrl ?>"> <img alt=""
			src="<?=asset('@themes/bootstrap/assets') . '/img/logo.svg'?>"
			width="30" height="30">
		</a>
		<?php
    echo get_block('navbar-menu');
    echo get_block('navbar-user');
?>
	</div>
</nav>
<div
	class="collapse show d-flex justify-content-between flex-row-reverse align-items-center"
	id="navbar-toggle">
	<?php if (user()): ?>
	<blockquote class="blockquote d-none d-md-block">
		<footer class="blockquote-footer"><?= user('delegacion') ?></footer>
	</blockquote>
	<?php endif; ?>
	<?= get_block('breadcrumb') ?>
</div>
<?php endif; ?>