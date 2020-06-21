<?php
namespace bcon\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "bcon__spending".
 *
 * Columns:
* @property integer $id  
* @property string $code  
* @property string $name  
* @property string|null $note  
   
 *
 * Relations:
 * @property \bexe\models\Egress[] $egresses
 * @property \bcon\models\Sorter $sorter
 */
class Spending extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bcon__spending';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['id','code','name'], 'required'],
			[['id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['code'], 'string', 'max' => 20],
			[['name'], 'string', 'max' => 500],
			[['code'], 'unique'],
			[['id'], 'exist', 'targetClass' => \bcon\models\Sorter::className(),'targetAttribute' => ['id' => id]]        
        ];
    }

    /**
     * Gets query for [[bexe\models\Egress]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getEgresses()
    {
        return $this->hasMany(\bexe\models\Egress::className(), ['bcon__spending__id' => 'id']);
    }

    /**
     * Gets query for [[bcon\models\Sorter]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSorter()
    {
        return $this->hasOne(\bcon\models\Sorter::className(), ['id' => 'id']);
    }
}