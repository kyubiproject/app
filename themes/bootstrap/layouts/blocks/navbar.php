<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-primary">
	<div class="container d-flex justify-content-between align-items-center" data-toggle="collapse"
		data-target="#navbar-toggle">
		<a class="navbar-brand" href="<?= app()->homeUrl ?>"> <img
			alt="<?=app()->name?>"
			src="<?=asset('@themes/bootstrap/assets') . '/img/bootstrap-solid.svg'?>"
			width="30" height="30">
		</a>
		<?= blocks('navbar-menu') ?>
		<?= blocks('navbar-user') ?>
	</div>
</nav>
<div class="collapse show" id="navbar-toggle">
	<div
		class="container d-flex justify-content-between align-items-center flex-row-reverse">
		<blockquote class="blockquote">
			<footer class="blockquote-footer"> Compañía localidad Localidad </footer>
		</blockquote>
		<?= blocks('breadcrumb') ?>
	</div>
</div>