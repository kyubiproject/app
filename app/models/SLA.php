<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "SLA".
 *
 * @property int $id
 * @property string $SERVICIO
 * @property string $FECHA
 * @property int|null $CONTRACT_ID
 * @property int $NODE_ID
 * @property int|null $TIEMPO
 * @property int|null $TAMANO
 * @property string|null $FECHA_ANALISIS
 * @property int $deleted
 * @property string|null $updated_at
 * @property int|null $upload_id
 */
class SLA extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'SLA';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['SERVICIO', 'NODE_ID'], 'required'],
            [['SERVICIO'], 'string'],
            [['FECHA', 'FECHA_ANALISIS', 'updated_at'], 'safe'],
            [['CONTRACT_ID', 'NODE_ID', 'TIEMPO', 'TAMANO', 'deleted', 'upload_id'], 'integer'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'SERVICIO' => Yii::t('app', 'Servicio'),
            'FECHA' => Yii::t('app', 'Fecha'),
            'CONTRACT_ID' => Yii::t('app', 'Contract ID'),
            'NODE_ID' => Yii::t('app', 'Node ID'),
            'TIEMPO' => Yii::t('app', 'Tiempo'),
            'TAMANO' => Yii::t('app', 'Tamano'),
            'FECHA_ANALISIS' => Yii::t('app', 'Fecha Analisis'),
            'deleted' => Yii::t('app', 'Deleted'),
            'updated_at' => Yii::t('app', 'Updated At'),
            'upload_id' => Yii::t('app', 'Upload ID'),
        ];
    }
}
