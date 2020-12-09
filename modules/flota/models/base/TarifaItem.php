<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__tarifa_item".
 *
 * Columns:
* @property integer $id  
* @property string $nombre  
* @property float $unidad  
* @property string|null $magnitud  
* @property boolean|null $facturable  
* @property integer $tarifa__id  
   
 *
 * Relations:
 * @property Tarifa $tarifa
 */
class TarifaItem extends \kyubi\base\ActiveRecord
{
	/**
     *
     * @var string
     */
    protected static $_config = 'flota/config/models/tarifaitem';

    /**
     *
     * @var string
     */
    protected static $_table = 'flota__tarifa_item';

    /**
     *
     * @var string
     */
    protected static $_lang = 'flota/lang/models/tarifaitem';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id', 'nombre', 'unidad', 'tarifa__id'], 'required'],
			[['id', 'tarifa__id'], 'number'],
			[['nombre'], 'string', 'max' => 100],
			[['unidad'], 'is', 'type' => 'float', 'size' => '7, 2'],
			[['magnitud'], 'in', 'range' => ['H', 'D', 'M', 'KM', 'LT'], 'strict' => true],
			[['facturable'], 'boolean'],
			[['unidad', 'magnitud'], 'unique', 'targetAttribute' => ['unidad', 'magnitud']],
			[['tarifa__id'], 'exist', 'targetClass' => Tarifa::className(), 'targetAttribute' => ['tarifa__id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[Tarifa]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTarifa()
    {
        return $this->hasOne(Tarifa::className(), ['id' => 'tarifa__id']);
    }
}