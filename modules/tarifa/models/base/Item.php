<?php
namespace tarifa\models\base;

/**
 * This is the model class for table "tarifa__item".
 *
 * Columns:
* @property integer $id  
* @property string $nombre  
* @property string|null $descripcion  
* @property float|null $tarifa  
* @property float|null $cantidad  
* @property string|null $magnitud  
* @property string|null $tipo  
   
 *
 * Relations:
 * @property TarifaItem $tarifaItems
 * @property Tarifa $tarifas
 */
class Item extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'tarifa__item';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'tarifa/config/models/item';

    /**
     *
     * @var string
     */
    protected static $_lang = 'tarifa/lang/models/item';

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
			[['tarifa', 'cantidad'], 'is', 'type' => 'float', 'size' => '7, 2'],
			[['magnitud'], 'in', 'range' => ['HORA', 'DIA', 'MES', 'KM', 'LT'], 'strict' => true],
			[['tipo'], 'in', 'range' => ['UNICO', 'CICLO', 'REFERENCIA'], 'strict' => true],
			[['tarifa', 'magnitud'], 'unique', 'targetAttribute' => ['tarifa', 'magnitud']]        
        ];
    }

    /**
     * Gets query for [[TarifaItem]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTarifaItems()
    {
        return $this->hasMany(TarifaItem::className(), ['item_id' => 'id']);
    }

    /**
     * Gets query for [[TarifaItem]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTarifas()
    {
        return $this->hasMany(TarifaItem::className(), ['item_id' => 'id']);
    }
}