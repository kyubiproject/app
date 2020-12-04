<?php
namespace operacion\models\base;

/**
 * This is the model class for table "operacion__orden".
 *
 * Columns:
* @property integer $id  
* @property string $tipo  
* @property string|null $cliente  
* @property string|null $contrato  
* @property string|null $periodo  
* @property string|null $grupo__id  
* @property string|null $estado  
* @property string $fecha_alta  
 */
class Orden extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'operacion__orden';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id', 'tipo'], 'required'],
			[['id'], 'string', 'max' => 8],
			[['cliente'], 'string', 'max' => 100],
			[['grupo__id'], 'string', 'max' => 3],
			[['fecha_alta'], 'date', 'type' => 'datetime', 'format' => 'yyyy-mm-dd hh:mm:ss'],
			[['fecha_alta'], 'default', 'value' => ['expression' => 'CURRENT_TIMESTAMP', 'params' => []]],
			[['grupo__id'], 'exist', 'targetClass' => \flota\models\base\Grupo::className(), 'targetAttribute' => ['grupo__id' => 'id']]        
        ];
    }
}