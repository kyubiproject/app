<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "Upload".
 *
 * @property int $id
 * @property int|null $user_id
 * @property string|null $filename
 * @property string|null $ip
 * @property string|null $user_agent
 * @property string|null $type
 * @property string $module
 * @property int $totals
 * @property int $linked
 * @property int $successes
 * @property int $replaces
 * @property int $errors
 * @property string|null $date_from
 * @property string|null $date_to
 * @property int $uploaded
 * @property int $deleted
 * @property string $created_at
 */
class Upload extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'Upload';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id', 'totals', 'linked', 'successes', 'replaces', 'errors', 'uploaded', 'deleted'], 'integer'],
            [['type'], 'string'],
            [['module'], 'required'],
            [['date_from', 'date_to', 'created_at'], 'safe'],
            [['filename'], 'string', 'max' => 256],
            [['ip'], 'string', 'max' => 45],
            [['user_agent'], 'string', 'max' => 512],
            [['module'], 'string', 'max' => 30],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'user_id' => Yii::t('app', 'User ID'),
            'filename' => Yii::t('app', 'Filename'),
            'ip' => Yii::t('app', 'Ip'),
            'user_agent' => Yii::t('app', 'User Agent'),
            'type' => Yii::t('app', 'Type'),
            'module' => Yii::t('app', 'Module'),
            'totals' => Yii::t('app', 'Totals'),
            'linked' => Yii::t('app', 'Linked'),
            'successes' => Yii::t('app', 'Successes'),
            'replaces' => Yii::t('app', 'Replaces'),
            'errors' => Yii::t('app', 'Errors'),
            'date_from' => Yii::t('app', 'Date From'),
            'date_to' => Yii::t('app', 'Date To'),
            'uploaded' => Yii::t('app', 'Uploaded'),
            'deleted' => Yii::t('app', 'Deleted'),
            'created_at' => Yii::t('app', 'Created At'),
        ];
    }
}
