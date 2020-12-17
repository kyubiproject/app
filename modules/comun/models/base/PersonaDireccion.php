<?php
namespace comun\models\base;

/**
 * This is the model class for table "comun__persona_direccion".
 *
 * Columns:
* @property string $direccion  
* @property string|null $problacion  
* @property string|null $codigo_postal  
* @property array|null $clase  
* @property integer $persona_id  
   
 *
 * Relations:
 * @property Persona $persona
 */
class PersonaDireccion extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'comun__persona_direccion';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'comun/config/models/persona-direccion';

    /**
     *
     * @var string
     */
    protected static $_lang = 'comun/lang/models/persona-direccion';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['direccion', 'persona_id'], 'required'],
			[['problacion'], 'string', 'max' => 45],
			[['codigo_postal'], 'string', 'max' => 15],
			[['clase'], 'in', 'range' => ['PRINCIPAL', 'FISCAL', 'OFICINA', 'CASA'], 'allowArray' => true],
			[['persona_id'], 'integer'],
			[['persona_id'], 'exist', 'targetClass' => Persona::className(), 'targetAttribute' => ['persona_id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[Persona]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPersona()
    {
        return $this->hasOne(Persona::className(), ['id' => 'persona_id']);
    }

	/**
	 * {@inheritdoc}
	 * @return array
	 */
	public function relations(): array
	{
		return [
			'persona' => ['type'=>'hasOne','refClass'=>'comun\\models\\base\\Persona','refColumn'=>'id','column'=>'persona_id']
		];
	}
}