<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "Subestado".
 *
 * @property int $id
 * @property int $SUBSTATE
 * @property string $SUBSTATE_COMMENT
 * @property string $COMMENT
 * @property int|null $outcome
 * @property int|null $peso
 * @property string|null $color
 * @property string $updated_at
 */
class Subestado extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'Subestado';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['SUBSTATE', 'SUBSTATE_COMMENT'], 'required'],
            [['SUBSTATE', 'outcome', 'peso'], 'integer'],
            [['updated_at'], 'safe'],
            [['SUBSTATE_COMMENT', 'COMMENT'], 'string', 'max' => 100],
            [['color'], 'string', 'max' => 8],
            [['SUBSTATE_COMMENT', 'SUBSTATE'], 'unique', 'targetAttribute' => ['SUBSTATE_COMMENT', 'SUBSTATE']],
            [['SUBSTATE', 'SUBSTATE_COMMENT'], 'unique', 'targetAttribute' => ['SUBSTATE', 'SUBSTATE_COMMENT']],
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
            'SUBSTATE_COMMENT' => Yii::t('app', 'Substate Comment'),
            'COMMENT' => Yii::t('app', 'Comment'),
            'outcome' => Yii::t('app', 'Outcome'),
            'peso' => Yii::t('app', 'Peso'),
            'color' => Yii::t('app', 'Color'),
            'updated_at' => Yii::t('app', 'Updated At'),
        ];
    }
}
