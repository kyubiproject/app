<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "DailySubstateElec_2015".
 *
 * @property int $id
 * @property string $FECHA_EXTRACCION
 * @property string|null $SIST_ORIGEN
 * @property string $EMISOR
 * @property string|null $EMISOR_DELEGATE
 * @property int $NODE_ID
 * @property int $CONTRACT_ID
 * @property string $TX_TIPO
 * @property string $SERVICIO
 * @property string|null $LANGUAGE
 * @property int $STATE
 * @property int $SUBSTATE
 * @property string|null $MOTIVO_CANCELA
 * @property string $FECHA_CREATED
 * @property string $FECHA_MODIFICACION
 * @property string $FECHA_FIN
 * @property string|null $EXTERNAL_ID
 * @property string|null $BILLING_INFO
 * @property int $SYNCRONO
 * @property int $DOC_COUNT
 * @property int $FIRMANTES
 * @property int $TAMANIO
 * @property int $PIN_COUNT
 * @property int $PIN_SMS
 * @property int $PIN_VOZ
 * @property int|null $TIME2CLOSE
 * @property int|null $TIME2SAVE
 * @property int|null $RETRIES
 * @property int|null $ENFORCE_DOWNLOAD
 * @property string|null $NOTICE_METHOD
 * @property string|null $USERDEFINED_NAME
 * @property string|null $BILLING_PRODUCT
 * @property int|null $ACCESS_TIME
 * @property int|null $SIGN_TIME
 * @property int|null $CLOSE_TIME
 * @property int|null $TX_TIME
 * @property int $deleted
 * @property string|null $updated_at
 * @property int $upload_id
 */
class DailySubstateElec2015 extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'DailySubstateElec_2015';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'EMISOR', 'NODE_ID', 'CONTRACT_ID', 'TX_TIPO', 'SERVICIO', 'STATE', 'SUBSTATE', 'DOC_COUNT', 'FIRMANTES', 'upload_id'], 'required'],
            [['id', 'NODE_ID', 'CONTRACT_ID', 'STATE', 'SUBSTATE', 'SYNCRONO', 'DOC_COUNT', 'FIRMANTES', 'TAMANIO', 'PIN_COUNT', 'PIN_SMS', 'PIN_VOZ', 'TIME2CLOSE', 'TIME2SAVE', 'RETRIES', 'ENFORCE_DOWNLOAD', 'ACCESS_TIME', 'SIGN_TIME', 'CLOSE_TIME', 'TX_TIME', 'deleted', 'upload_id'], 'integer'],
            [['FECHA_EXTRACCION', 'FECHA_CREATED', 'FECHA_MODIFICACION', 'FECHA_FIN', 'updated_at'], 'safe'],
            [['SIST_ORIGEN', 'TX_TIPO', 'NOTICE_METHOD', 'BILLING_PRODUCT'], 'string', 'max' => 20],
            [['EMISOR', 'EMISOR_DELEGATE', 'MOTIVO_CANCELA'], 'string', 'max' => 255],
            [['SERVICIO', 'USERDEFINED_NAME'], 'string', 'max' => 50],
            [['LANGUAGE'], 'string', 'max' => 5],
            [['EXTERNAL_ID'], 'string', 'max' => 500],
            [['BILLING_INFO'], 'string', 'max' => 150],
            [['id'], 'unique'],
            [['NODE_ID'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'FECHA_EXTRACCION' => Yii::t('app', 'Fecha Extraccion'),
            'SIST_ORIGEN' => Yii::t('app', 'Sist Origen'),
            'EMISOR' => Yii::t('app', 'Emisor'),
            'EMISOR_DELEGATE' => Yii::t('app', 'Emisor Delegate'),
            'NODE_ID' => Yii::t('app', 'Node ID'),
            'CONTRACT_ID' => Yii::t('app', 'Contract ID'),
            'TX_TIPO' => Yii::t('app', 'Tx Tipo'),
            'SERVICIO' => Yii::t('app', 'Servicio'),
            'LANGUAGE' => Yii::t('app', 'Language'),
            'STATE' => Yii::t('app', 'State'),
            'SUBSTATE' => Yii::t('app', 'Substate'),
            'MOTIVO_CANCELA' => Yii::t('app', 'Motivo Cancela'),
            'FECHA_CREATED' => Yii::t('app', 'Fecha Created'),
            'FECHA_MODIFICACION' => Yii::t('app', 'Fecha Modificacion'),
            'FECHA_FIN' => Yii::t('app', 'Fecha Fin'),
            'EXTERNAL_ID' => Yii::t('app', 'External ID'),
            'BILLING_INFO' => Yii::t('app', 'Billing Info'),
            'SYNCRONO' => Yii::t('app', 'Syncrono'),
            'DOC_COUNT' => Yii::t('app', 'Doc Count'),
            'FIRMANTES' => Yii::t('app', 'Firmantes'),
            'TAMANIO' => Yii::t('app', 'Tamanio'),
            'PIN_COUNT' => Yii::t('app', 'Pin Count'),
            'PIN_SMS' => Yii::t('app', 'Pin Sms'),
            'PIN_VOZ' => Yii::t('app', 'Pin Voz'),
            'TIME2CLOSE' => Yii::t('app', 'Time2 Close'),
            'TIME2SAVE' => Yii::t('app', 'Time2 Save'),
            'RETRIES' => Yii::t('app', 'Retries'),
            'ENFORCE_DOWNLOAD' => Yii::t('app', 'Enforce Download'),
            'NOTICE_METHOD' => Yii::t('app', 'Notice Method'),
            'USERDEFINED_NAME' => Yii::t('app', 'Userdefined Name'),
            'BILLING_PRODUCT' => Yii::t('app', 'Billing Product'),
            'ACCESS_TIME' => Yii::t('app', 'Access Time'),
            'SIGN_TIME' => Yii::t('app', 'Sign Time'),
            'CLOSE_TIME' => Yii::t('app', 'Close Time'),
            'TX_TIME' => Yii::t('app', 'Tx Time'),
            'deleted' => Yii::t('app', 'Deleted'),
            'updated_at' => Yii::t('app', 'Updated At'),
            'upload_id' => Yii::t('app', 'Upload ID'),
        ];
    }
}
