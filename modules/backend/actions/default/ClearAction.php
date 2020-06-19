<?php

class ClearAction extends CAction
{

    public function run()
    {
        if (user()->isGuest) {
            response(403);
        }
        if ($cache = app()->getCache()) {
            $cache->flush();
        }
        if (stripos($_SERVER['HTTP_USER_AGENT'], 'windows') !== false) {
            @exec('rmdir ' . app()->assetManager->basePath . ' /s /q');
            @mkdir(app()->assetManager->basePath, NEW_DIRMODE, true);
            @exec('rmdir ' . app()->runtimePath . ' /s /q');
            @mkdir(app()->runtimePath, NEW_DIRMODE, true);
        } else {
            @exec('rm -rf ' . app()->assetManager->basePath . '/*');
            @exec('rm -rf ' . app()->runtimePath . '/*');
        }
        file_put_contents(app()->runtimePath . '/.gitignore', "*\n!.gitignore");
        file_put_contents(app()->assetManager->basePath . '/.gitignore', "*\n!.gitignore");
        response(204);
    }
}