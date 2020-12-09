<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__vehiculo".
 *
 * Columns:
* @property integer $id  
* @property string $matricula  
* @property string|null $bastidor  
* @property string|null $color  
* @property string|null $fecha_matricula  
* @property boolean|null $gps  
* @property integer|null $modelo__id  
* @property integer|null $delegacion__id  
* @property string|null $estado  
* @property string|null $ultimo_estado  
* @property integer|null $anio2  
* @property integer|null $anio  
   
 *
 * Relations:
 * @property \comun\models\base\Delegacion $delegacion
 * @property Modelo $modelo
 * @property \operacion\models\base\OrdenDetalles[] $ordenDetalles
 */
class Vehiculo extends \kyubi\base\ActiveRecord
{
	/**
     *
     * @var string
     */
    protected static $_config = 'flota/config/models/vehiculo';

    /**
     *
     * @var string
     */
    protected static $_table = 'flota__vehiculo';

    /**
     *
     * @var string
     */
    protected static $_lang = 'flota/lang/models/vehiculo';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['matricula'], 'required'],
			[['id', 'modelo__id', 'delegacion__id'], 'number'],
			[['matricula'], 'string', 'max' => 10],
			[['bastidor'], 'string', 'max' => 30],
			[['color'], 'string', 'max' => 20],
			[['fecha_matricula'], 'date', 'type' => 'date', 'format' => 'yyyy-mm-dd'],
			[['ultimo_estado'], 'date', 'type' => 'datetime', 'format' => 'yyyy-mm-dd hh:mm:ss'],
			[['gps'], 'boolean'],
			[['estado'], 'in', 'range' => ['AVAILABLE', 'DAMAGED', 'RESERVED', 'MAINTENANCE'], 'strict' => true],
			[['anio2'], 'is', 'type' => 'year', 'size' => 2],
			[['anio'], 'is', 'type' => 'year'],
			[['bastidor', 'matricula'], 'unique'],
			[['modelo__id'], 'exist', 'targetClass' => Modelo::className(), 'targetAttribute' => ['modelo__id' => 'id']],
			[['delegacion__id'], 'exist', 'targetClass' => \comun\models\base\Delegacion::className(), 'targetAttribute' => ['delegacion__id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[\comun\models\base\Delegacion]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDelegacion()
    {
        return $this->hasOne(\comun\models\base\Delegacion::className(), ['id' => 'delegacion__id']);
    }

    /**
     * Gets query for [[Modelo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getModelo()
    {
        return $this->hasOne(Modelo::className(), ['id' => 'modelo__id']);
    }

    /**
     * Gets query for [[Modelo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrdenDetalles()
    {
        return $this->hasOne(Modelo::className(), ['id' => 'modelo__id']);
    }
}