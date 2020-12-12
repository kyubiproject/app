<?php
namespace tarifa\models\base;

/**
 * This is the model class for table "tarifa__tarifa".
 *
 * Columns:
* @property integer $id  
* @property integer $hasta  
* @property string $tipo_tarifa  
* @property integer $periodo_id  
   
 *
 * Relations:
 * @property Periodo $periodo
 * @property TarifaItem $items
 * @property \operacion\models\base\Orden $ordens
 * @property \flota\models\base\Tipo $tipos
 */
class Tarifa extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'tarifa__tarifa';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'tarifa/config/models/tarifa';

    /**
     *
     * @var string
     */
    protected static $_lang = 'tarifa/lang/models/tarifa';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['hasta', 'tipo_tarifa', 'periodo_id'], 'required'],
			[['id', 'periodo_id'], 'number'],
			[['hasta'], 'is', 'type' => 'tinyint'],
			[['tipo_tarifa'], 'in', 'range' => ['HORA', 'DIA', 'MES'], 'strict' => true],
			[['tipo_tarifa', 'periodo_id', 'hasta'], 'unique', 'targetAttribute' => ['tipo_tarifa', 'periodo_id', 'hasta']],
			[['periodo_id'], 'exist', 'targetClass' => Periodo::className(), 'targetAttribute' => ['periodo_id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[Periodo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPeriodo()
    {
        return $this->hasOne(Periodo::className(), ['id' => 'periodo_id']);
    }

    /**
     * Gets query for [[TarifaItem]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getItems()
    {
        return $this->hasMany(TarifaItem::className(), ['tarifa_id' => 'id']);
    }

    /**
     * Gets query for [[\operacion\models\base\Orden]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrdens()
    {
        return $this->hasMany(\operacion\models\base\Orden::className(), ['tarifa_id' => 'id']);
    }

    /**
     * Gets query for [[\operacion\models\base\Orden]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTipos()
    {
        return $this->hasMany(\operacion\models\base\Orden::className(), ['tarifa_id' => 'id']);
    }
}