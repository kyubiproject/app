<?php $data = app()->params['navbar']['menu'] ?? [] ?>
<div class="collapse navbar-collapse" id="navbar-menu">
	<ul class="navbar-nav">
	<?php foreach ($data as $menu): ?>
    	<?php if (isset($menu['items']) && isset($menu['label'])): ?>
    	<li class="nav-item dropdown">
    		<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"><?= $menu['label'] ?></a>
    		<div class="dropdown-menu mt-lg-2">
    		<?php foreach ($menu['items'] as $item): ?>
    			<?php if ($item == '-'): ?>
    				<div class="dropdown-divider"></div>
    			<?php elseif (is_string($item)): ?>
    				<small class="dropdown-item disabled"><?= $item ?></small>
    			<?php else: ?>
    				<a
					class="dropdown-item<?= isset($item['disabled']) ? ' disabled' : null?>"
					href="<?= $item['url'] ?? '#' ?>"><?= $item['label'] ?></a>
    			<?php endif; ?>
    		<?php endforeach; ?>
    		</div>
    	</li>
    	<?php endif; ?>
	<?php endforeach; ?>
    </ul>
</div>