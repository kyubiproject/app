<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__tarifa".
 *
 * Columns:
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
 * @property Tipo $tipo
 * @property \operacion\models\base\OrdenHistoria $ordenHistorias
 * @property TarifaHistoria $historias
 */
class Tarifa extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'flota__tarifa';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'flota/config/models/tarifa';

    /**
     *
     * @var string
     */
    protected static $_lang = 'flota/lang/models/tarifa';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['hasta', 'tipo_tarifa', 'fecha_inicio', 'tipo_id'], 'required'],
			[['desde', 'hasta', 'delegacion_id'], 'integer'],
			[['tipo_tarifa'], 'in', 'range' => ['DIA', 'MES', 'HORA'], 'strict' => true],
			[['fecha_inicio', 'fecha_fin'], 'date', 'type' => 'date', 'format' => 'yyyy-mm-dd'],
			[['tipo_id'], 'string', 'max' => 3],
			[['tipo_id'], 'exist', 'targetClass' => Tipo::className(), 'targetAttribute' => ['tipo_id' => 'id']],
			[['delegacion_id'], 'exist', 'targetClass' => \comun\models\base\Delegacion::className(), 'targetAttribute' => ['delegacion_id' => 'id']]        
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
     * Gets query for [[Tipo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTipo()
    {
        return $this->hasOne(Tipo::className(), ['id' => 'tipo_id']);
    }

    /**
     * Gets query for [[\operacion\models\base\OrdenHistoria]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrdenHistorias()
    {
        return $this->hasMany(\operacion\models\base\OrdenHistoria::className(), ['tarifa_id' => 'id']);
    }

    /**
     * Gets query for [[TarifaHistoria]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getHistorias()
    {
        return $this->hasMany(TarifaHistoria::className(), ['tarifa_id' => 'id']);
    }

	/**
	 * {@inheritdoc}
	 * @return array
	 */
	public function relations(): array
	{
		return [
			'delegacion' => ['type'=>'hasOne','refClass'=>'comun\\models\\base\\Delegacion','refColumn'=>'id','column'=>'delegacion_id'],
			'tipo' => ['type'=>'hasOne','refClass'=>'flota\\models\\base\\Tipo','refColumn'=>'id','column'=>'tipo_id'],
			'ordenHistorias' => ['type'=>'hasMany','refClass'=>'operacion\\models\\base\\OrdenHistoria','refColumn'=>'tarifa_id','column'=>'id'],
			'historias' => ['type'=>'hasMany','refClass'=>'flota\\models\\base\\TarifaHistoria','refColumn'=>'tarifa_id','column'=>'id']
		];
	}
}