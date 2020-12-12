<?php
namespace comun\models\base;

/**
 * This is the model class for table "comun__persona_contacto".
 *
 * Columns:
* @property integer $id  
* @property string $informacion  
* @property string|null $descripcion  
* @property string|null $tipo  
* @property array|null $clase  
* @property integer $persona_id  
   
 *
 * Relations:
 * @property Persona $persona
 */
class PersonaContacto extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'comun__persona_contacto';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'persona-contacto';

    /**
     *
     * @var string
     */
    protected static $_lang = 'persona-contacto';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['informacion', 'persona_id'], 'required'],
			[['id', 'persona_id'], 'number'],
			[['informacion'], 'string', 'max' => 100],
			[['tipo'], 'in', 'range' => ['CORREO', 'TELEFONO', 'MOVIL', 'FAX', 'WEB', 'PERSONA'], 'strict' => true],
			[['clase'], 'in', 'range' => ['PRINCIPAL', 'EMERGENCIA', 'REFERENCIA', 'PERSONAL', 'FAMILIAR', 'OTRO']],
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
}