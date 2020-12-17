<?php
namespace comun\models\base;

/**
 * This is the model class for table "comun__persona_contacto".
 *
 * Columns:
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
    protected static $_config = 'comun/config/models/persona-contacto';

    /**
     *
     * @var string
     */
    protected static $_lang = 'comun/lang/models/persona-contacto';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['informacion', 'persona_id'], 'required'],
			[['informacion'], 'string', 'max' => 100],
			[['tipo'], 'in', 'range' => ['CORREO', 'TELEFONO', 'MOVIL', 'FAX', 'WEB', 'PERSONA'], 'strict' => true],
			[['clase'], 'in', 'range' => ['PRINCIPAL', 'EMERGENCIA', 'REFERENCIA', 'PERSONAL', 'FAMILIAR', 'OTRO'], 'allowArray' => true],
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