<div class="row">
	<div class="col-xs-12 col-sm-6">
		<div class="password-valid">
			<div class="panel panel-default">
				<div class="panel-heading"><?=t($model, "Password requirements")?></strong>
				</div>
				<div class="panel-body">
					<ul class="password-rules list-unstyled">
                	<?php foreach (t($model, '_rules') as $rule => $label): ?>
                		<li class="<?=$rule?>"><?=t($model, $label)?></li>
                	<?php endforeach; ?>
                	</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xs-12 col-sm-6">
		<span class="password-inputs">
			<div class="form-group">
            	<?=$form->labelEx($model, $password, ["class" => "control-label"]); ?>
            	<div class="control-group field_password">
            		<?=$form->passwordField($model, $password, ["class" => "form-control input-sm", "placeholder" => $model->getAttributeLabel($password), "readonly" => true])?>
            		<a class="show-password" href="#" tabindex="-1"></a>
            		<?=$form->error($model, $password)?>
        		</div>
			</div>

			<div class="form-group">
            	<?=$form->labelEx($model, $conf_password, ["class" => "control-label"]); ?>
            	<div class="control-group field_password">
            		<?=$form->passwordField($model, $conf_password, ["class" => "form-control input-sm", "placeholder" => $model->getAttributeLabel($conf_password), "readonly" => true])?>
            		<a class="show-password" href="#" tabindex="-1"></a>
            		<?=$form->error($model, $conf_password)?>
        		</div>
			</div>
		</span>
	</div>
</div>
<?php
cs()->registerScript('password', '$("input[id*=password]").on("keyup", function() {
	$(".password-rules").addClass("errorMessage");
	var $pswd = $("#' . Html::activeId($model, 'password') . '").val();
    $pswd.split(/[a-z]/i).length > 3 ? $(".password-rules .letter").addClass("valid") : $(".password-rules .letter").removeClass("valid");
    $pswd.split(/\d/).length > 2 ? $(".password-rules .number").addClass("valid") : $(".password-rules .number").removeClass("valid");
    $pswd.split(/[A-Z]/).length > 1 ? $(".password-rules .upper").addClass("valid") : $(".password-rules .upper").removeClass("valid");
    $pswd.split(/[^a-z0-9]/i).length > 1 ? $(".password-rules .special").addClass("valid") : $(".password-rules .special").removeClass("valid");
    $pswd != "" && $pswd == $("#' . Html::activeId($model, 'conf_password') . '").val() ? $(".password-rules .confirm").addClass("valid") : $(".password-rules .special").removeClass("confirm");
})', CClientScript::POS_END);
?>