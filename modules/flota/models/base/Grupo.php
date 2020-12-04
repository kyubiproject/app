<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__grupo".
 *
 * Columns:
* @property string $id  
* @property string $nombre  
* @property string|null $caracteristicas  
 */
class Grupo extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'flota__grupo';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id', 'nombre'], 'required'],
			[['id'], 'string', 'max' => 3],
			[['nombre'], 'string', 'max' => 100]        
        ];
    }
}