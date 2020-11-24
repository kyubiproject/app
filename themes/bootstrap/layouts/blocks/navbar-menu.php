<?php
use kyubi\helper\Arr;
use kyubi\helper\Str;

$navbar = [];
foreach (Kyubi::config('modules') ?? [] as $name => $module) {
    if (isset($module['settings']) && $item = $module['settings']['navbar'] ?? []) {
        $navbar[$name] = $item;
    }
}
?>
<button class="navbar-toggler" data-toggle="collapse" data-target="#navbar-menu">
	<span class="navbar-toggler-icon"></span>
</button>
<div class="collapse navbar-collapse" id="navbar-menu">
	<ul class="navbar-nav">
	<?php foreach (Arr::sort($navbar) as $name => $item): ?>
    	<li class="nav-item dropdown">
    		<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"><?= t($name, $item['label'] ?? $name) ?></a>
    		<div class="dropdown-menu">
    		<?php foreach ($item['links'] ?? [] as $link): ?>
    			<?php if (empty($link['label'] ?? $link['url'])) continue; ?>
    			<?php if (($link['separator'] ?? null) == 'before'): ?>
    				<div class="dropdown-divider"></div>
				<?php endif; ?>
				<?php
				if (! isset($link['url'])) {
				    $link['url'] = false;
				} elseif (! Str::startWith($link['url'], '/')) {
				    $link['url'] = "/$name/{$link['url']}";
				}
				$label = t($name, $link['label'] ?? ltrim($link['url'], '/'));
				?>
				<?php if ($link['url'] !== false): ?>
					<a class="dropdown-item<?= isset($link['disabled']) ? ' disabled' : null?>" href="<?= $link['url'] ?? '#' ?>"><?= $label ?></a>    				
    			<?php elseif (isset($link['label'])): ?>
    				<div class="dropdown-item disabled font-weight-bold"><?= $label ?></div>
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