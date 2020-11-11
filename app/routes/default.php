<?php
// route('GET upload', function () {
// echo '<p>Pretty please only upload jpg, gif, or png files.
// <form action="upload" method="post" enctype="multipart/form-data">
// <input type="file" name="myfile">
// <input type="submit" value="Upload">
// </form>';
// });

// $rules['POST upload'] = function () {
// request()->enableCsrfValidation = false;
// response()->redirect('/upload');
// };
route('GET saludar', function () {
    echo ("saludar");
});
route('GET saludar2', function () {
    echo ("saludar2");
});
routes('grupo', [
    'GET saludo/<tipo:\w+>/<id:\d+>' => function ($tipo, $id) {
        echo ("saludo [$tipo] $id");
    },
    'GET saludo2' => function () {
        die("saludo");
    }
], 'foo');
route('GET normal', 'SiteController');
route('GET metodo/<id:\d+>', 'SiteController.metodo');
route('GET accion/<tipo:\w+>/<id:\d+>', 'SiteController@accion');
route('GET demo/<id:\d+>', 'SiteController:demo');
//return $rules;