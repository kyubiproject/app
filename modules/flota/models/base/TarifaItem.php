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
 */
class TarifaItem extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'flota__tarifa_item';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id', 'nombre', 'unidad', 'tarifa__id'], 'required'],
			[['nombre'], 'string', 'max' => 100],
			[['facturable'], 'boolean'],
			[['facturable'], 'default', 'value' => 0],
			[['magnitud', 'unidad'], 'unique', 'targetAttribute' => ['magnitud', 'unidad']],
			[['tarifa__id'], 'exist', 'targetClass' => Tarifa::className(), 'targetAttribute' => ['tarifa__id' => 'id']]        
        ];
    }
}