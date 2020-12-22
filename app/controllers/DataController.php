<?php
namespace app\controllers;

use yii\filters\AccessControl;
use kyubi\db\Query;
use kyubi\helper\Arr;
use yii\db\Command;
use flota\models\base\Vehiculo;
use operacion\models\base\Orden;

class DataController extends \kyubi\api\base\Controller
{

    public function behaviors()
    {
        $behaviors['access'] = [
            'class' => AccessControl::className(),
            'rules' => [
                [
                    'allow' => true,
                    'roles' => [
                        '@'
                    ]
                ]
            ]
        ];
        return $behaviors;
    }

    public function actionFilters()
    {
        $data['delegaciones'] = [];
        foreach (\comun\models\base\Delegacion::find()->all() as $item) {
            $data['delegaciones'][] = [
                'label' => $item->name,
                'value' => $item->primaryKey
            ];
        }
        $data['grupos'] = [];
        foreach (\flota\models\base\Tipo::find()->all() as $item) {
            $data['grupos'][] = [
                'label' => $item->primaryKey,
                'value' => $item->primaryKey
            ];
        }
        return [
            'data' => $data
        ];
    }

    public function actionIndex($delegacion = null, $fecha = null, $grupo = 'all', $dias = 30)
    {
        $data['headers'] = [];
        foreach ([
            'matricula',
            'modelo',
            'grupo',
            'estado'
        ] as $name) {
            $data['headers'][] = [
                'label' => t('app/base', ucfirst($name)),
                'value' => $name,
                'festivo' => false
            ];
        }
        $fecha = $fecha ?? date('Y-m-d');
        for ($i = 5; $i < $dias; $i ++) {
            $date = date('Y-m-d', strtotime($fecha . " $i days"));
            $day = [
                'label' => date('d/m', strtotime($date)),
                'value' => 'd' . ($i + 1),
                "date" => $date,
                "festivo" => date('D', strtotime($date)) == 'Sun',
                "current_day" => $date == date('Y-m-d')
            ];
            $calendario[] = array_slice($day, 0, 3);
            $data['headers'][] = $day;
        }
        /*
         *
         * @var Command $command
         */
        $command = Query::instance()->createCommand()
            ->setSql('CALL disponibilidad_vehiculos(:t0,:t1,:t2)')
            ->bindValues([
            ':t0' => $delegacion ?? user('delegacion_id'),
            ':t1' => $fecha,
            ':t2' => $date ?? $fecha
        ]);
        $content = [];
        $results = Query::instance()->multiResults($command->rawSql);
        foreach ($results as $dia => $result) {
            foreach ($result as $row) {
                if (! isset($content[$row['matricula']])) {
                    $content[$row['matricula']] = self::iniciarvehiculo($row, $calendario);
                }
                if (is_array($content[$row['matricula']]) && ! is_null($row['id'])) {
                    self::procesarDia($row, $content[$row['matricula']]['calendar'][$dia]);
                }
            }
        }

        if (($grupo = str_replace(' ', '+', get('grupo'))) != 'all') {
            $content = array_filter($content, function ($value) use ($grupo) {
                return $grupo == $value['grupo_id'];
            });
        }
        $data['content'] = array_values($content);
        return [
            'data' => $data ?? []
        ];
    }

    protected static function procesarDia(array $row, array &$columna)
    {
        /**
         *
         * @var Orden $model
         */
        $model = Orden::findOne([
            'id' => $row['id']
        ]);
        switch ($model->getOldAttribute('momento')) {
            case 'RESERVA':
                $columna['booking'] = $model->id;
                $columna['link'] = url("/operacion/reserva/{$model->id}");
                break;
            case 'CONTRATO':
                $columna['contract'] = $model->id;
                $columna['link'] = url("/operacion/contrato/{$model->id}");
                break;
        }
        $columna['tooltip'] = "<p>{$model->momento} nº {$model->codigo}</p><p><i>desde</i>{$model->detalles->fecha_entrega}</p> <p><i>hasta</i>{$model->detalles->fecha_recogida}</p>";
    }

    protected static function iniciarvehiculo(array $row, array $calendario = [])
    {
        /**
         *
         * @var Vehiculo $model
         */
        try {
            $model = Vehiculo::findOne([
                'matricula' => $row['matricula']
            ]);
            $data['delegacion_id'] = $model->delegacion_id ?? null;
            $data['matricula'] = $model->matricula;
            if ($model->modelo) {
                $data['modelo'] = $model->modelo->nombre ?? null;
                $data['grupo_id'] = $model->modelo->tipo_id ?? null;
                $data['grupo'] = $model->modelo->tipo_id ?? null;
            }
            if ($model->situacion) {
                $data['estado'] = $model->situacion->estado ?? null;
                $data['available'] = $model->situacion->getOldAttribute('estado') == 'DISPONIBLE';
            }
            $data['calendar'] = $calendario;
            return $data;
        } catch (\Exception $e) {
            return null;
        }
    }
}