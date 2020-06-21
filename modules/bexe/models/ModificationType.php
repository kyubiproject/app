<?php
namespace bexe\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "bexe__modification_type".
 *
 * Columns:
* @property integer $id  
* @property string $code  
* @property string $name  
* @property string|null $note  
* @property string|null $type  
   
 *
 * Relations:
 * @property \bexe\models\Modification[] $modifications
 */
class ModificationType extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bexe__modification_type';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['code','name'], 'required'],
			[['id'], 'is', 'type' => "tinyint",'unsigned' => true],
			[['code'], 'string', 'max' => 2],
			[['name'], 'string', 'max' => 128],
			[['type'], 'range', 'range' => ['DIMINUTION', 'INCREASE', 'TRANSFER', 'CREDIT'],'strict' => true]        
        ];
    }

    /**
     * Gets query for [[bexe\models\Modification]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getModifications()
    {
        return $this->hasMany(\bexe\models\Modification::className(), ['bexe__modification_type__id' => 'id']);
    }
}