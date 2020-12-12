<?php
namespace comun\models\base;

/**
 * This is the model class for table "comun__persona".
 *
 * Columns:
* @property integer $id  
* @property string $nombre  
* @property string $dni  
* @property string $pais_dni  
* @property string|null $nacionalidad  
* @property string|null $fecha_nacimiento  
   
 *
 * Relations:
 * @property Cliente $cliente
 * @property Conductor $conductor
 * @property PersonaContacto $personaContactos
 * @property PersonaDireccion $personaDireccions
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
    protected static $_config = 'persona';

    /**
     *
     * @var string
     */
    protected static $_lang = 'persona';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['nombre', 'dni', 'pais_dni'], 'required'],
			[['id'], 'number'],
			[['nombre'], 'string', 'max' => 100],
			[['dni'], 'string', 'max' => 20],
			[['pais_dni', 'nacionalidad'], 'string', 'max' => 45],
			[['fecha_nacimiento'], 'date', 'type' => 'date', 'format' => 'yyyy-mm-dd'],
			[['dni', 'pais_dni'], 'unique', 'targetAttribute' => ['dni', 'pais_dni']]        
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
     * Gets query for [[Conductor]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getConductor()
    {
        return $this->hasOne(Conductor::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[PersonaContacto]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPersonacontactos()
    {
        return $this->hasMany(PersonaContacto::className(), ['persona_id' => 'id']);
    }

    /**
     * Gets query for [[PersonaContacto]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPersonadireccions()
    {
        return $this->hasMany(PersonaContacto::className(), ['persona_id' => 'id']);
    }
}