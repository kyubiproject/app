<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "User".
 *
 * @property int $id
 * @property string $username
 * @property string $name
 * @property string $password
 * @property string $email
 * @property string|null $logged_at
 * @property string $created_at
 */
class User extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'User';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['username', 'name', 'password', 'email'], 'required'],
            [['logged_at', 'created_at'], 'safe'],
            [['username', 'name'], 'string', 'max' => 50],
            [['password', 'email'], 'string', 'max' => 100],
            [['username'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'username' => Yii::t('app', 'Username'),
            'name' => Yii::t('app', 'Name'),
            'password' => Yii::t('app', 'Password'),
            'email' => Yii::t('app', 'Email'),
            'logged_at' => Yii::t('app', 'Logged At'),
            'created_at' => Yii::t('app', 'Created At'),
        ];
    }
}
