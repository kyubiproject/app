<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-primary">
	<div class="container-lg d-flex justify-content-between align-items-center" data-toggle="collapse"
		data-target="#navbar-toggle">
		<a class="navbar-brand" href="<?= app()->homeUrl ?>"> <img
			alt="<?=app()->name?>"
			src="<?=asset('@themes/bootstrap/assets') . '/img/bootstrap-solid.svg'?>"
			width="30" height="30">
		</a>
		<?= get_block('navbar-menu') ?>
		<?= get_block('navbar-user') ?>
	</div>
</nav>
<div class="collapse show d-flex justify-content-between flex-row-reverse align-items-center" id="navbar-toggle">
	<blockquote class="blockquote d-none d-md-block">
		<footer class="blockquote-footer"><?= user('delegacion') ?></footer>
	</blockquote>
	<?= get_block('breadcrumb') ?>
</div>