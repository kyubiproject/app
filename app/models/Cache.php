<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "Cache".
 *
 * @property int $id
 * @property resource $query
 * @property resource|null $params
 * @property resource $result
 * @property string $dependency
 */
class Cache extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'Cache';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['query', 'result', 'dependency'], 'required'],
            [['query', 'params', 'result'], 'string'],
            [['dependency'], 'string', 'max' => 100],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'query' => Yii::t('app', 'Query'),
            'params' => Yii::t('app', 'Params'),
            'result' => Yii::t('app', 'Result'),
            'dependency' => Yii::t('app', 'Dependency'),
        ];
    }
}
