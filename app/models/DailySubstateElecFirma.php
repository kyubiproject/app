<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "DailySubstateElecFirma".
 *
 * @property int $id
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
 * @property int $deleted
 * @property string|null $updated_at
 * @property int $upload_id
 */
class DailySubstateElecFirma extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'DailySubstateElecFirma';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'SIST_ORIGEN', 'CONTRACT_ID', 'NODE_ID', 'STATE', 'SUBSTATE', 'VELOCIDAD_ACCESO', 'VELOCIDAD', 'upload_id'], 'required'],
            [['id', 'CONTRACT_ID', 'NODE_ID', 'USER_ID', 'RULE_ID', 'STATE', 'SUBSTATE', 'ESTADOANT', 'PIN_COUNT', 'PIN_SMS', 'PIN_VOZ', 'BAD_EMAIL', 'BAD_TELEPHONE', 'VELOCIDAD_ACCESO', 'VELOCIDAD', 'deleted', 'upload_id'], 'integer'],
            [['FECHA_EXTRACCION', 'FECHA_CREATED', 'FECHA_MODIFICACION', 'FECHA_FIN', 'updated_at'], 'safe'],
            [['SIST_ORIGEN'], 'string', 'max' => 10],
            [['EMAIL_ADDRESS'], 'string', 'max' => 150],
            [['TELEPHONE', 'SIGN_METHOD', 'LAST_SIGN_METHOD'], 'string', 'max' => 20],
            [['id'], 'unique'],
            [['SIST_ORIGEN', 'CONTRACT_ID', 'NODE_ID'], 'unique', 'targetAttribute' => ['SIST_ORIGEN', 'CONTRACT_ID', 'NODE_ID']],
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
            'deleted' => Yii::t('app', 'Deleted'),
            'updated_at' => Yii::t('app', 'Updated At'),
            'upload_id' => Yii::t('app', 'Upload ID'),
        ];
    }
}
