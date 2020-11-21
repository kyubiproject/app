<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-primary">
	<div class="container" data-toggle="collapse"
		data-target="#navbar-toggle">
		<a class="navbar-brand" href="#"> <img alt="<?=app()->name?>"
			src="<?=asset('@themes/bootstrap/assets') . '/img/bootstrap-solid.svg'?>"
			width="30" height="30">
		</a>
		<button class="navbar-toggler" data-toggle="collapse"
			data-target="#navbar-menu">
			<span class="navbar-toggler-icon"></span>
		</button>
		<?= $this->blocks['navbar-menu'] ?? null ?>
		<?= $this->blocks['navbar-user'] ?? null ?>
	</div>
</nav>
<div class="collapse show" id="navbar-toggle">
	<div
		class="container d-flex justify-content-between align-items-center">
		<?= $this->blocks['breadcrumb'] ?? null ?>
		<blockquote class="blockquote">
			<footer class="blockquote-footer"> Compañía localidad Localidad </footer>
		</blockquote>
	</div>
</div>