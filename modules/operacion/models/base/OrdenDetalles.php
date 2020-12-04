<?php
namespace operacion\models\base;

/**
 * This is the model class for table "operacion__orden_detalles".
 *
 * Columns:
* @property integer $id  
* @property string|null $vehiculo__matricula  
* @property string $fecha_entrega  
* @property string $fecha_recogida  
 */
class OrdenDetalles extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'operacion__orden_detalles';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id', 'fecha_entrega', 'fecha_recogida'], 'required'],
			[['id'], 'string', 'max' => 8],
			[['vehiculo__matricula'], 'string', 'max' => 10],
			[['fecha_entrega', 'fecha_recogida'], 'date', 'type' => 'date', 'format' => 'yyyy-mm-dd'],
			[['id'], 'exist', 'targetClass' => Orden::className(), 'targetAttribute' => ['id' => 'id']],
			[['vehiculo__matricula'], 'exist', 'targetClass' => \flota\models\base\Vehiculo::className(), 'targetAttribute' => ['vehiculo__matricula' => 'matricula']]        
        ];
    }
}