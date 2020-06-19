<div class="dropdown vcard-user pull-right">
	<a href="#" class="dropdown-toggle" data-toggle="dropdown">
		<blockquote class="blockquote">
			<span class="user-info">
				<?=user()->name?>
				<?php if (is_array($types = t('backend.lang.models.user', '_group'))): ?>
				<footer><?=(isset($types[user()->group]) ? $types[user()->group] : user()->group)?></footer>
				<?php endif; ?>
				
			</span> <i class="fa fa-vcard fa-2x"><span class="caret"></span></i>
		</blockquote>
	</a>
	<ul class="dropdown-menu">
		<li><?=Html::link(get_label_action('profile', 'backend', false), url('backend/default/profile'), ['class' => 'fancybox'])?></li>
		<li><?=Html::link(get_label_action('change-password', 'backend', false), url('backend/default/change-password', [], true), ['class' => 'fancybox'])?></li>
		<li class="divider"></li>
		<li><?=Html::ajaxLink(get_label_action('clear', 'backend', false), url('backend/default/clear', [], true, true), ['success' => 'function(data, jqXHR){location.reload();}'])?></li>
		<?php if (user()->id === user()->currentUser()): ?>
		<li><?=Html::link(get_label_action('logout', 'backend', false), url('backend/default/logout'), ['confirm' => t('backend.form/login', 'Are you sure to exit the system?')])?></li>
		<?php else: ?>
		<li><?=Html::ajaxLink(get_label_action('simulate.logout', 'backend', false), url('backend/user/simulate'), ['success' => 'function(data, jqXHR){location.reload();}'])?></li>
		<?php endif; ?>
	</ul>
</div>