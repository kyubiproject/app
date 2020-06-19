<?php
/**
 * Table: backend__profile.
 *
 * Attributes:
 * @property integer $id
 * @property string $name
 * @property boolean $is_active
 *
 * Relations:
 * @property Permission[] permissions
 * @property Role[] roles
 */

class Profile extends ActiveRecord {

    protected $_table = 'backend__profile';
    
    protected $_route = 'backend/profile';
    
    protected $_config = 'backend.config.models.profile';
    
	public static function model($className=__CLASS__) {
		return parent::model($className);
	}
	
	public function persistence() {
		$rules[] = ['name', 'required'];
		$rules[] = ['is_active', 'boolean'];
		$rules[] = ['is_active', 'default', 'value' => true];
		$rules[] = ['is_active', 'length', 'max' => 1];
		$rules[] = ['name', 'length', 'max' => 100];
		return $rules;
	}
	
	public function relations() {
		$relations['permissions'] = [self::HAS_MANY, 'Permission', ['profile__id' => 'id']];
		$relations['roles'] = [self::MANY_MANY, 'Role', 'backend__role_profile(profile__id,role__id)'];
		return $relations;
	}
	
	public function import() {
    	return [
			'backend.models.base.Permission',
			'backend.models.base.Role'
		];
    }

}