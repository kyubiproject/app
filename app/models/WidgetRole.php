<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "WidgetRole".
 *
 * @property int $widget_id
 * @property int $role_id
 * @property string|null $params
 * @property string $updated_at
 *
 * @property Role $role
 * @property Widget $widget
 */
class WidgetRole extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'WidgetRole';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['widget_id', 'role_id'], 'required'],
            [['widget_id', 'role_id'], 'integer'],
            [['updated_at'], 'safe'],
            [['params'], 'string', 'max' => 1000],
            [['widget_id', 'role_id'], 'unique', 'targetAttribute' => ['widget_id', 'role_id']],
            [['widget_id'], 'exist', 'skipOnError' => true, 'targetClass' => Widget::className(), 'targetAttribute' => ['widget_id' => 'id']],
            [['role_id'], 'exist', 'skipOnError' => true, 'targetClass' => Role::className(), 'targetAttribute' => ['role_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'widget_id' => Yii::t('app', 'Widget ID'),
            'role_id' => Yii::t('app', 'Role ID'),
            'params' => Yii::t('app', 'Params'),
            'updated_at' => Yii::t('app', 'Updated At'),
        ];
    }

    /**
     * Gets query for [[Role]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRole()
    {
        return $this->hasOne(Role::className(), ['id' => 'role_id']);
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
