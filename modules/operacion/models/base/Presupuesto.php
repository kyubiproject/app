<?php
namespace operacion\models\base;

/**
 * This is the model class for table "operacion__presupuesto".
 *
 * Columns:
* @property integer $id  
* @property string $codigo  
   
 *
 * Relations:
 * @property Orden $orden
 */
class Presupuesto extends \kyubi\base\ActiveRecord
{
	/**
     *
     * @var string
     */
    protected static $_config = 'operacion/config/models/presupuesto';

    /**
     *
     * @var string
     */
    protected static $_table = 'operacion__presupuesto';

    /**
     *
     * @var string
     */
    protected static $_lang = 'operacion/lang/models/presupuesto';

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

    /**
     * Gets query for [[Orden]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrden()
    {
        return $this->hasOne(Orden::className(), ['id' => 'id']);
    }
}