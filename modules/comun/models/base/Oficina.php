<?php
namespace comun\models\base;

/**
 * This is the model class for table "comun__oficina".
 *
 * Columns:
* @property integer $id  
* @property string $nombre  
* @property string|null $descripcion  
* @property string|null $direccion  
* @property string|null $horario  
* @property string|null $ubicacion  
* @property string|null $correo  
* @property string|null $telefono  
* @property string|null $whatsapp  
* @property integer $delegacion_id  
   
 *
 * Relations:
 * @property Delegacion $delegacion
 */
class Oficina extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'comun__oficina';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'oficina';

    /**
     *
     * @var string
     */
    protected static $_lang = 'oficina';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['nombre', 'delegacion_id'], 'required'],
			[['id', 'delegacion_id'], 'number'],
			[['nombre', 'telefono'], 'string', 'max' => 100],
			[['ubicacion'], 'string', 'max' => 30],
			[['correo', 'whatsapp'], 'string', 'max' => 20],
			[['delegacion_id'], 'exist', 'targetClass' => Delegacion::className(), 'targetAttribute' => ['delegacion_id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[Delegacion]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDelegacion()
    {
        return $this->hasOne(Delegacion::className(), ['id' => 'delegacion_id']);
    }
}