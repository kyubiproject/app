<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__grupo_carga".
 *
 * Columns:
* @property string $id  
* @property float|null $largo  
* @property float|null $ancho  
* @property float|null $alto  
* @property string|null $capacidad  
* @property string|null $carga_util  
 */
class GrupoCarga extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'flota__grupo_carga';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id'], 'required'],
			[['id'], 'string', 'max' => 3],
			[['capacidad', 'carga_util'], 'string', 'max' => 10]        
        ];
    }
}