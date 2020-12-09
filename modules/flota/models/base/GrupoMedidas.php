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
     * @var string
     */
    protected static $_config = 'flota/config/models/grupomedidas';

    /**
     *
     * @var string
     */
    protected static $_table = 'flota__grupo_medidas';

    /**
     *
     * @var string
     */
    protected static $_lang = 'flota/lang/models/grupomedidas';

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
			[['largo', 'ancho', 'alto'], 'is', 'type' => 'float', 'size' => '5, 2']        
        ];
    }
}