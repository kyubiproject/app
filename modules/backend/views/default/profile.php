<?php
$this->widget('zii.widgets.CDetailView', array(
    'data' => $model,
    'attributes' => $model->fields("view")
));
