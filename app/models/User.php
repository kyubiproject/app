<?php
namespace app\models;

use yii\web\IdentityInterface;
use maestro\models\base\Delegacion;
use maestro\models\base\Usuario;

class User extends Usuario implements IdentityInterface
{

    /**
     * Finds an identity by the given ID.
     *
     * @param string|int $id
     *            the ID to be looked for
     * @return IdentityInterface|null the identity object that matches the given ID.
     */
    public static function findIdentity($id)
    {
        return static::findOne($id);
    }

    /**
     * Finds an identity by the given token.
     *
     * @param string $token
     *            the token to be looked for
     * @return IdentityInterface|null the identity object that matches the given token.
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {
        return static::findOne([
            'access_token' => $token
        ]);
    }

    /**
     *
     * @return int|string current user ID
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     *
     * @return string current user auth key
     */
    public function getAuthKey()
    {
        return $this->auth_key;
    }

    /**
     *
     * @param string $authKey
     * @return bool if auth key is valid for current user
     */
    public function validateAuthKey($authKey)
    {
        return $this->getAuthKey() === $authKey;
    }

    /**
     *
     * {@inheritdoc}
     * @see \yii\db\BaseActiveRecord::beforeSave()
     */
    public function beforeSave($insert)
    {
        if (parent::beforeSave($insert)) {
            if ($this->isNewRecord) {
                $this->auth_key = app()->security->generateRandomString();
            }
            return true;
        }
        return false;
    }

    public function start()
    {
        $delegacion = Delegacion::findByPk($this->delegacion_id);
        $attributes = $this->oldAttributes;
        $attributes['delegacion'] = $delegacion->nombre;
        unset($attributes['password']);
        app()->getSession()->set('user', $attributes);
    }
}