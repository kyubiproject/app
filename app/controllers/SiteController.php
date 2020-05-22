<?php
namespace app\controllers;

use yii\web\Controller;

class SiteController extends Controller
{

    public function actionIndex()
    {
        require_once alias('@yii/requirements/YiiRequirementChecker.php');
        $requirementsChecker = new \YiiRequirementChecker();
        $requirements = array(
            array(
                'name' => 'PHP Yaml Extension',
                'mandatory' => true,
                'condition' => extension_loaded('yaml'),
                'by' => 'Some application feature',
                'memo' => 'PHP extension "yaml" required'
            )
        );
        dd($requirementsChecker->checkYii()
            ->check($requirements)
            ->getResult());
    }

    public function actionRequirements()
    {
        require_once alias('@yii/requirements/YiiRequirementChecker.php');
        $requirementsChecker = new \YiiRequirementChecker();
        $requirements = array(
            array(
                'name' => 'PHP Yaml Extension',
                'mandatory' => true,
                'condition' => extension_loaded('yaml'),
                'by' => 'Some application feature',
                'memo' => 'PHP extension "yaml" required'
            )
        );
        $requirementsChecker->checkYii()->render();
    }
}