<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "Calendario".
 *
 * @property int $id
 * @property string $title
 * @property string $start
 * @property string $color
 * @property int|null $is_holiday
 * @property string|null $countries
 * @property string|null $regions
 * @property string $updated_at
 */
class Calendario extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'Calendario';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['title', 'start'], 'required'],
            [['start', 'updated_at'], 'safe'],
            [['is_holiday'], 'integer'],
            [['title'], 'string', 'max' => 200],
            [['color'], 'string', 'max' => 7],
            [['countries'], 'string', 'max' => 100],
            [['regions'], 'string', 'max' => 500],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'title' => Yii::t('app', 'Title'),
            'start' => Yii::t('app', 'Start'),
            'color' => Yii::t('app', 'Color'),
            'is_holiday' => Yii::t('app', 'Is Holiday'),
            'countries' => Yii::t('app', 'Countries'),
            'regions' => Yii::t('app', 'Regions'),
            'updated_at' => Yii::t('app', 'Updated At'),
        ];
    }
}
