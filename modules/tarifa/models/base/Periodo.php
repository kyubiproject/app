<?php
namespace tarifa\models\base;

/**
 * This is the model class for table "tarifa__periodo".
 *
 * Columns:
* @property integer $id  
* @property string $nombre  
* @property string|null $fecha_inicio  
* @property string|null $fecha_fin  
   
 *
 * Relations:
 * @property Tarifa $tarifas
 */
class Periodo extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'tarifa__periodo';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'tarifa/config/models/periodo';

    /**
     *
     * @var string
     */
    protected static $_lang = 'tarifa/lang/models/periodo';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['nombre'], 'required'],
			[['id'], 'number'],
			[['nombre'], 'string', 'max' => 100],
			[['fecha_inicio', 'fecha_fin'], 'date', 'type' => 'date', 'format' => 'yyyy-mm-dd']        
        ];
    }

    /**
     * Gets query for [[Tarifa]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTarifas()
    {
        return $this->hasMany(Tarifa::className(), ['periodo_id' => 'id']);
    }
}