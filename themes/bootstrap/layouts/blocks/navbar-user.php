<div id="navbar-user">
	<span class="navbar-brand" data-toggle="tooltip">
		<i class="fa fa-user-circle mr-3"></i>
		<?= user('username') ?>
	</span>
	<a class="navbar-brand" href="<?=url('logout')?>">
		<i class="fa fa-sign-out"></i>
	</a>
</div>