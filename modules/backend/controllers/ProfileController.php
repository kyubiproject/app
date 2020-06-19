<?php

class ProfileController extends CrudController
{

    public function actionActive($id)
    {
        $model = $this->loadModel($id);
        $model->is_active = true;
        $model->update();
    }

    public function actionInactive($id)
    {
        $model = $this->loadModel($id);
        $model->is_active = false;
        $model->update();
    }
}