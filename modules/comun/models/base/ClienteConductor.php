<?php
namespace comun\models\base;

/**
 * This is the model class for table "comun__cliente_conductor".
 *
 * Columns:
* @property integer $cliente_id  
* @property integer $conductor_id  
   
 *
 * Relations:
 * @property Cliente $cliente
 * @property Conductor $conductor
 */
class ClienteConductor extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'comun__cliente_conductor';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'comun/config/models/cliente-conductor';

    /**
     *
     * @var string
     */
    protected static $_lang = 'comun/lang/models/cliente-conductor';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['cliente_id', 'conductor_id'], 'required'],
			[['cliente_id', 'conductor_id'], 'number'],
			[['cliente_id', 'conductor_id'], 'unique', 'targetAttribute' => ['cliente_id', 'conductor_id']],
			[['cliente_id'], 'exist', 'targetClass' => Cliente::className(), 'targetAttribute' => ['cliente_id' => 'id']],
			[['conductor_id'], 'exist', 'targetClass' => Conductor::className(), 'targetAttribute' => ['conductor_id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[Cliente]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCliente()
    {
        return $this->hasOne(Cliente::className(), ['id' => 'cliente_id']);
    }

    /**
     * Gets query for [[Conductor]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getConductor()
    {
        return $this->hasOne(Conductor::className(), ['id' => 'conductor_id']);
    }
}