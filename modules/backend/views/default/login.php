<center>
	<div class="thumbnail panel-login">

		<h1 class="page-header isotope"><?=app()->name?></h1>
        
        <?php
        $form = $this->beginWidget('CActiveForm', [
            'clientOptions' => [
                'validateOnChange' => true
            ]
        ]);
        ?>
    	
    	<div class="container-fluid">
	    	<?php if ($model->hasErrors('__identity')): ?>
        	<div class="alert alert-danger alert-dismissible">
              <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <?=$form->error($model, '__identity')?>
            </div>
        	<?php endif; ?>

			<div class="form-group">
            	<?=$form->labelEx($model, 'username', ['class' => 'hidden-xs control-label']); ?>
        		<div class="control-group field_username">
                	<?=$form->textField($model, 'username', ['class' => 'form-control input-sm', 'placeholder' => $model->getAttributeLabel('username')])?>
                	<?=$form->error($model, 'username')?>
            	</div>
			</div>

			<div class="form-group">
            	<?=$form->labelEx($model, 'password', ['class' => 'hidden-xs control-label']); ?>
            	<div class="control-group field_password">
            		<?=$form->passwordField($model, 'password', ['class' => 'form-control input-sm', 'placeholder' => $model->getAttributeLabel('password'), 'readonly' => true])?>
            		<a class="show-password" href="#" tabindex="-1"></a>
            		<?=$form->error($model, 'password')?>
        		</div>
			</div>

        	<div class="form-group field_rememberMe text-right">
        		<div class="control-group">
        	    	<?=$form->checkBox($model, 'rememberMe', ['value' => $model->rememberMe])?>
        	    	<abbr title="<?=t($model, 'Remember your session.')?>"><?=$model->getAttributeLabel('rememberMe')?></abbr>
        		</div>
        	</div>

		</div>

		<div class="buttons">
        	<?=Html::htmlButton(get_label_action('login', 'backend'), ['class' => 'btn btn-success btn-block', 'type' => 'submit'])?>
    	</div>
        	
        <?php $this->endWidget('CActiveForm');?>
        
        <!-- 
        <?=Html::link(get_label_action('restore-password', 'backend'), $this->createUrl('restore-password'), ['class' => 'btn btn-sm btn-danger btn-reset-password'])?>
        -->
        
    </div>
</center>