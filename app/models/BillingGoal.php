<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "BillingGoal".
 *
 * @property int $id
 * @property string $REF
 * @property string $OBJETIVO_NOMBRE
 * @property string $OBJETIVO_PERIODICIDAD
 * @property string $OBJETIVO_PERIODO
 * @property string $OBJETIVO_SERVICIO_TIPO
 * @property string $OBJETIVO_SERVICIO
 * @property int $OBJETIVO_TX
 * @property float $OBJETIVO_IMPORTE
 * @property int $deleted
 * @property string|null $updated_at
 * @property int $upload_id
 */
class BillingGoal extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'BillingGoal';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['REF', 'OBJETIVO_NOMBRE', 'OBJETIVO_PERIODICIDAD', 'OBJETIVO_PERIODO', 'OBJETIVO_SERVICIO_TIPO', 'OBJETIVO_SERVICIO', 'OBJETIVO_TX', 'OBJETIVO_IMPORTE', 'upload_id'], 'required'],
            [['OBJETIVO_TX', 'deleted', 'upload_id'], 'integer'],
            [['OBJETIVO_IMPORTE'], 'number'],
            [['updated_at'], 'safe'],
            [['REF', 'OBJETIVO_PERIODO', 'OBJETIVO_SERVICIO_TIPO'], 'string', 'max' => 20],
            [['OBJETIVO_NOMBRE'], 'string', 'max' => 100],
            [['OBJETIVO_PERIODICIDAD', 'OBJETIVO_SERVICIO'], 'string', 'max' => 10],
            [['OBJETIVO_PERIODO', 'OBJETIVO_SERVICIO_TIPO', 'OBJETIVO_SERVICIO'], 'unique', 'targetAttribute' => ['OBJETIVO_PERIODO', 'OBJETIVO_SERVICIO_TIPO', 'OBJETIVO_SERVICIO']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'REF' => Yii::t('app', 'Ref'),
            'OBJETIVO_NOMBRE' => Yii::t('app', 'Objetivo Nombre'),
            'OBJETIVO_PERIODICIDAD' => Yii::t('app', 'Objetivo Periodicidad'),
            'OBJETIVO_PERIODO' => Yii::t('app', 'Objetivo Periodo'),
            'OBJETIVO_SERVICIO_TIPO' => Yii::t('app', 'Objetivo Servicio Tipo'),
            'OBJETIVO_SERVICIO' => Yii::t('app', 'Objetivo Servicio'),
            'OBJETIVO_TX' => Yii::t('app', 'Objetivo Tx'),
            'OBJETIVO_IMPORTE' => Yii::t('app', 'Objetivo Importe'),
            'deleted' => Yii::t('app', 'Deleted'),
            'updated_at' => Yii::t('app', 'Updated At'),
            'upload_id' => Yii::t('app', 'Upload ID'),
        ];
    }
}
