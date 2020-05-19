<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "DailyBilling".
 *
 * @property int $id
 * @property string $FECHA
 * @property int $EMISOR_ID
 * @property string|null $EMISOR_NOMBRE
 * @property string $TERCERO
 * @property string $NIF NIF del tercero
 * @property string $FACTURACION_TIPO
 * @property int $L_FACTURABLE
 * @property string $TIPO
 * @property string $SERVICIO_CODIGO
 * @property int $UD
 * @property float $PRECIO
 * @property float $IMPORTE
 * @property string $PAQ_TIPO
 * @property string|null $PAQ_FECHA_DESDE
 * @property string|null $PAQ_FECHA_HASTA
 * @property int|null $PAQ_TX_MAX
 * @property int|null $PAQ_TX
 * @property float|null $PAQ_CUOTAS_PRECIO
 * @property int|null $PAQ_CUOTAS
 * @property int $deleted
 * @property string|null $updated_at
 * @property int $upload_id
 */
class DailyBilling extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'DailyBilling';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['FECHA', 'EMISOR_ID', 'FACTURACION_TIPO', 'TIPO', 'SERVICIO_CODIGO', 'UD', 'PRECIO', 'IMPORTE', 'PAQ_TIPO', 'upload_id'], 'required'],
            [['FECHA', 'PAQ_FECHA_DESDE', 'PAQ_FECHA_HASTA', 'updated_at'], 'safe'],
            [['EMISOR_ID', 'L_FACTURABLE', 'UD', 'PAQ_TX_MAX', 'PAQ_TX', 'PAQ_CUOTAS', 'deleted', 'upload_id'], 'integer'],
            [['FACTURACION_TIPO', 'TIPO'], 'string'],
            [['PRECIO', 'IMPORTE', 'PAQ_CUOTAS_PRECIO'], 'number'],
            [['EMISOR_NOMBRE', 'TERCERO'], 'string', 'max' => 200],
            [['NIF'], 'string', 'max' => 9],
            [['SERVICIO_CODIGO', 'PAQ_TIPO'], 'string', 'max' => 10],
            [['FECHA', 'EMISOR_ID', 'FACTURACION_TIPO', 'TIPO', 'SERVICIO_CODIGO', 'PAQ_TIPO'], 'unique', 'targetAttribute' => ['FECHA', 'EMISOR_ID', 'FACTURACION_TIPO', 'TIPO', 'SERVICIO_CODIGO', 'PAQ_TIPO']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'FECHA' => Yii::t('app', 'Fecha'),
            'EMISOR_ID' => Yii::t('app', 'Emisor ID'),
            'EMISOR_NOMBRE' => Yii::t('app', 'Emisor Nombre'),
            'TERCERO' => Yii::t('app', 'Tercero'),
            'NIF' => Yii::t('app', 'Nif'),
            'FACTURACION_TIPO' => Yii::t('app', 'Facturacion Tipo'),
            'L_FACTURABLE' => Yii::t('app', 'L Facturable'),
            'TIPO' => Yii::t('app', 'Tipo'),
            'SERVICIO_CODIGO' => Yii::t('app', 'Servicio Codigo'),
            'UD' => Yii::t('app', 'Ud'),
            'PRECIO' => Yii::t('app', 'Precio'),
            'IMPORTE' => Yii::t('app', 'Importe'),
            'PAQ_TIPO' => Yii::t('app', 'Paq Tipo'),
            'PAQ_FECHA_DESDE' => Yii::t('app', 'Paq Fecha Desde'),
            'PAQ_FECHA_HASTA' => Yii::t('app', 'Paq Fecha Hasta'),
            'PAQ_TX_MAX' => Yii::t('app', 'Paq Tx Max'),
            'PAQ_TX' => Yii::t('app', 'Paq Tx'),
            'PAQ_CUOTAS_PRECIO' => Yii::t('app', 'Paq Cuotas Precio'),
            'PAQ_CUOTAS' => Yii::t('app', 'Paq Cuotas'),
            'deleted' => Yii::t('app', 'Deleted'),
            'updated_at' => Yii::t('app', 'Updated At'),
            'upload_id' => Yii::t('app', 'Upload ID'),
        ];
    }
}
