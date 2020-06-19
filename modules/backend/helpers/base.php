<?php

/**
 * Permite verificar si el usuario tiene acceso a un módulo, controlador o acción.
 * Los usuarios ROOT tiene acceso a todo, mientras que los ADMIN a todo de las ruta que tenga defindas
 *
 * @param string $action
 * @param string $route
 * @return boolean
 */
function access($action, $route = null)
{
    if (defined('USER_ACCESS')) {
        return USER_ACCESS;
    }
    if (! is_string($route)) {
        $route = controller()->uniqueId;
    }
    if (strpos($route, '/') !== false) {
        list ($module, $controller) = explode('/', $route, 2);
    } else {
        $module = 'application';
        $controller = $route;
    }
    defined('USER_PERMISSIONS') or define('USER_PERMISSIONS', user()->access());
    $access = USER_PERMISSIONS;
    if (isset($access[$module])) {
        if ($controller === "*") {
            return true;
        } elseif (isset($access[$module][$controller])) {
            if (is_null($action)) {
                return true;
            }
            if (is_array($access[$module][$controller])) {
                if (($pos = strpos($action, '.')) !== false) {
                    $action = substr($action, 0, $pos + 1);
                }
                return in_array($action, $access[$module][$controller]);
            }
            return $access[$module][$controller] === "*";
        }
    }
    return false;
}

function backendGetAccess($userId)
{
    return db("CALL backend__get_access(:t0)")->queryAll(true, [
        ':t0' => $userId
    ]);
}

/**
 * Verifica que el usuario sea ROOT
 */
function is_root()
{
    return user()->group === 'ROOT';
}

/**
 * Verifica que el usuario sea ADMIN
 *
 * @return boolean
 */
function is_admin()
{
    return user()->group === 'ADMIN';
}

/**
 * Verifica que el usuario sea ADMIN
 *
 * @return boolean
 */
function is_user()
{
    return user()->group === 'USER';
}
