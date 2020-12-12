<?php
namespace tarifa\models\base;

/**
 * This is the model class for table "tarifa__tarifa_tipo".
 *
 * Columns:
* @property integer $tarifa_id  
* @property string $grupo_id  
   
 *
 * Relations:
 * @property Tarifa $tarifa
 * @property \flota\models\base\Tipo $tipo
 */
class TarifaTipo extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'tarifa__tarifa_tipo';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'tarifa/config/models/tarifa-tipo';

    /**
     *
     * @var string
     */
    protected static $_lang = 'tarifa/lang/models/tarifa-tipo';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['tarifa_id', 'grupo_id'], 'required'],
			[['tarifa_id'], 'number'],
			[['grupo_id'], 'string', 'max' => 3],
			[['grupo_id', 'tarifa_id'], 'unique', 'targetAttribute' => ['grupo_id', 'tarifa_id']],
			[['grupo_id'], 'exist', 'targetClass' => Tipo::className(), 'targetAttribute' => ['grupo_id' => 'id']],
			[['tarifa_id'], 'exist', 'targetClass' => Tarifa::className(), 'targetAttribute' => ['tarifa_id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[Tarifa]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTarifa()
    {
        return $this->hasOne(Tarifa::className(), ['id' => 'tarifa_id']);
    }

    /**
     * Gets query for [[Tarifa]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTipo()
    {
        return $this->hasOne(Tarifa::className(), ['id' => 'tarifa_id']);
    }
}