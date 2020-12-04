<h1>
	<span class="btn btn-danger"><?=$code?></span> <small><?=$message?></small>
</h1>
<?php if (YII_DEBUG): ?>
<h5><?=$file?></h5>
<pre><?=$trace?></pre>
<?php else: ?>
<p>The above error occurred while the Web server was processing your
	request.</p>
<p>Please contact us if you think this is a server error. Thank you.</p>
<?php endif; ?>

