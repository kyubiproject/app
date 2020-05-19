<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "Widget".
 *
 * @property int $id
 * @property string $name
 * @property string $module
 * @property string $type
 * @property string $params
 * @property int $order
 * @property string $updated_at
 */
class Widget extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'Widget';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'module', 'type', 'params'], 'required'],
            [['module', 'type'], 'string'],
            [['order'], 'integer'],
            [['updated_at'], 'safe'],
            [['name'], 'string', 'max' => 100],
            [['params'], 'string', 'max' => 1000],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
            'module' => Yii::t('app', 'Module'),
            'type' => Yii::t('app', 'Type'),
            'params' => Yii::t('app', 'Params'),
            'order' => Yii::t('app', 'Order'),
            'updated_at' => Yii::t('app', 'Updated At'),
        ];
    }
}
