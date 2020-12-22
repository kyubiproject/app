<?php
namespace app\models\base;

/**
 * This is the model class for table "user".
 *
 * Columns:
* @property string $username  
* @property string $password  
* @property string|null $auth_key  
* @property string|null $access_token  
* @property integer $delegacion_id  
   
 *
 * Relations:
 * @property \comun\models\base\Delegacion $delegacion
 */
class User extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'user';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'app/config/models/user';

    /**
     *
     * @var string
     */
    protected static $_lang = 'app/lang/models/user';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['username', 'password', 'delegacion_id'], 'required'],
			[['username'], 'string', 'max' => 30],
			[['password', 'auth_key', 'access_token'], 'string', 'max' => 60],
			[['delegacion_id'], 'integer'],
			[['delegacion_id'], 'exist', 'targetClass' => \comun\models\base\Delegacion::className(), 'targetAttribute' => ['delegacion_id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[\comun\models\base\Delegacion]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDelegacion()
    {
        return $this->hasOne(\comun\models\base\Delegacion::className(), ['id' => 'delegacion_id']);
    }

	/**
	 * {@inheritdoc}
	 * @return array
	 */
	public function relations(): array
	{
		return [
			'delegacion' => ['type'=>'hasOne','refClass'=>'comun\\models\\base\\Delegacion','refColumn'=>'id','column'=>'delegacion_id']
		];
	}
}