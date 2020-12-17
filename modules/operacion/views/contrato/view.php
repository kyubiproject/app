<?php
/**
 * @var \yii\web\View $this
 * @var \kyubi\base\ActiveRecord $model
 */
use kyubi\ui\widgets\DetailView;
use yii\helpers\Html;
?>
<div class="d-flex">
	<div class="w-100">
<?php
echo DetailView::widget([
    'model' => $model,
    'options' => [
        'tag' => 'section',
        'class' => 'form-row'
    ]
]);
?>
</div>
	<div class="pl-3 d-flex align-items-center justify-content-center">
		<div class="btn-group-vertical text-nowrap">
<?php
if ($model->getOldAttribute('momento') != 'CONTRATO') {
    if ($orden = $model->orden ?? null) {
        if ($orden1 = $orden->orden ?? null) {
            if ($orden2 = $orden1->orden ?? null) {
                echo Html::a('Presupuesto Nº ' . $orden2->codigo, url([
                    '/operacion/presupuesto/view',
                    'id' => $orden2->id
                ]), [
                    'class' => 'btn btn-sm btn-outline-primary'
                ]);
            }
            echo Html::a('Reserva Nº ' . $orden1->codigo, url([
                '/operacion/reserva/view',
                'id' => $orden1->id
            ]), [
                'class' => 'btn btn-sm btn-outline-primary'
            ]);
        }
        echo Html::a('Contrato Nº ' . $orden->codigo, url([
            '/operacion/contrato/view',
            'id' => $orden->id
        ]), [
            'class' => 'btn btn-sm btn-outline-primary'
        ]);
    }
} else {
    if ($orden = $model->orden ?? null) {
        if ($orden2 = $orden->orden ?? null) {
            echo Html::a('Presupuesto Nº ' . $orden2->codigo, url([
                '/operacion/presupuesto/view',
                'id' => $orden2->id
            ]), [
                'class' => 'btn btn-sm btn-outline-primary'
            ]);
        }
        echo Html::a('Reserva Nº ' . $orden->codigo, url([
            '/operacion/reserva/view',
            'id' => $orden->id
        ]), [
            'class' => 'btn btn-sm btn-outline-primary'
        ]);
    }
    foreach ($model->ordens ?? [] as $orden) {
        echo Html::a('Extension Nº ' . $orden->codigo, url([
            '/operacion/contrato/view',
            'id' => $orden->id
        ]), [
            'class' => 'btn btn-sm btn-outline-secondary'
        ]);
    }
    if ($model->getOldAttribute('tipo_contrato') == 'LP') {
        echo Html::a('Extender contrato', '#', [
            'type' => 'POST',
            'submit' => url([
                'next',
                'id' => $model->id
            ]),
            'before-send' => 'confirm("¿Está seguro de extender el contrato?")',
            'class' => 'mt-2 btn btn-sm btn-success'
        ]);
    }
}
?>
		</div>
	</div>
</div>