<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "SubestadoElec".
 *
 * @property int $id
 * @property int $SUBSTATE
 * @property string $COMMENT
 * @property string $SERVICIO
 * @property int|null $peso
 * @property string|null $color
 * @property string $updated_at
 */
class SubestadoElec extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'SubestadoElec';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['SUBSTATE', 'COMMENT', 'SERVICIO'], 'required'],
            [['SUBSTATE', 'peso'], 'integer'],
            [['SERVICIO'], 'string'],
            [['updated_at'], 'safe'],
            [['COMMENT'], 'string', 'max' => 100],
            [['color'], 'string', 'max' => 8],
            [['SUBSTATE', 'COMMENT'], 'unique', 'targetAttribute' => ['SUBSTATE', 'COMMENT']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'SUBSTATE' => Yii::t('app', 'Substate'),
            'COMMENT' => Yii::t('app', 'Comment'),
            'SERVICIO' => Yii::t('app', 'Servicio'),
            'peso' => Yii::t('app', 'Peso'),
            'color' => Yii::t('app', 'Color'),
            'updated_at' => Yii::t('app', 'Updated At'),
        ];
    }
}
