<?php
namespace comun\models\base;

/**
 * This is the model class for table "comun__cliente".
 *
 * Columns:
* @property integer $id  
* @property string $tipo  
* @property string|null $observacion  
   
 *
 * Relations:
 * @property Persona $persona
 */
class Cliente extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'comun__cliente';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'comun/config/models/cliente';

    /**
     *
     * @var string
     */
    protected static $_lang = 'comun/lang/models/cliente';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id', 'tipo'], 'required'],
			[['id'], 'integer'],
			[['tipo'], 'in', 'range' => ['PERSONA', 'EMPRESA'], 'strict' => true],
			[['id'], 'exist', 'targetClass' => Persona::className(), 'targetAttribute' => ['id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[Persona]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPersona()
    {
        return $this->hasOne(Persona::className(), ['id' => 'id']);
    }

	/**
	 * {@inheritdoc}
	 * @return array
	 */
	public function relations(): array
	{
		return [
			'persona' => ['type'=>'hasOne','refClass'=>'comun\\models\\base\\Persona','refColumn'=>'id','column'=>'id']
		];
	}
}