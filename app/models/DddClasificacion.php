<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "DddClasificacion".
 *
 * @property string $id
 * @property string $updated_at
 */
class DddClasificacion extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'DddClasificacion';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id'], 'required'],
            [['updated_at'], 'safe'],
            [['id'], 'string', 'max' => 50],
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
