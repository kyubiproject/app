<?php
namespace comun\models\base;

/**
 * This is the model class for table "comun__delegacion".
 *
 * Columns:
* @property integer $id  
* @property string $nombre  
* @property string|null $whatsapp  
* @property string|null $telefono  
* @property string|null $correo  
 */
class Delegacion extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'comun__delegacion';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['nombre'], 'required'],
			[['nombre', 'correo'], 'string', 'max' => 100],
			[['whatsapp', 'telefono'], 'string', 'max' => 20]        
        ];
    }
}