<?php
namespace operacion\models\base;

/**
 * This is the model class for table "operacion__orden_tarifa".
 *
 * Columns:
* @property integer|null $orden_id  
* @property integer|null $tarifa_id  
* @property integer|null $periodo  
* @property integer|null $fraccion  
* @property string|null $fecha_inicio  
* @property string|null $fecha_fin  
* @property string|null $fecha_entrega  
* @property string|null $fecha_recogida  
 */
class OrdenTarifa extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'operacion__orden_tarifa';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'operacion/config/models/orden-tarifa';

    /**
     *
     * @var string
     */
    protected static $_lang = 'operacion/lang/models/orden-tarifa';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[[], 'required'],
			[['orden_id', 'tarifa_id', 'periodo', 'fraccion'], 'integer'],
			[['fecha_inicio', 'fecha_fin', 'fecha_entrega', 'fecha_recogida'], 'date', 'type' => 'date', 'format' => 'yyyy-mm-dd']        
        ];
    }

	/**
	 * {@inheritdoc}
	 * @return array
	 */
	public function relations(): array
	{
		return [
];
	}
}