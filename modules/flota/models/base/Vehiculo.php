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
 */
class Vehiculo extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'flota__vehiculo';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['matricula'], 'required'],
			[['matricula'], 'string', 'max' => 10],
			[['bastidor'], 'string', 'max' => 30],
			[['color'], 'string', 'max' => 20],
			[['fecha_matricula'], 'date', 'type' => 'date', 'format' => 'yyyy-mm-dd'],
			[['ultimo_estado'], 'date', 'type' => 'datetime', 'format' => 'yyyy-mm-dd hh:mm:ss'],
			[['gps'], 'boolean'],
			[['gps'], 'default', 'value' => 0],
			[['bastidor', 'matricula'], 'unique'],
			[['modelo__id'], 'exist', 'targetClass' => Modelo::className(), 'targetAttribute' => ['modelo__id' => 'id']],
			[['delegacion__id'], 'exist', 'targetClass' => \comun\models\base\Delegacion::className(), 'targetAttribute' => ['delegacion__id' => 'id']]        
        ];
    }
}