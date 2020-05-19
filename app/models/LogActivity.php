<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "LogActivity".
 *
 * @property int $id
 * @property int $user_id
 * @property string $ipv4
 * @property string $url
 * @property string|null $last_url
 * @property string|null $post
 * @property float|null $time_sql
 * @property float|null $time_php
 * @property float|null $time_exc
 * @property float|null $memory_kb
 * @property string $created_at
 */
class LogActivity extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'LogActivity';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id', 'ipv4', 'url'], 'required'],
            [['user_id'], 'integer'],
            [['time_sql', 'time_php', 'time_exc', 'memory_kb'], 'number'],
            [['created_at'], 'safe'],
            [['ipv4'], 'string', 'max' => 20],
            [['url', 'last_url', 'post'], 'string', 'max' => 1000],
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
            'ipv4' => Yii::t('app', 'Ipv4'),
            'url' => Yii::t('app', 'Url'),
            'last_url' => Yii::t('app', 'Last Url'),
            'post' => Yii::t('app', 'Post'),
            'time_sql' => Yii::t('app', 'Time Sql'),
            'time_php' => Yii::t('app', 'Time Php'),
            'time_exc' => Yii::t('app', 'Time Exc'),
            'memory_kb' => Yii::t('app', 'Memory Kb'),
            'created_at' => Yii::t('app', 'Created At'),
        ];
    }
}
