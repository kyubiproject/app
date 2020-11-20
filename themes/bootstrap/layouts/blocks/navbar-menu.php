<?php
use kyubi\helper\Arr;

$navbar = [];
foreach (Kyubi::config('modules') ?? [] as $name => $module) {
    if (isset($module['settings']) && $item = $module['settings']['navbar'] ?? []) {
        $navbar[$name] = $item;
    }
}
?>
<div class="collapse navbar-collapse" id="navbar-menu">
	<ul class="navbar-nav">
	<?php foreach (Arr::sort($navbar) as $name => $item): ?>
    	<li class="nav-item dropdown">
    		<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"><?= $item['label'] ?? $name ?></a>
    		<div class="dropdown-menu mt-lg-2">
    		<?php foreach ($item['links'] ?? [] as $link): ?>
    			<?php if (empty($link['label'] ?? null)) continue; ?>
    			<?php if (($link['separator'] ?? null) == 'before'): ?>
    				<div class="dropdown-divider"></div>
				<?php endif; ?>
    			<?php if (boolval($link['url'] ?? false)): ?>
					<a class="dropdown-item<?= isset($link['disabled']) ? ' disabled' : null?>" href="<?= $link['url'] ?? '#' ?>"><?= $link['label'] ?></a>    				
    			<?php else: ?>
    				<small class="dropdown-item disabled"><?= $link['label'] ?></small>
    			<?php endif; ?>
    			<?php if (($link['separator'] ?? null) == 'after'): ?>
    				<div class="dropdown-divider"></div>
				<?php endif; ?>
    		<?php endforeach; ?>
    		</div>
    	</li>
	<?php endforeach; ?>
    </ul>
</div>