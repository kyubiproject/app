<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "Ordenante".
 *
 * @property int $id
 * @property string $name
 * @property string $updated_at
 */
class Ordenante extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'Ordenante';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'name'], 'required'],
            [['id'], 'integer'],
            [['updated_at'], 'safe'],
            [['name'], 'string', 'max' => 255],
            [['id', 'name'], 'unique', 'targetAttribute' => ['id', 'name']],
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
            'updated_at' => Yii::t('app', 'Updated At'),
        ];
    }
}
