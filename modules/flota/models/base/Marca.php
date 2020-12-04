<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__marca".
 *
 * Columns:
* @property integer $id  
* @property string $nombre  
* @property string|null $telefono  
 */
class Marca extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'flota__marca';
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
			[['nombre'], 'string', 'max' => 100],
			[['telefono'], 'string', 'max' => 20]        
        ];
    }
}