<?php
/**
 * Table: backend__role.
 *
 * Attributes:
 * @property integer $id
 * @property string $name
 * @property boolean $is_active
 *
 * Relations:
 * @property Profile[] profiles
 * @property User[] users
 */

class Role extends ActiveRecord {

    protected $_table = 'backend__role';
    
    protected $_route = 'backend/role';
    
    protected $_config = 'backend.config.models.role';
    
	public static function model($className=__CLASS__) {
		return parent::model($className);
	}
	
	public function persistence() {
		$rules[] = ['name', 'required'];
		$rules[] = ['is_active', 'boolean'];
		$rules[] = ['is_active', 'default', 'value' => true];
		$rules[] = ['is_active', 'length', 'max' => 1];
		$rules[] = ['name', 'length', 'max' => 60];
		return $rules;
	}
	
	public function relations() {
		$relations['profiles'] = [self::MANY_MANY, 'Profile', 'backend__role_profile(role__id,profile__id)'];
		$relations['users'] = [self::MANY_MANY, 'User', 'backend__user_role(role__id,user__id)'];
		return $relations;
	}
	
	public function import() {
    	return [
			'backend.models.base.Profile',
			'backend.models.base.User'
		];
    }

}