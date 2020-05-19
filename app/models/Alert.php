<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "Alert".
 *
 * @property int $id
 * @property string $modules
 * @property string $period
 * @property int $daily
 * @property string|null $emails
 * @property string $updated_at
 */
class Alert extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'Alert';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['modules', 'period', 'daily'], 'required'],
            [['daily'], 'integer'],
            [['updated_at'], 'safe'],
            [['modules'], 'string', 'max' => 500],
            [['period'], 'string', 'max' => 10],
            [['emails'], 'string', 'max' => 2000],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'modules' => Yii::t('app', 'Modules'),
            'period' => Yii::t('app', 'Period'),
            'daily' => Yii::t('app', 'Daily'),
            'emails' => Yii::t('app', 'Emails'),
            'updated_at' => Yii::t('app', 'Updated At'),
        ];
    }
}
