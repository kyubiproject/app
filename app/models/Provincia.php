<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "Provincia".
 *
 * @property int $id
 * @property string|null $ISO
 * @property string $Nombre
 * @property string|null $Pais
 * @property string $updated_at
 */
class Provincia extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'Provincia';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['Nombre'], 'required'],
            [['updated_at'], 'safe'],
            [['ISO'], 'string', 'max' => 5],
            [['Nombre'], 'string', 'max' => 100],
            [['Pais'], 'string', 'max' => 4],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'ISO' => Yii::t('app', 'Iso'),
            'Nombre' => Yii::t('app', 'Nombre'),
            'Pais' => Yii::t('app', 'Pais'),
            'updated_at' => Yii::t('app', 'Updated At'),
        ];
    }
}
