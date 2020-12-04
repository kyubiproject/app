<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__familia".
 *
 * Columns:
* @property integer $id  
* @property string $nombre  
* @property string $descripcion  
 */
class Familia extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'flota__familia';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id', 'nombre', 'descripcion'], 'required'],
			[['nombre'], 'string', 'max' => 100]        
        ];
    }
}