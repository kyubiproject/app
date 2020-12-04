<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__grupo_medidas".
 *
 * Columns:
* @property string $id  
* @property float|null $largo  
* @property float|null $ancho  
* @property float|null $alto  
 */
class GrupoMedidas extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'flota__grupo_medidas';
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
			[['id'], 'string', 'max' => 3]        
        ];
    }
}