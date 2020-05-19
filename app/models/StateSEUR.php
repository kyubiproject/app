<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "StateSEUR".
 *
 * @property int $id
 * @property string $CODIGO_SEUR
 * @property string $ESTADO_SEUR
 * @property int $peso
 * @property int $subpeso
 * @property string $color
 * @property string $updated_at
 */
class StateSEUR extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'StateSEUR';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['CODIGO_SEUR', 'ESTADO_SEUR'], 'required'],
            [['peso', 'subpeso'], 'integer'],
            [['updated_at'], 'safe'],
            [['CODIGO_SEUR'], 'string', 'max' => 8],
            [['ESTADO_SEUR'], 'string', 'max' => 50],
            [['color'], 'string', 'max' => 9],
            [['CODIGO_SEUR'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'CODIGO_SEUR' => Yii::t('app', 'Codigo Seur'),
            'ESTADO_SEUR' => Yii::t('app', 'Estado Seur'),
            'peso' => Yii::t('app', 'Peso'),
            'subpeso' => Yii::t('app', 'Subpeso'),
            'color' => Yii::t('app', 'Color'),
            'updated_at' => Yii::t('app', 'Updated At'),
        ];
    }
}
