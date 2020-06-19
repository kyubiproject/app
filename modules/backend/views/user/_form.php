<section class="elements">

    <?php if ($model->isNewRecord): ?>
    <div class="alert alert-info">
    	<?=Html::checkBox('welcome', post('checkbox'))?>
    	&nbsp;
    	<?=Html::label(t($model, 'Send invitation to set your password and use the system.'), 'welcome')?>
    </div>

	<script type="text/javascript">
    $(document).on("change", "input#welcome", function() {
    	$(".section-password").fadeToggle();
    });
    </script>
    <?php endif; ?>

    <div class="section-password">
    <?php
    $this->widget('backend.widgets.password.PasswordWidget', [
        'form' => $form
    ]);
    ?>
    </div>

</section>