
<h2>
	<span class="label label-info"><?=$code?></span>
<?=$title?>
</h2>

<h3><?=$content?></h3>

<?php if (APP_MODE != 'LIVE' || YII_DEBUG): ?>
<div class="row well" style="margin-top: 15px;">
	<b><?=$message?></b>
</div>
<?php endif; ?>