<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "Lenguaje".
 *
 * @property string $id
 * @property string $updated_at
 */
class Lenguaje extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'Lenguaje';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id'], 'required'],
            [['updated_at'], 'safe'],
            [['id'], 'string', 'max' => 5],
            [['id'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'updated_at' => Yii::t('app', 'Updated At'),
        ];
    }
}
