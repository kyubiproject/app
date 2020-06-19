<center>
	<div
		class="thumbnail panel-<?=$type = ($model instanceof RestoreForm ? "login": "restore")?>">

		<h1 class="page-header isotope"><?=app()->name?></h1>

	    <?php if ($type == "restore"): ?>

	    <?php $this->renderPartial('password', ['model' => $model]); ?>
	    
	    <?php else: ?>
	    
	    <?php $form = $this->beginWidget('CActiveForm'); ?>
	    
	    <div class="container-fluid">

			<p><?=t($model, 'We will send you an email, with which you can change your password.')?></p>

			<div class="form-group">
				<div class="control-group field_email">
                <?=$form->textField($model, 'email', ['class' => 'form-control input-sm', 'placeholder' => $model->getAttributeLabel('email')])?>
                <?=$form->error($model, 'email')?>
                </div>
			</div>

		</div>

		<div class="buttons">
    	<?=Html::htmlButton(get_label_action('restore-password', 'backend'), ['class' => 'btn btn-danger btn-block', 'type' => 'submit'])?>
    	</div>
    	
	    <?php $this->endWidget('CActiveForm');?>
	    
        <?=Html::link(get_label_action('login', 'backend'), $this->createUrl('login'), ['class' => 'btn btn-sm btn-success btn-login'])?>
	    
	    <?php endif; ?>
	    
    </div>

</center>