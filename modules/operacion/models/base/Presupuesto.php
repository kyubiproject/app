<?php
namespace operacion\models\base;

/**
 * This is the model class for table "operacion__presupuesto".
 *
 * Columns:
* @property integer $id  
* @property string $codigo  
 */
class Presupuesto extends \kyubi\base\ActiveRecord
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'operacion__presupuesto';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id', 'codigo'], 'required'],
			[['id'], 'string', 'max' => 8],
			[['codigo'], 'string', 'max' => 20],
			[['id'], 'exist', 'targetClass' => Orden::className(), 'targetAttribute' => ['id' => 'id']]        
        ];
    }
}