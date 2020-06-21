<?php
namespace bcon\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "bcon__sorter".
 *
 * Columns:
* @property integer $id  
* @property integer $code  
* @property integer $bcon__level__id  
* @property integer|null $bcon__sorter__id  
   
 *
 * Relations:
 * @property \bcon\models\Account $account
 * @property \bcon\models\Category $category
 * @property \bcon\models\Level $level
 * @property \bcon\models\Resource $resource
 * @property \bcon\models\Sorter $sorter
 * @property \bcon\models\Sorter[] $sorters
 * @property \bcon\models\Spending $spending
 * @property \bcon\models\Territory $territory
 */
class Sorter extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bcon__sorter';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[['code','bcon__level__id'], 'required'],
			[['id','bcon__sorter__id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['code','bcon__level__id'], 'is', 'type' => "tinyint",'unsigned' => true],
			[{'{\'targetAttribute\':[\'bcon__level__id\',\'bcon__sorter__id\',\'code\']}':'bcon__sorter__id'}, 'unique'],
			[['bcon__level__id'], 'exist', 'targetClass' => \bcon\models\Level::className(),'targetAttribute' => ['bcon__level__id' => id]],
			[['bcon__sorter__id'], 'exist', 'targetClass' => \bcon\models\Sorter::className(),'targetAttribute' => ['bcon__sorter__id' => id]]        
        ];
    }

    /**
     * Gets query for [[bcon\models\Account]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getAccount()
    {
        return $this->hasOne(\bcon\models\Account::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[bcon\models\Category]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCategory()
    {
        return $this->hasOne(\bcon\models\Category::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[bcon\models\Level]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getLevel()
    {
        return $this->hasOne(\bcon\models\Level::className(), ['id' => 'bcon__level__id']);
    }

    /**
     * Gets query for [[bcon\models\Resource]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getResource()
    {
        return $this->hasOne(\bcon\models\Resource::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[bcon\models\Sorter]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSorter()
    {
        return $this->hasOne(\bcon\models\Sorter::className(), ['id' => 'bcon__sorter__id']);
    }

    /**
     * Gets query for [[bcon\models\Sorter]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSorters()
    {
        return $this->hasMany(\bcon\models\Sorter::className(), ['bcon__sorter__id' => 'id']);
    }

    /**
     * Gets query for [[bcon\models\Spending]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSpending()
    {
        return $this->hasOne(\bcon\models\Spending::className(), ['id' => 'id']);
    }

    /**
     * Gets query for [[bcon\models\Territory]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTerritory()
    {
        return $this->hasOne(\bcon\models\Territory::className(), ['id' => 'id']);
    }
}