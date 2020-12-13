<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__modelo_tipo".
 *
 * Columns:
* @property integer $modelo_id  
* @property string $tipo_id  
   
 *
 * Relations:
 * @property Modelo $modelo
 * @property Tipo $tipo
 */
class ModeloTipo extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'flota__modelo_tipo';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'flota/config/models/modelo-tipo';

    /**
     *
     * @var string
     */
    protected static $_lang = 'flota/lang/models/modelo-tipo';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['modelo_id', 'tipo_id'], 'required'],
			[['modelo_id'], 'number'],
			[['tipo_id'], 'string', 'max' => 3],
			[['modelo_id', 'tipo_id'], 'unique', 'targetAttribute' => ['modelo_id', 'tipo_id']],
			[['modelo_id'], 'exist', 'targetClass' => Modelo::className(), 'targetAttribute' => ['modelo_id' => 'id']],
			[['tipo_id'], 'exist', 'targetClass' => Tipo::className(), 'targetAttribute' => ['tipo_id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[Modelo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getModelo()
    {
        return $this->hasOne(Modelo::className(), ['id' => 'modelo_id']);
    }

    /**
     * Gets query for [[Tipo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTipo()
    {
        return $this->hasOne(Tipo::className(), ['id' => 'tipo_id']);
    }
}