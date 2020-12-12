<?php
namespace flota\models\base;

/**
 * This is the model class for table "flota__modelo_carga".
 *
 * Columns:
* @property integer $id  
* @property float|null $largo  
* @property float|null $ancho  
* @property float|null $alto  
* @property string|null $peso  
* @property string|null $volumen  
   
 *
 * Relations:
 * @property Modelo $modelo
 */
class ModeloCarga extends \kyubi\base\ActiveRecord
{
    /**
     *
     * @var string
     */
    protected static $_table = 'flota__modelo_carga';
    
	/**
     *
     * @var string
     */
    protected static $_config = 'modelo-carga';

    /**
     *
     * @var string
     */
    protected static $_lang = 'modelo-carga';

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id'], 'required'],
			[['id'], 'number'],
			[['largo', 'ancho', 'alto'], 'is', 'type' => 'float', 'size' => '5, 2'],
			[['peso', 'volumen'], 'string', 'max' => 10],
			[['id'], 'exist', 'targetClass' => Modelo::className(), 'targetAttribute' => ['id' => 'id']]        
        ];
    }

    /**
     * Gets query for [[Modelo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getModelo()
    {
        return $this->hasOne(Modelo::className(), ['id' => 'id']);
    }
}