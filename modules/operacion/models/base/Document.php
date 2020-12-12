<?php
namespace operacion\models\base;

/**
 * This is the model class for table "operacion__document".
 *
 * Columns:
* @property integer $id  
* @property string $codigo  
* @property string $fecha  
* @property string $tipo  
* @property string|null $estado  
* @property string|null $fecha_estado  
* @property integer|null $document_id  
   
 *
 * Relations:
 * @property Document $
 * @property Document $s
 * @property OrdenDocument $ordenDocuments
 * @property Orden $ordens
 * @property \flota\models\base\VehiculoMovimiento $vehiculoMovimientos
 */
class Document extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'operacion__document';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'operacion/config/models/document';

    /**
     *
     * @var string
     */
    protected static $_lang = 'operacion/lang/models/document';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['codigo', 'tipo'], 'required'],
			[['id', 'document_id'], 'number'],
			[['codigo'], 'string', 'max' => 16],
			[['fecha', 'fecha_estado'], 'date', 'type' => 'datetime', 'format' => 'yyyy-mm-dd hh:mm:ss'],
			[['tipo'], 'in', 'range' => ['PRESUPUESTO', 'RESERVA', 'CONTRATO'], 'strict' => true],
			[['estado'], 'in', 'range' => ['EN VIGOR', 'ANULADO', 'FINALIZADO', 'RENOVADO'], 'strict' => true],
			[['codigo'], 'unique'],
			[['document_id'], 'exist', 'targetClass' => Document::className(), 'targetAttribute' => ['document_id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[Document]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function get()
    {
        return $this->hasOne(Document::className(), ['id' => 'document_id']);
    }

    /**
     * Gets query for [[Document]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getS()
    {
        return $this->hasMany(Document::className(), ['document_id' => 'id']);
    }

    /**
     * Gets query for [[OrdenDocument]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrdenDocuments()
    {
        return $this->hasMany(OrdenDocument::className(), ['document_id' => 'id']);
    }

    /**
     * Gets query for [[Orden]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrdens()
    {
        return $this->hasMany(Orden::className(), ['id' => 'orden_id'])->via('ordenDocuments');
    }

    /**
     * Gets query for [[Orden]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getVehiculoMovimientos()
    {
        return $this->hasMany(Orden::className(), ['id' => 'orden_id'])->via('ordenDocuments');
    }
}