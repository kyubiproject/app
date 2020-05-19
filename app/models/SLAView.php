<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "SLAView".
 *
 * @property string $SERVICIO
 * @property string|null $FECHA
 * @property int|null $CONTRACT_ID
 * @property int $NODE_ID
 * @property int|null $TIEMPO
 * @property int|null $TAMANO
 * @property string|null $FECHA_ANALISIS
 * @property float|null $RATIO
 * @property int|null $CUMPLE
 */
class SLAView extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'SLAView';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['SERVICIO', 'NODE_ID'], 'required'],
            [['SERVICIO'], 'string'],
            [['FECHA', 'FECHA_ANALISIS'], 'safe'],
            [['CONTRACT_ID', 'NODE_ID', 'TIEMPO', 'TAMANO', 'CUMPLE'], 'integer'],
            [['RATIO'], 'number'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'SERVICIO' => Yii::t('app', 'Servicio'),
            'FECHA' => Yii::t('app', 'Fecha'),
            'CONTRACT_ID' => Yii::t('app', 'Contract ID'),
            'NODE_ID' => Yii::t('app', 'Node ID'),
            'TIEMPO' => Yii::t('app', 'Tiempo'),
            'TAMANO' => Yii::t('app', 'Tamano'),
            'FECHA_ANALISIS' => Yii::t('app', 'Fecha Analisis'),
            'RATIO' => Yii::t('app', 'Ratio'),
            'CUMPLE' => Yii::t('app', 'Cumple'),
        ];
    }
}
