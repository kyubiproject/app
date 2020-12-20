<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__tarifa_historia".
 *
 * Columns:
* @property integer $tarifa_id  
* @property boolean|null $desde  
* @property integer $hasta  
* @property string $tipo_tarifa  
* @property string $fecha_inicio  
* @property string|null $fecha_fin  
* @property float|null $km  
* @property float|null $eur_km  
* @property float|null $eur_lt  
* @property float|null $hora  
* @property float|null $eur_hora  
* @property float|null $eur_dia  
* @property float|null $eur_mes  
* @property string $tipo_id  
* @property integer|null $delegacion_id  
   
 *
 * Relations:
 * @property \comun\models\base\Delegacion $delegacion
 * @property Tarifa $tarifa
 * @property Tipo $tipo
 */
class TarifaHistoria extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'flota__tarifa_historia';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'flota/config/models/tarifa-historia';

    /**
     *
     * @var string
     */
    protected static $_lang = 'flota/lang/models/tarifa-historia';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['tarifa_id', 'hasta', 'fecha_inicio', 'tipo_id'], 'required'],
			[['tarifa_id', 'desde', 'hasta', 'delegacion_id'], 'integer'],
			[['tipo_tarifa'], 'in', 'range' => ['DAY', 'MONTH', 'HOUR'], 'strict' => true],
			[['fecha_inicio', 'fecha_fin'], 'date', 'type' => 'date', 'format' => 'yyyy-mm-dd'],
			[['tipo_id'], 'string', 'max' => 3],
			[['tarifa_id'], 'exist', 'targetClass' => Tarifa::className(), 'targetAttribute' => ['tarifa_id' => 'id']],
			[['delegacion_id'], 'exist', 'targetClass' => \comun\models\base\Delegacion::className(), 'targetAttribute' => ['delegacion_id' => 'id']],
			[['tipo_id'], 'exist', 'targetClass' => Tipo::className(), 'targetAttribute' => ['tipo_id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[\comun\models\base\Delegacion]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDelegacion()
    {
        return $this->hasOne(\comun\models\base\Delegacion::className(), ['id' => 'delegacion_id']);
    }

    /**
     * Gets query for [[Tarifa]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTarifa()
    {
        return $this->hasOne(Tarifa::className(), ['id' => 'tarifa_id']);
    }

    /**
     * Gets query for [[Tipo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTipo()
    {
        return $this->hasOne(Tipo::className(), ['id' => 'tipo_id']);
    }

	/**
	 * {@inheritdoc}
	 * @return array
	 */
	public function relations(): array
	{
		return [
			'delegacion' => ['type'=>'hasOne','refClass'=>'comun\\models\\base\\Delegacion','refColumn'=>'id','column'=>'delegacion_id'],
			'tarifa' => ['type'=>'hasOne','refClass'=>'flota\\models\\base\\Tarifa','refColumn'=>'id','column'=>'tarifa_id'],
			'tipo' => ['type'=>'hasOne','refClass'=>'flota\\models\\base\\Tipo','refColumn'=>'id','column'=>'tipo_id']
		];
	}
}