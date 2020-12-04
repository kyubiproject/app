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
 */
class Oficina extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'comun__oficina';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['nombre', 'delegacion__id'], 'required'],
			[['nombre', 'correo'], 'string', 'max' => 100],
			[['gmaps'], 'string', 'max' => 30],
			[['whatsapp', 'telefono'], 'string', 'max' => 20],
			[['delegacion__id'], 'exist', 'targetClass' => Delegacion::className(), 'targetAttribute' => ['delegacion__id' => 'id']]        
        ];
    }
}