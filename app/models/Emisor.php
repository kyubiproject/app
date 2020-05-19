<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "Emisor".
 *
 * @property int $id
 * @property int $CONTRACT_ID
 * @property string $SIST_ORIGEN
 * @property string|null $CREATED
 * @property string $NAME
 * @property string|null $COMERCIAL
 * @property string|null $ISBILLABLE
 * @property int|null $SEUR_POSTAL_EXPIRATION
 * @property int|null $CLIENT_POSTAL_EXPIRATION
 * @property int $deleted
 * @property string|null $updated_at
 * @property int|null $upload_id
 */
class Emisor extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'Emisor';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['CONTRACT_ID', 'SIST_ORIGEN', 'NAME'], 'required'],
            [['CONTRACT_ID', 'SEUR_POSTAL_EXPIRATION', 'CLIENT_POSTAL_EXPIRATION', 'deleted', 'upload_id'], 'integer'],
            [['CREATED', 'updated_at'], 'safe'],
            [['SIST_ORIGEN'], 'string', 'max' => 20],
            [['NAME', 'COMERCIAL'], 'string', 'max' => 100],
            [['ISBILLABLE'], 'string', 'max' => 1],
            [['CONTRACT_ID', 'SIST_ORIGEN'], 'unique', 'targetAttribute' => ['CONTRACT_ID', 'SIST_ORIGEN']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'CONTRACT_ID' => Yii::t('app', 'Contract ID'),
            'SIST_ORIGEN' => Yii::t('app', 'Sist Origen'),
            'CREATED' => Yii::t('app', 'Created'),
            'NAME' => Yii::t('app', 'Name'),
            'COMERCIAL' => Yii::t('app', 'Comercial'),
            'ISBILLABLE' => Yii::t('app', 'Isbillable'),
            'SEUR_POSTAL_EXPIRATION' => Yii::t('app', 'Seur Postal Expiration'),
            'CLIENT_POSTAL_EXPIRATION' => Yii::t('app', 'Client Postal Expiration'),
            'deleted' => Yii::t('app', 'Deleted'),
            'updated_at' => Yii::t('app', 'Updated At'),
            'upload_id' => Yii::t('app', 'Upload ID'),
        ];
    }
}
