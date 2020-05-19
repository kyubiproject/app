<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "Servicio".
 *
 * @property string $id
 * @property string $name
 * @property string $updated_at
 */
class Servicio extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'Servicio';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'name'], 'required'],
            [['updated_at'], 'safe'],
            [['id', 'name'], 'string', 'max' => 100],
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
            'name' => Yii::t('app', 'Name'),
            'updated_at' => Yii::t('app', 'Updated At'),
        ];
    }
}
