<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "DailySubstate_2009".
 *
 * @property int $id
 * @property string $FECHA_EXTRACCION
 * @property int $CONTRACT_ID
 * @property string|null $EMISOR
 * @property string|null $EMISOR_DELEGATE
 * @property string $GUID
 * @property string|null $EXPEDICION
 * @property string|null $TX_TIPO
 * @property string|null $SERVICIO
 * @property string|null $LANGUAGE
 * @property int $STATE
 * @property int $SUBSTATE
 * @property string $SUBSTATE_COMMENT
 * @property string|null $FECHA_CREATED
 * @property string|null $FECHA_CREATED_DATE
 * @property string|null $FECHA_SUBSTATE_DATE
 * @property string|null $FECHA_PRINTED_DATE
 * @property string|null $FECHA_MODIFICACION
 * @property string|null $FECHA_FIN
 * @property int|null $COD_PROVINCIA
 * @property string|null $ADDRESS_COUNTRY
 * @property string|null $ADDRESS_ZIP
 * @property string|null $FECHA_ESTADO_SEUR
 * @property string|null $CODIGO_SEUR
 * @property string|null $ESTADO_SEUR
 * @property int|null $SEUR_FRANQUICIA
 * @property int|null $SEUR_CARGA_MANUAL_ORIGEN
 * @property int|null $SEUR_CARGA_MANUAL_FINAL
 * @property int|null $CERT_LOGALTY
 * @property string|null $CERT_SEUR
 * @property string|null $QA_FECHA_ANALISIS
 * @property string|null $QA_FDD_TIPO
 * @property string|null $QA_FDD_DESCRIPCION
 * @property string|null $QA_FDD_CLASIFICACION
 * @property string|null $CONVERSION
 * @property int|null $CLEANED
 * @property int $deleted
 * @property string|null $updated_at
 * @property int $upload_id
 */
class DailySubstate2009 extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'DailySubstate_2009';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'CONTRACT_ID', 'GUID', 'STATE', 'SUBSTATE', 'SUBSTATE_COMMENT'], 'required'],
            [['id', 'CONTRACT_ID', 'STATE', 'SUBSTATE', 'COD_PROVINCIA', 'SEUR_FRANQUICIA', 'SEUR_CARGA_MANUAL_ORIGEN', 'SEUR_CARGA_MANUAL_FINAL', 'CERT_LOGALTY', 'CLEANED', 'deleted', 'upload_id'], 'integer'],
            [['FECHA_EXTRACCION', 'FECHA_CREATED', 'FECHA_CREATED_DATE', 'FECHA_SUBSTATE_DATE', 'FECHA_PRINTED_DATE', 'FECHA_MODIFICACION', 'FECHA_FIN', 'FECHA_ESTADO_SEUR', 'QA_FECHA_ANALISIS', 'updated_at'], 'safe'],
            [['CERT_SEUR'], 'string'],
            [['EMISOR', 'EMISOR_DELEGATE'], 'string', 'max' => 255],
            [['GUID', 'QA_FDD_CLASIFICACION'], 'string', 'max' => 50],
            [['EXPEDICION'], 'string', 'max' => 20],
            [['TX_TIPO'], 'string', 'max' => 11],
            [['SERVICIO'], 'string', 'max' => 19],
            [['LANGUAGE'], 'string', 'max' => 5],
            [['SUBSTATE_COMMENT', 'ESTADO_SEUR'], 'string', 'max' => 100],
            [['ADDRESS_COUNTRY', 'QA_FDD_TIPO', 'CONVERSION'], 'string', 'max' => 2],
            [['ADDRESS_ZIP', 'CODIGO_SEUR', 'QA_FDD_DESCRIPCION'], 'string', 'max' => 10],
            [['id'], 'unique'],
            [['GUID'], 'unique'],
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
            'CONTRACT_ID' => Yii::t('app', 'Contract ID'),
            'EMISOR' => Yii::t('app', 'Emisor'),
            'EMISOR_DELEGATE' => Yii::t('app', 'Emisor Delegate'),
            'GUID' => Yii::t('app', 'Guid'),
            'EXPEDICION' => Yii::t('app', 'Expedicion'),
            'TX_TIPO' => Yii::t('app', 'Tx Tipo'),
            'SERVICIO' => Yii::t('app', 'Servicio'),
            'LANGUAGE' => Yii::t('app', 'Language'),
            'STATE' => Yii::t('app', 'State'),
            'SUBSTATE' => Yii::t('app', 'Substate'),
            'SUBSTATE_COMMENT' => Yii::t('app', 'Substate Comment'),
            'FECHA_CREATED' => Yii::t('app', 'Fecha Created'),
            'FECHA_CREATED_DATE' => Yii::t('app', 'Fecha Created Date'),
            'FECHA_SUBSTATE_DATE' => Yii::t('app', 'Fecha Substate Date'),
            'FECHA_PRINTED_DATE' => Yii::t('app', 'Fecha Printed Date'),
            'FECHA_MODIFICACION' => Yii::t('app', 'Fecha Modificacion'),
            'FECHA_FIN' => Yii::t('app', 'Fecha Fin'),
            'COD_PROVINCIA' => Yii::t('app', 'Cod Provincia'),
            'ADDRESS_COUNTRY' => Yii::t('app', 'Address Country'),
            'ADDRESS_ZIP' => Yii::t('app', 'Address Zip'),
            'FECHA_ESTADO_SEUR' => Yii::t('app', 'Fecha Estado Seur'),
            'CODIGO_SEUR' => Yii::t('app', 'Codigo Seur'),
            'ESTADO_SEUR' => Yii::t('app', 'Estado Seur'),
            'SEUR_FRANQUICIA' => Yii::t('app', 'Seur Franquicia'),
            'SEUR_CARGA_MANUAL_ORIGEN' => Yii::t('app', 'Seur Carga Manual Origen'),
            'SEUR_CARGA_MANUAL_FINAL' => Yii::t('app', 'Seur Carga Manual Final'),
            'CERT_LOGALTY' => Yii::t('app', 'Cert Logalty'),
            'CERT_SEUR' => Yii::t('app', 'Cert Seur'),
            'QA_FECHA_ANALISIS' => Yii::t('app', 'Qa Fecha Analisis'),
            'QA_FDD_TIPO' => Yii::t('app', 'Qa Fdd Tipo'),
            'QA_FDD_DESCRIPCION' => Yii::t('app', 'Qa Fdd Descripcion'),
            'QA_FDD_CLASIFICACION' => Yii::t('app', 'Qa Fdd Clasificacion'),
            'CONVERSION' => Yii::t('app', 'Conversion'),
            'CLEANED' => Yii::t('app', 'Cleaned'),
            'deleted' => Yii::t('app', 'Deleted'),
            'updated_at' => Yii::t('app', 'Updated At'),
            'upload_id' => Yii::t('app', 'Upload ID'),
        ];
    }
}
