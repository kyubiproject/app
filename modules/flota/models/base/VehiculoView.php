<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__vehiculo__view".
 *
 * Columns:
* @property integer $id  
* @property string $matricula  
* @property string|null $bastidor  
* @property string|null $color  
* @property string|null $fecha_matricula  
* @property boolean|null $gps  
* @property string|null $modelo  
* @property string|null $delegacion  
* @property string|null $estado  
* @property string|null $ultimo_estado  
* @property integer|null $anio2  
* @property integer|null $anio  
 */
class VehiculoView extends \kyubi\base\ActiveRecord
{
	/**
     *
     * @var string
     */
    protected static $_config = 'flota/config/models/vehiculoview';

    /**
     *
     * @var string
     */
    protected static $_table = 'flota__vehiculo__view';

    /**
     *
     * @var string
     */
    protected static $_lang = 'flota/lang/models/vehiculoview';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['matricula'], 'required'],
			[['id'], 'number'],
			[['matricula'], 'string', 'max' => 10],
			[['bastidor'], 'string', 'max' => 30],
			[['color'], 'string', 'max' => 20],
			[['modelo', 'delegacion'], 'string', 'max' => 100],
			[['fecha_matricula'], 'date', 'type' => 'date', 'format' => 'yyyy-mm-dd'],
			[['ultimo_estado'], 'date', 'type' => 'datetime', 'format' => 'yyyy-mm-dd hh:mm:ss'],
			[['gps'], 'boolean'],
			[['estado'], 'in', 'range' => ['AVAILABLE', 'DAMAGED', 'RESERVED', 'MAINTENANCE'], 'strict' => true],
			[['anio2'], 'is', 'type' => 'year', 'size' => 2],
			[['anio'], 'is', 'type' => 'year']        
        ];
    }
}