<?php
namespace bexe\models;

use kyubi\base\orm\ActiveRecord ;

/**
 * This is the model class for table "bexe__modification".
 *
 * Columns:
* @property integer $id  
* @property string|null $code  
* @property string|null $date  
* @property integer|null $bexe__modification_type__id  
* @property string|null $note  
* @property string|null $status  
* @property string|null $accepted_date  
* @property string|null $confirm_date  
* @property string|null $confirm_note  
* @property string|null $confirm_by  
   
 *
 * Relations:
 * @property \bexe\models\ModificationBalance[] $modificationBalances
 * @property \bexe\models\ModificationType $modificationType
 */
class Modification extends ActiveRecord 
{
    /**
     *
     * {@inheritdoc}
     * @see \yii\base\ActiveRecord:tableName()
     */
    public static function tableName(): string
    {
        return 'bexe__modification';
    }

    /**
     * 
     * {@inheritdoc}
     * @return array
     */
    public function rules(): array
    {
        return [
			[[], 'required'],
			[['id'], 'is', 'type' => "smallint",'unsigned' => true],
			[['bexe__modification_type__id'], 'is', 'type' => "tinyint",'unsigned' => true],
			[['code'], 'string', 'max' => 8],
			[['confirm_by'], 'string', 'max' => 64],
			[['date','confirm_date'], 'type', 'type' => "date",'dateFormat' => "yyyy-mm-dd"],
			[['accepted_date'], 'type', 'type' => "datetime",'datetimeFormat' => "yyyy-mm-dd hh:mm"],
			[['status'], 'range', 'range' => ['OK', 'CANCEL'],'strict' => true],
			[['code'], 'unique'],
			[['bexe__modification_type__id'], 'exist', 'targetClass' => \bexe\models\ModificationType::className(),'targetAttribute' => ['bexe__modification_type__id' => id]]        
        ];
    }

    /**
     * Gets query for [[bexe\models\ModificationBalance]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getModificationBalances()
    {
        return $this->hasMany(\bexe\models\ModificationBalance::className(), ['bexe__modification__id' => 'id']);
    }

    /**
     * Gets query for [[bexe\models\ModificationType]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getModificationType()
    {
        return $this->hasOne(\bexe\models\ModificationType::className(), ['id' => 'bexe__modification_type__id']);
    }
}