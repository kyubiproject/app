<?php
namespace operacion\controllers;

use kyubi\helper\Str;
use kyubi\base\ActiveRecord;
use kyubi\db\Query;
use yii\web\NotFoundHttpException;

abstract class OrdenController extends \app\base\Controller
{

    public function behaviors()
    {
        $behaviors = parent::behaviors();
        $behaviors['verb-next'] = [
            'class' => \yii\filters\VerbFilter::className(),
            'actions' => [
                'next' => [
                    'POST'
                ]
            ]
        ];
        return $behaviors;
    }

    public function loadModel($id = null, string $scenario = 'default')
    {
        $model = parent::loadModel($id, $scenario);
        if (! $model->isNewRecord) {
            switch ($model::DEFAULT_MOMENTO) {
                case 'CONTRATO':
                    if (! in_array($model->getOldAttribute('momento'), [
                        $model::DEFAULT_MOMENTO,
                        'EXTENSION'
                    ])) {
                        throw new NotFoundHttpException('Model not found.', 404);
                    }
                    break;

                default:
                    if ($model->getOldAttribute('momento') !== $model::DEFAULT_MOMENTO) {
                        throw new NotFoundHttpException('Model not found.', 404);
                    }
            }
        }
        return $model;
    }

    /**
     *
     * {@inheritdoc}
     * @see \app\base\Controller::getTitle()
     */
    public function getTitle(array $params = [])
    {
        switch (action()->id) {
            case 'index':
                $params['{controller}'] = Str::pluralize(t($this->module->id, $this->uniqueId));
                break;
            case 'view':
            case 'update':
                if (model() && model()->getOldAttribute('momento') == 'EXTENSION') {
                    $params['{model}'] = model()->name . ' <small>' . model()->orden->codigo . '</small>';
                }
                break;
            default:
        }
        return parent::getTitle($params);
    }

    /**
     *
     * @param string $id
     */
    public function actionNext(string $id)
    {
        $query = Query::instance()->createCommand();
        $query->setRawSql(strtr('INSERT INTO operacion__orden (orden_id) VALUES (:t0)', [
            ':t0' => intval($id)
        ]));
        $query->execute();
        $id = $query->setRawSql('SELECT LAST_INSERT_ID();')->queryScalar();
        return controller()->redirect([
            '/operacion/' . ($this->id == 'presupuesto' ? 'reserva' : 'contrato') . '/view',
            'id' => $id
        ]);
    }

    /**
     *
     * {@inheritdoc}
     * @see \app\base\Controller::buttons()
     */
    public function buttons(array $params = [], array $buttons = null): array
    {
        $buttons = parent::buttons($params, $buttons);
        if (model()) {
            foreach ([
                'prev',
                'next'
            ] as $it) {
                $item = model()->find()
                    ->where('id' . ($it == 'next' ? '>' : '<') . ':t0 AND momento=:t1', [
                    ':t0' => model()->primaryKey,
                    ':t1' => model()::DEFAULT_MOMENTO
                ])
                    ->one();
                $buttons['nav']['buttons'][$it] = [
                    'url' => $item ? url(array_merge([
                        'view'
                    ], [
                        'id' => $item->id
                    ]), true) : false,
                    'on' => 'view'
                ];
            }
        }
        return $buttons;
    }
}