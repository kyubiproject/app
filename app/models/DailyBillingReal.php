<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "DailyBillingReal".
 *
 * @property int $id
 * @property int $EMISOR_ID
 * @property string $EMISOR_NOMBRE
 * @property string|null $TERCERO
 * @property string $NIF
 * @property string $SERV
 * @property string $TIPO_SERV
 * @property string $TIPO
 * @property string $SUBTIPO
 * @property int $PERIODO
 * @property int $ANNO
 * @property int $MES
 * @property string $UM
 * @property float $CANTIDAD
 * @property float|null $IMPORTE
 * @property int $deleted
 * @property string|null $updated_at
 * @property int $upload_id
 */
class DailyBillingReal extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'DailyBillingReal';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['EMISOR_ID', 'EMISOR_NOMBRE', 'NIF', 'SERV', 'TIPO_SERV', 'TIPO', 'SUBTIPO', 'PERIODO', 'ANNO', 'MES', 'UM', 'CANTIDAD', 'upload_id'], 'required'],
            [['EMISOR_ID', 'PERIODO', 'ANNO', 'MES', 'deleted', 'upload_id'], 'integer'],
            [['CANTIDAD', 'IMPORTE'], 'number'],
            [['updated_at'], 'safe'],
            [['EMISOR_NOMBRE', 'TERCERO', 'SUBTIPO'], 'string', 'max' => 200],
            [['NIF', 'SERV', 'TIPO_SERV', 'TIPO'], 'string', 'max' => 20],
            [['UM'], 'string', 'max' => 5],
            [['EMISOR_ID', 'NIF', 'SERV', 'TIPO_SERV', 'TIPO', 'SUBTIPO', 'PERIODO', 'ANNO', 'MES', 'UM', 'CANTIDAD'], 'unique', 'targetAttribute' => ['EMISOR_ID', 'NIF', 'SERV', 'TIPO_SERV', 'TIPO', 'SUBTIPO', 'PERIODO', 'ANNO', 'MES', 'UM', 'CANTIDAD']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'EMISOR_ID' => Yii::t('app', 'Emisor ID'),
            'EMISOR_NOMBRE' => Yii::t('app', 'Emisor Nombre'),
            'TERCERO' => Yii::t('app', 'Tercero'),
            'NIF' => Yii::t('app', 'Nif'),
            'SERV' => Yii::t('app', 'Serv'),
            'TIPO_SERV' => Yii::t('app', 'Tipo Serv'),
            'TIPO' => Yii::t('app', 'Tipo'),
            'SUBTIPO' => Yii::t('app', 'Subtipo'),
            'PERIODO' => Yii::t('app', 'Periodo'),
            'ANNO' => Yii::t('app', 'Anno'),
            'MES' => Yii::t('app', 'Mes'),
            'UM' => Yii::t('app', 'Um'),
            'CANTIDAD' => Yii::t('app', 'Cantidad'),
            'IMPORTE' => Yii::t('app', 'Importe'),
            'deleted' => Yii::t('app', 'Deleted'),
            'updated_at' => Yii::t('app', 'Updated At'),
            'upload_id' => Yii::t('app', 'Upload ID'),
        ];
    }
}
