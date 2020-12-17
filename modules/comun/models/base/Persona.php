<?php
namespace comun\models\base;

/**
 * This is the model class for table "comun__persona".
 *
 * Columns:
* @property string $nombre  
* @property string $dni  
* @property string $pais_dni  
* @property string|null $nacionalidad  
* @property string|null $fecha_nacimiento  
   
 *
 * Relations:
 * @property Cliente $cliente
 * @property PersonaContacto $contactos
 * @property PersonaDireccion $direccions
 */
class Persona extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'comun__persona';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'comun/config/models/persona';

    /**
     *
     * @var string
     */
    protected static $_lang = 'comun/lang/models/persona';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['nombre', 'dni', 'pais_dni'], 'required'],
			[['nombre'], 'string', 'max' => 100],
			[['dni'], 'string', 'max' => 20],
			[['pais_dni', 'nacionalidad'], 'string', 'max' => 45],
			[['fecha_nacimiento'], 'date', 'type' => 'date', 'format' => 'yyyy-mm-dd'],
			[['pais_dni', 'dni'], 'unique', 'targetAttribute' => ['pais_dni', 'dni']]        
        ];
    }

    /**
     * Gets query for [[Cliente]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCliente()
    {
        return $this->hasOne(Cliente::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[PersonaContacto]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getContactos()
    {
        return $this->hasMany(PersonaContacto::className(), ['persona_id' => 'id']);
    }

    /**
     * Gets query for [[PersonaDireccion]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDireccions()
    {
        return $this->hasMany(PersonaDireccion::className(), ['persona_id' => 'id']);
    }

	/**
	 * {@inheritdoc}
	 * @return array
	 */
	public function relations(): array
	{
		return [
			'cliente' => ['type'=>'hasOne','refClass'=>'comun\\models\\base\\Cliente','refColumn'=>'id','column'=>'id'],
			'contactos' => ['type'=>'hasMany','refClass'=>'comun\\models\\base\\PersonaContacto','refColumn'=>'persona_id','column'=>'id'],
			'direccions' => ['type'=>'hasMany','refClass'=>'comun\\models\\base\\PersonaDireccion','refColumn'=>'persona_id','column'=>'id']
		];
	}
}