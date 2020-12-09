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
     * @var string
     */
    protected static $_config = 'flota/config/models/grupocarga';

    /**
     *
     * @var string
     */
    protected static $_table = 'flota__grupo_carga';

    /**
     *
     * @var string
     */
    protected static $_lang = 'flota/lang/models/grupocarga';

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
			[['capacidad', 'carga_util'], 'string', 'max' => 10],
			[['largo', 'ancho', 'alto'], 'is', 'type' => 'float', 'size' => '5, 2']        
        ];
    }
}