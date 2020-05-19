<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "Role".
 *
 * @property int $id
 * @property string $name
 * @property string $permissions
 * @property string $updated_at
 */
class Role extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'Role';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'permissions'], 'required'],
            [['permissions'], 'string'],
            [['updated_at'], 'safe'],
            [['name'], 'string', 'max' => 100],
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
            'permissions' => Yii::t('app', 'Permissions'),
            'updated_at' => Yii::t('app', 'Updated At'),
        ];
    }
}
