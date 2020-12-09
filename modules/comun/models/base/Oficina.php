<?php
namespace comun\models\base;

/**
 * This is the model class for table "comun__oficina".
 *
 * Columns:
* @property integer $id  
* @property string $nombre  
* @property string|null $direccion  
* @property string|null $horario  
* @property string|null $gmaps  
* @property string|null $whatsapp  
* @property string|null $telefono  
* @property string|null $correo  
* @property integer $delegacion__id  
   
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
    protected static $_config = 'comun/config/models/oficina';

    /**
     *
     * @var string
     */
    protected static $_table = 'comun__oficina';

    /**
     *
     * @var string
     */
    protected static $_lang = 'comun/lang/models/oficina';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['nombre', 'delegacion__id'], 'required'],
			[['id', 'delegacion__id'], 'number'],
			[['nombre', 'correo'], 'string', 'max' => 100],
			[['gmaps'], 'string', 'max' => 30],
			[['whatsapp', 'telefono'], 'string', 'max' => 20],
			[['delegacion__id'], 'exist', 'targetClass' => Delegacion::className(), 'targetAttribute' => ['delegacion__id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[Delegacion]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDelegacion()
    {
        return $this->hasOne(Delegacion::className(), ['id' => 'delegacion__id']);
    }
}