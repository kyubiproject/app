<?php
namespace sale\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "sale__fee".
 *
 * Columns:
* @property integer $id  
* @property string $name  
* @property string|null $abbr  
* @property string|null $type  
* @property string|null $note  
* @property boolean $is_active  
   
 *
 * Relations:
 * @property \sale\models\Rate[] $rates
 */
class Fee extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'sale__fee';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['name'], 'required'],
			[['id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['name'], 'string', 'max' => 64],
			[['abbr'], 'string', 'max' => 8],
			[['type'], 'range', 'range' => ['TAX', 'DISCOUNT', 'CHARGE', 'PROMO'],'strict' => true],
			[['is_active'], 'boolean'],
			[['is_active'], 'default', 'value' => 1]        
        ];
    }

    /**
     * Gets query for [[sale\models\Rate]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRates()
    {
        return $this->hasMany(\sale\models\Rate::className(), ['sale__fee__id' => 'id']);
    }
}