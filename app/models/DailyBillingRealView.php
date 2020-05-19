<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "DailyBillingRealView".
 *
 * @property int $id
 * @property string|null $FECHA
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
 * @property float $BASE
 * @property int $IS_UD
 */
class DailyBillingRealView extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'DailyBillingRealView';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'EMISOR_ID', 'PERIODO', 'ANNO', 'MES', 'IS_UD'], 'integer'],
            [['EMISOR_ID', 'EMISOR_NOMBRE', 'NIF', 'TIPO', 'SUBTIPO', 'PERIODO', 'ANNO', 'MES', 'UM', 'CANTIDAD'], 'required'],
            [['CANTIDAD', 'IMPORTE', 'BASE'], 'number'],
            [['FECHA'], 'string', 'max' => 10],
            [['EMISOR_NOMBRE', 'TERCERO', 'SUBTIPO'], 'string', 'max' => 200],
            [['NIF', 'SERV', 'TIPO_SERV', 'TIPO'], 'string', 'max' => 20],
            [['UM'], 'string', 'max' => 5],
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
            'BASE' => Yii::t('app', 'Base'),
            'IS_UD' => Yii::t('app', 'Is Ud'),
        ];
    }
}
