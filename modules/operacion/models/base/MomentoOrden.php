<?php
namespace operacion\models\base;

/**
 * This is the model class for table "operacion__momento_orden".
 *
 * Columns:
* @property integer $id  
* @property integer $orden_id  
   
 *
 * Relations:
 * @property Document $document
 * @property Orden $orden
 */
class MomentoOrden extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'operacion__momento_orden';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'operacion/config/models/momento-orden';

    /**
     *
     * @var string
     */
    protected static $_lang = 'operacion/lang/models/momento-orden';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id', 'orden_id'], 'required'],
			[['id', 'orden_id'], 'number'],
			[['id'], 'exist', 'targetClass' => Document::className(), 'targetAttribute' => ['id' => 'id']],
			[['orden_id'], 'exist', 'targetClass' => Orden::className(), 'targetAttribute' => ['orden_id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[Document]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDocument()
    {
        return $this->hasOne(Document::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[Orden]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrden()
    {
        return $this->hasOne(Orden::className(), ['id' => 'orden_id']);
    }
}