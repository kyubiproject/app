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
<button class="navbar-toggler" data-toggle="collapse"
	data-target="#navbar-menu">
	<span class="navbar-toggler-icon"></span>
</button>
<div class="collapse navbar-collapse" id="navbar-menu">
	<ul class="navbar-nav">
	<?php foreach (Arr::sort($navbar) as $name => $item): ?>
    	<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#" data-toggle="dropdown"><?= t($name, $item['label'] ?? $name) ?></a>
			<div class="dropdown-menu">
    		<?php
    foreach ($item['links'] ?? [] as $link) {
        if ($link == ($last ?? null))
            continue;
        if (is_string($link)) {
            $tpl = '<div class=":class">:label</div>';
            $terms[':class'] = $link == 'separator' ? 'dropdown-divider' : 'dropdown-item disabled font-weight-bold';
            $terms[':label'] = $link == 'separator' ? null : t($name, $name .'/'. $link);
        } elseif (is_array($link)) {
            $term = array_key_first($link);
            $href = array_shift($link);
            $tpl = '<a class=":class" href=":href">:label</a>';
            $terms[':class'] = 'dropdown-item' . ($href === false ? " disabled" : null);
            $terms[':href'] = $href ?? ($term[0] !== '/' ? "/$name/" : null) . $term;
            $terms[':label'] = t($name, $name . '/' . $term);
        } else
            continue;
        // echo '<div class=""></div>';
        // } else
        // if (! isset($link['url'])) {
        // $link['url'] = false;
        // } elseif (! Str::startWith($link['url'], '/')) {
        // $link['url'] = "/$name/{$link['url']}";
        // } else {
        // // <a class="<?= isset($link['disabled']) ? ' disabled' : null" href=":href">:label</a> }
        // }
        // $label = ;
        echo strtr($tpl, $terms ?? []);
        unset($terms);
        $last = $link;
    }
    ?>
			</div></li>
	<?php endforeach; ?>
    </ul>
</div>