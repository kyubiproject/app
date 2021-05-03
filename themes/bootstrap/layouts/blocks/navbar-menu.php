<?php
use kyubi\helper\Arr;

$modules = Kyubi::config('modules') ?? [];
$navbar = [];
foreach ($modules as $name => $module) {
    if (isset($module['settings']) && $item = $module['settings']['navbar'] ?? []) {
        $navbar[$name] = $item;
    }
}
?>
<button class="navbar-toggler" data-toggle="collapse"
	data-target="#navbar-menu">
	<i class="fa fa-bars text-dark"></i>
</button>
<div class="collapse navbar-collapse" id="navbar-menu">
	<ul class="navbar-nav">
	<?php foreach (Arr::sort($navbar) as $name => $item): ?>
    	<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#" data-toggle="dropdown">
    			<?= t($item['label'] ?? $name, $name) ?>
			</a>
			<div class="dropdown-menu">
    		<?php
    foreach ($item['links'] ?? [] as $link) {
        if ($link !== ($last ?? null)) {
            if (is_string($link)) {
                $tpl = '<div class=":class">:label</div>';
                $terms[':class'] = $link == 'separator' ? 'dropdown-divider' : 'dropdown-item disabled font-weight-bold';
                $terms[':label'] = $link == 'separator' ? null : t($name . '/' . $link, $name);
            } elseif (is_array($link)) {
                $term = array_key_first($link);
                $href = array_shift($link);
                $tpl = '<a class=":class" href=":href">:label</a>';
                $terms[':class'] = 'dropdown-item' . ($href === false ? " disabled" : null);
                $terms[':href'] = url($href ?? ($term[0] !== '/' ? "/$name/" : null) . $term);
                $terms[':label'] = t($name . '/' . $term, $name);
            } else {
                continue;
            }
            echo strtr($tpl, $terms ?? []);
            unset($terms);
        }
        $last = $link;
    }
    ?>
			</div></li>
	<?php endforeach; ?>
    </ul>
</div>