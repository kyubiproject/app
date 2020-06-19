<?php
/**
 * Table: backend__permission.
 *
 * Attributes:
 * @property integer $profile__id
 * @property string $route
 * @property string $actions
 *
 * Relations:
 * @property Profile profile
 */

class Permission extends ActiveRecord {

    protected $_table = 'backend__permission';
    
    protected $_route = 'backend/permission';
    
    protected $_config = 'backend.config.models.permission';
    
	public static function model($className=__CLASS__) {
		return parent::model($className);
	}
	
	public function primaryKey() {
		return ['profile__id','route'];
	}

	public function persistence() {
		$rules[] = ['profile__id, route', 'required'];
		$rules[] = ['route', 'length', 'max' => 120];
		$rules[] = ['actions', 'length', 'max' => 255];
		$rules[] = ['profile__id', 'length', 'max' => 3];
		$rules[] = ['profile__id', 'numerical', 'min' => 0, 'max' => MAX_SMALLINT];
		$rules[] = ['profile__id', 'exist', 'attributeName' => 'id', 'className' => 'Profile'];
		return $rules;
	}
	
	public function relations() {
		$relations['profile'] = [self::BELONGS_TO, 'Profile', ['profile__id' => 'id']];
		return $relations;
	}
	
	public function import() {
    	return [
			'backend.models.base.Profile'
		];
    }

}