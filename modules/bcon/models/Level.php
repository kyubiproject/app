<?php
namespace bcon\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "bcon__level".
 *
 * Columns:
* @property integer $id  
* @property string $type  
* @property string $name  
* @property integer $level  
* @property string|null $abbr  
* @property integer|null $digits  
* @property string|null $prefix  
   
 *
 * Relations:
 * @property \bcon\models\Sorter[] $sorters
 */
class Level extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bcon__level';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['type','name','level'], 'required'],
			[['id','level','digits'], 'is', 'type' => "tinyint",'unsigned' => true],
			[['type'], 'range', 'range' => ['ACCOUNT', 'CATEGORY', 'RESOURCE', 'SPENDING', 'TERRITORY'],'strict' => true],
			[['name'], 'string', 'max' => 32],
			[['abbr'], 'string', 'max' => 8],
			[['prefix'], 'string', 'max' => 3],
			[{'{\'targetAttribute\':[\'level\',\'type\']}':'prefix'}, 'unique']        
        ];
    }

    /**
     * Gets query for [[bcon\models\Sorter]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSorters()
    {
        return $this->hasMany(\bcon\models\Sorter::className(), ['bcon__level__id' => 'id']);
    }
}