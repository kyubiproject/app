<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "DailySubstateElecFirma_api".
 *
 * @property string $FECHA_EXTRACCION
 * @property string $SIST_ORIGEN
 * @property int $CONTRACT_ID
 * @property int $NODE_ID
 * @property int|null $USER_ID
 * @property int|null $RULE_ID
 * @property int $STATE
 * @property int $SUBSTATE
 * @property int|null $ESTADOANT
 * @property string $FECHA_CREATED
 * @property string $FECHA_MODIFICACION
 * @property string $FECHA_FIN
 * @property int|null $PIN_COUNT
 * @property int|null $PIN_SMS
 * @property int|null $PIN_VOZ
 * @property string|null $EMAIL_ADDRESS
 * @property int|null $BAD_EMAIL
 * @property string|null $TELEPHONE
 * @property int|null $BAD_TELEPHONE
 * @property string|null $SIGN_METHOD
 * @property string|null $LAST_SIGN_METHOD
 * @property int $VELOCIDAD_ACCESO
 * @property int $VELOCIDAD
 * @property int $upload_id
 */
class DailySubstateElecFirmaApi extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'DailySubstateElecFirma_api';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['FECHA_EXTRACCION', 'FECHA_CREATED', 'FECHA_MODIFICACION', 'FECHA_FIN'], 'safe'],
            [['SIST_ORIGEN', 'CONTRACT_ID', 'NODE_ID', 'STATE', 'SUBSTATE', 'VELOCIDAD_ACCESO', 'VELOCIDAD', 'upload_id'], 'required'],
            [['CONTRACT_ID', 'NODE_ID', 'USER_ID', 'RULE_ID', 'STATE', 'SUBSTATE', 'ESTADOANT', 'PIN_COUNT', 'PIN_SMS', 'PIN_VOZ', 'BAD_EMAIL', 'BAD_TELEPHONE', 'VELOCIDAD_ACCESO', 'VELOCIDAD', 'upload_id'], 'integer'],
            [['SIST_ORIGEN'], 'string', 'max' => 10],
            [['EMAIL_ADDRESS'], 'string', 'max' => 150],
            [['TELEPHONE', 'SIGN_METHOD', 'LAST_SIGN_METHOD'], 'string', 'max' => 20],
            [['SIST_ORIGEN', 'CONTRACT_ID', 'NODE_ID'], 'unique', 'targetAttribute' => ['SIST_ORIGEN', 'CONTRACT_ID', 'NODE_ID']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'FECHA_EXTRACCION' => Yii::t('app', 'Fecha Extraccion'),
            'SIST_ORIGEN' => Yii::t('app', 'Sist Origen'),
            'CONTRACT_ID' => Yii::t('app', 'Contract ID'),
            'NODE_ID' => Yii::t('app', 'Node ID'),
            'USER_ID' => Yii::t('app', 'User ID'),
            'RULE_ID' => Yii::t('app', 'Rule ID'),
            'STATE' => Yii::t('app', 'State'),
            'SUBSTATE' => Yii::t('app', 'Substate'),
            'ESTADOANT' => Yii::t('app', 'Estadoant'),
            'FECHA_CREATED' => Yii::t('app', 'Fecha Created'),
            'FECHA_MODIFICACION' => Yii::t('app', 'Fecha Modificacion'),
            'FECHA_FIN' => Yii::t('app', 'Fecha Fin'),
            'PIN_COUNT' => Yii::t('app', 'Pin Count'),
            'PIN_SMS' => Yii::t('app', 'Pin Sms'),
            'PIN_VOZ' => Yii::t('app', 'Pin Voz'),
            'EMAIL_ADDRESS' => Yii::t('app', 'Email Address'),
            'BAD_EMAIL' => Yii::t('app', 'Bad Email'),
            'TELEPHONE' => Yii::t('app', 'Telephone'),
            'BAD_TELEPHONE' => Yii::t('app', 'Bad Telephone'),
            'SIGN_METHOD' => Yii::t('app', 'Sign Method'),
            'LAST_SIGN_METHOD' => Yii::t('app', 'Last Sign Method'),
            'VELOCIDAD_ACCESO' => Yii::t('app', 'Velocidad Acceso'),
            'VELOCIDAD' => Yii::t('app', 'Velocidad'),
            'upload_id' => Yii::t('app', 'Upload ID'),
        ];
    }
}
