<?php
namespace operacion\models\base;

/**
 * This is the model class for table "operacion__orden_document".
 *
 * Columns:
* @property integer $orden_id  
* @property integer $document_id  
   
 *
 * Relations:
 * @property Document $document
 * @property Orden $orden
 */
class OrdenDocument extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'operacion__orden_document';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'operacion/config/models/orden-document';

    /**
     *
     * @var string
     */
    protected static $_lang = 'operacion/lang/models/orden-document';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['orden_id', 'document_id'], 'required'],
			[['orden_id', 'document_id'], 'number'],
			[['document_id', 'orden_id'], 'unique', 'targetAttribute' => ['document_id', 'orden_id']],
			[['document_id'], 'exist', 'targetClass' => Document::className(), 'targetAttribute' => ['document_id' => 'id']],
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
        return $this->hasOne(Document::className(), ['id' => 'document_id']);
    }

    /**
     * Gets query for [[Document]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrden()
    {
        return $this->hasOne(Document::className(), ['id' => 'document_id']);
    }
}