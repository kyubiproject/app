<?php $data = app()->params['navbar']['user'] ?? [] ?>
<div id="navbar-user">
	<span class="navbar-brand" data-toggle="tooltip" title="<?=$data['role'] ?? 'Role'?>">
		<i class="fa fa-user-circle mr-3"></i>
		<?=$data['username'] ?? 'Username'?>
	</span>
	<a class="navbar-brand" href="<?=url('logout')?>">
		<i class="fa fa-sign-out"></i>
	</a>
</div>