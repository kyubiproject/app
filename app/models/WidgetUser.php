<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "WidgetUser".
 *
 * @property int $widget_id
 * @property int $user_id
 * @property string|null $params
 * @property string $updated_at
 *
 * @property User $user
 * @property Widget $widget
 */
class WidgetUser extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'WidgetUser';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['widget_id', 'user_id'], 'required'],
            [['widget_id', 'user_id'], 'integer'],
            [['updated_at'], 'safe'],
            [['params'], 'string', 'max' => 1000],
            [['widget_id', 'user_id'], 'unique', 'targetAttribute' => ['widget_id', 'user_id']],
            [['widget_id'], 'exist', 'skipOnError' => true, 'targetClass' => Widget::className(), 'targetAttribute' => ['widget_id' => 'id']],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['user_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'widget_id' => Yii::t('app', 'Widget ID'),
            'user_id' => Yii::t('app', 'User ID'),
            'params' => Yii::t('app', 'Params'),
            'updated_at' => Yii::t('app', 'Updated At'),
        ];
    }

    /**
     * Gets query for [[User]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    /**
     * Gets query for [[Widget]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getWidget()
    {
        return $this->hasOne(Widget::className(), ['id' => 'widget_id']);
    }
}
