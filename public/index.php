<?php
define('DIR_ROOT', dirname(__DIR__));

require_once DIR_ROOT . '/vendor/autoload.php';

Kyubi::app(get('__debug', true), get('__env', 'dev'));
?>
<!--
<select name="Provincia" id="car-pro" class="user-success">
<option value="nada">Selecciona Provincia</option>
<option value="08">Almería</option>
<option value="44">Asturias</option>
<option value="14">Barcelona</option>
<option value="31">Bilbao</option>
<option value="25">Burgos</option>
<option value="28">Córdoba</option>
<option value="20">Granada</option>
<option value="02">Madrid</option>
<option value="21">Málaga</option>
<option value="47">Murcia</option>
<option value="29">Sevilla</option>
<option value="30">San Sebastian</option>
<option value="42">Cantabria</option>
<option value="45">Pontevedra</option>
</select>
<div class="gallery gallery-isotope" id="gallery" style="position: relative; height: 4000px;">
<div class="gallery__item 1" style="min-height: 500px !important; position: absolute; left: 0px; top: 0px;">
<figure class="gallery__item__image">
<a class="hover" href="detalle-vehiculo/grupo-A">
<img src="assets/images/flota/A/lateral_rotulado.png" style="width: 80%" alt="Furgoline - Derivado de Turismo">
<i class="icon-arrow-down-sign-to-navigate2"></i>
</a>
</figure>
<div class="gallery__item__content">
<h6>Derivado de Turismo</h6>
<ul class="tt-list-descriptions">
<li>
<i class="tt-icon icon-car-door"></i>
Puertas: <span>3</span>
</li>
<li>
<i class="tt-icon icon-group"></i>
Plazas: <span>2</span>
</li>
<li>
<i class="tt-icon icon-manual_g"></i>
Cambio: <span>Manual</span>
</li>
<li>
<i class="tt-icon icon-snowflake"></i>
Aire acondicionado: <span>Si</span>
</li>
</ul>
<span class="cost"><span><strong>Desde</strong></span><span><strong>21 €</strong> / Dia</span></span>
<u><a href="detalle-vehiculo/grupo-A" class="link-gallery">Más Información</a></u>
<a class="btn" href="detalle-vehiculo/grupo-A#form">Ver precios</a>
</div>
</div>
<div class="gallery__item 1" style="min-height: 500px !important; position: absolute; left: 390px; top: 0px;">
<figure class="gallery__item__image">
<a class="hover" href="detalle-vehiculo/grupo-A-C">
<img src="assets/images/flota/A-C/lateral_rotulado.png" style="width: 80%" alt="Furgoline - Derivado de Turismo Combi">
<i class="icon-arrow-down-sign-to-navigate2"></i>
</a>
</figure>
<div class="gallery__item__content">
<h6>Derivado de Turismo Combi</h6>
<ul class="tt-list-descriptions">
<li>
<i class="tt-icon icon-car-door"></i>
Puertas: <span>5</span>
</li>
<li>
<i class="tt-icon icon-group"></i>
Plazas: <span>5</span>
</li>
<li>
<i class="tt-icon icon-manual_g"></i>
Cambio: <span>Manual</span>
</li>
<li>
<i class="tt-icon icon-snowflake"></i>
Aire acondicionado: <span>Si</span>
</li>
</ul>
<span class="cost"><span><strong>Desde</strong></span><span><strong>21 €</strong> / Dia</span></span>
<u><a href="detalle-vehiculo/grupo-A-C" class="link-gallery">Más Información</a></u>
<a class="btn" href="detalle-vehiculo/grupo-A-C#form">Ver precios</a>
</div>
</div>
<div class="gallery__item 1" style="min-height: 500px !important; position: absolute; left: 780px; top: 0px;">
<figure class="gallery__item__image">
<a class="hover" href="detalle-vehiculo/grupo-A+">
<img src="assets/images/flota/A+/lateral_rotulado.png" style="width: 80%" alt="Furgoline - Derivado de Turismo Plus">
<i class="icon-arrow-down-sign-to-navigate2"></i>
</a>
</figure>
<div class="gallery__item__content">
<h6>Derivado de Turismo Plus</h6>
<ul class="tt-list-descriptions">
<li>
<i class="tt-icon icon-car-door"></i>
Puertas: <span>4</span>
</li>
<li>
<i class="tt-icon icon-group"></i>
Plazas: <span>2</span>
</li>
<li>
<i class="tt-icon icon-manual_g"></i>
Cambio: <span>Manual</span>
</li>
<li>
<i class="tt-icon icon-snowflake"></i>
Aire acondicionado: <span>Si</span>
</li>
</ul>
<span class="cost"><span><strong>Desde</strong></span><span><strong>26 €</strong> / Dia</span></span>
<u><a href="detalle-vehiculo/grupo-A+" class="link-gallery">Más Información</a></u>
<a class="btn" href="detalle-vehiculo/grupo-A+#form">Ver precios</a>
</div>
</div>
<div class="gallery__item 1" style="min-height: 500px !important; position: absolute; left: 0px; top: 500px;">
<figure class="gallery__item__image">
<a class="hover" href="detalle-vehiculo/grupo-B">
<img src="assets/images/flota/B/lateral_rotulado.png" style="width: 80%" alt="Furgoline - Furgoneta Pequeña">
<i class="icon-arrow-down-sign-to-navigate2"></i>
</a>
</figure>
<div class="gallery__item__content">
<h6>Furgoneta Pequeña</h6>
<ul class="tt-list-descriptions">
<li>
<i class="tt-icon icon-car-door"></i>
Puertas: <span>4</span>
</li>
<li>
<i class="tt-icon icon-group"></i>
Plazas: <span>3</span>
</li>
<li>
<i class="tt-icon icon-manual_g"></i>
Cambio: <span>Manual</span>
</li>
<li>
<i class="tt-icon icon-snowflake"></i>
Aire acondicionado: <span>Si</span>
</li>
</ul>
<span class="cost"><span><strong>Desde</strong></span><span><strong>33 €</strong> / Dia</span></span>
<u><a href="detalle-vehiculo/grupo-B" class="link-gallery">Más Información</a></u>
<a class="btn" href="detalle-vehiculo/grupo-B#form">Ver precios</a>
</div>
</div>
<div class="gallery__item 1" style="min-height: 500px !important; position: absolute; left: 390px; top: 500px;">
<figure class="gallery__item__image">
<a class="hover" href="detalle-vehiculo/grupo-C">
<img src="assets/images/flota/C/lateral_rotulado.png" style="width: 80%" alt="Furgoline - Furgoneta Mediana">
<i class="icon-arrow-down-sign-to-navigate2"></i>
</a>
</figure>
<div class="gallery__item__content">
<h6>Furgoneta Mediana</h6>
<ul class="tt-list-descriptions">
<li>
<i class="tt-icon icon-car-door"></i>
Puertas: <span>4</span>
</li>
<li>
<i class="tt-icon icon-group"></i>
Plazas: <span>3</span>
</li>
<li>
<i class="tt-icon icon-manual_g"></i>
Cambio: <span>Manual</span>
</li>
<li>
<i class="tt-icon icon-snowflake"></i>
Aire acondicionado: <span>Si</span>
</li>
</ul>
<span class="cost"><span><strong>Desde</strong></span><span><strong>36 €</strong> / Dia</span></span>
<u><a href="detalle-vehiculo/grupo-C" class="link-gallery">Más Información</a></u>
<a class="btn" href="detalle-vehiculo/grupo-C#form">Ver precios</a>
</div>
</div>
<div class="gallery__item 1" style="min-height: 500px !important; position: absolute; left: 780px; top: 500px;">
<figure class="gallery__item__image">
<a class="hover" href="detalle-vehiculo/grupo-D">
<img src="assets/images/flota/D/lateral_rotulado.png" style="width: 80%" alt="Furgoline - Furgoneta Grande">
<i class="icon-arrow-down-sign-to-navigate2"></i>
</a>
</figure>
<div class="gallery__item__content">
<h6>Furgoneta Grande</h6>
<ul class="tt-list-descriptions">
<li>
<i class="tt-icon icon-car-door"></i>
Puertas: <span>4</span>
</li>
<li>
<i class="tt-icon icon-group"></i>
Plazas: <span>3</span>
</li>
<li>
<i class="tt-icon icon-manual_g"></i>
Cambio: <span>Manual</span>
</li>
<li>
<i class="tt-icon icon-snowflake"></i>
Aire acondicionado: <span>Si</span>
</li>
</ul>
<span class="cost"><span><strong>Desde</strong></span><span><strong>39 €</strong> / Dia</span></span>
<u><a href="detalle-vehiculo/grupo-D" class="link-gallery">Más Información</a></u>
<a class="btn" href="detalle-vehiculo/grupo-D#form">Ver precios</a>
</div>
</div>
<div class="gallery__item 1" style="min-height: 500px !important; position: absolute; left: 0px; top: 1000px;">
<figure class="gallery__item__image">
<a class="hover" href="detalle-vehiculo/grupo-E">
<img src="assets/images/flota/E/lateral_rotulado.png" style="width: 80%" alt="Furgoline - Furgoneta Extra Grande">
<i class="icon-arrow-down-sign-to-navigate2"></i>
</a>
</figure>
<div class="gallery__item__content">
<h6>Furgoneta Extra Grande</h6>
<ul class="tt-list-descriptions">
<li>
<i class="tt-icon icon-car-door"></i>
Puertas: <span>4</span>
</li>
<li>
<i class="tt-icon icon-group"></i>
Plazas: <span>3</span>
</li>
<li>
<i class="tt-icon icon-manual_g"></i>
Cambio: <span>Manual</span>
</li>
<li>
<i class="tt-icon icon-snowflake"></i>
Aire acondicionado: <span>Si</span>
</li>
</ul>
<span class="cost"><span><strong>Desde</strong></span><span><strong>43 €</strong> / Dia</span></span>
<u><a href="detalle-vehiculo/grupo-E" class="link-gallery">Más Información</a></u>
<a class="btn" href="detalle-vehiculo/grupo-E#form">Ver precios</a>
</div>
</div>
<div class="gallery__item 1" style="min-height: 500px !important; position: absolute; left: 390px; top: 1000px;">
<figure class="gallery__item__image">
<a class="hover" href="detalle-vehiculo/grupo-E+">
<img src="assets/images/flota/E/lateral_rotulado.png" style="width: 80%" alt="Furgoline - Furgoneta Extra Grande Plus">
<i class="icon-arrow-down-sign-to-navigate2"></i>
</a>
</figure>
<div class="gallery__item__content">
<h6>Furgoneta Extra Grande Plus</h6>
<ul class="tt-list-descriptions">
<li>
<i class="tt-icon icon-car-door"></i>
Puertas: <span>4</span>
</li>
<li>
<i class="tt-icon icon-group"></i>
Plazas: <span>3</span>
</li>
<li>
<i class="tt-icon icon-manual_g"></i>
Cambio: <span>Manual</span>
</li>
<li>
<i class="tt-icon icon-snowflake"></i>
Aire acondicionado: <span>Si</span>
</li>
</ul>
<span class="cost"><span><strong>Desde</strong></span><span><strong>47 €</strong> / Dia</span></span>
<u><a href="detalle-vehiculo/grupo-E+" class="link-gallery">Más Información</a></u>
<a class="btn" href="detalle-vehiculo/grupo-E+#form">Ver precios</a>
</div>
</div>
<div class="gallery__item 1" style="min-height: 500px !important; position: absolute; left: 780px; top: 1000px;">
<figure class="gallery__item__image">
<a class="hover" href="detalle-vehiculo/grupo-F">
<img src="assets/images/flota/F/lateral_rotulado.png" style="width: 80%" alt="Furgoline - Carrozado Sin Plataforma (16m³)">
<i class="icon-arrow-down-sign-to-navigate2"></i>
</a>
</figure>
<div class="gallery__item__content">
<h6>Carrozado Sin Plataforma (16m³)</h6>
<ul class="tt-list-descriptions">
<li>
<i class="tt-icon icon-car-door"></i>
Puertas: <span>4</span>
</li>
<li>
<i class="tt-icon icon-group"></i>
Plazas: <span>3</span>
</li>
<li>
<i class="tt-icon icon-manual_g"></i>
Cambio: <span>Manual</span>
</li>
<li>
<i class="tt-icon icon-snowflake"></i>
Aire acondicionado: <span>Si</span>
</li>
</ul>
<span class="cost"><span><strong>Desde</strong></span><span><strong>50 €</strong> / Dia</span></span>
<u><a href="detalle-vehiculo/grupo-F" class="link-gallery">Más Información</a></u>
<a class="btn" href="detalle-vehiculo/grupo-F#form">Ver precios</a>
</div>
</div>
<div class="gallery__item 1" style="min-height: 500px !important; position: absolute; left: 0px; top: 1500px;">
<figure class="gallery__item__image">
<a class="hover" href="detalle-vehiculo/grupo-G">
<img src="assets/images/flota/F/lateral_rotulado.png" style="width: 80%" alt="Furgoline - Carrozado Con Plataforma (16m³)">
<i class="icon-arrow-down-sign-to-navigate2"></i>
</a>
</figure>
<div class="gallery__item__content">
<h6>Carrozado Con Plataforma (16m³)</h6>
<ul class="tt-list-descriptions">
<li>
<i class="tt-icon icon-car-door"></i>
Puertas: <span>4</span>
</li>
<li>
<i class="tt-icon icon-group"></i>
Plazas: <span>3</span>
</li>
<li>
<i class="tt-icon icon-manual_g"></i>
Cambio: <span>Manual</span>
</li>
<li>
<i class="tt-icon icon-snowflake"></i>
Aire acondicionado: <span>Si</span>
</li>
</ul>
<span class="cost"><span><strong>Desde</strong></span><span><strong>57 €</strong> / Dia</span></span>
<u><a href="detalle-vehiculo/grupo-G" class="link-gallery">Más Información</a></u>
<a class="btn" href="detalle-vehiculo/grupo-G#form">Ver precios</a>
</div>
</div>
<div class="gallery__item 1" style="min-height: 500px !important; position: absolute; left: 390px; top: 1500px;">
<figure class="gallery__item__image">
<a class="hover" href="detalle-vehiculo/grupo-F+">
<img src="assets/images/flota/F/lateral_rotulado.png" style="width: 80%" alt="Furgoline - Carrozado Sin Plataforma (20m³)">
<i class="icon-arrow-down-sign-to-navigate2"></i>
</a>
</figure>
<div class="gallery__item__content">
<h6>Carrozado Sin Plataforma (20m³)</h6>
<ul class="tt-list-descriptions">
<li>
<i class="tt-icon icon-car-door"></i>
Puertas: <span>4</span>
</li>
<li>
<i class="tt-icon icon-group"></i>
Plazas: <span>3</span>
</li>
<li>
<i class="tt-icon icon-manual_g"></i>
Cambio: <span>Manual</span>
</li>
<li>
<i class="tt-icon icon-snowflake"></i>
Aire acondicionado: <span>Si</span>
</li>
</ul>
<span class="cost"><span><strong>Desde</strong></span><span><strong>60 €</strong> / Dia</span></span>
<u><a href="detalle-vehiculo/grupo-F+" class="link-gallery">Más Información</a></u>
<a class="btn" href="detalle-vehiculo/grupo-F+#form">Ver precios</a>
</div>
</div>
<div class="gallery__item 1" style="min-height: 500px !important; position: absolute; left: 780px; top: 1500px;">
<figure class="gallery__item__image">
<a class="hover" href="detalle-vehiculo/grupo-G+">
<img src="assets/images/flota/G+/lateral_rotulado.png" style="width: 80%" alt="Furgoline - Carrozado Con Plataforma (20m³)">
<i class="icon-arrow-down-sign-to-navigate2"></i>
</a>
</figure>
<div class="gallery__item__content">
<h6>Carrozado Con Plataforma (20m³)</h6>
<ul class="tt-list-descriptions">
<li>
<i class="tt-icon icon-car-door"></i>
Puertas: <span>4</span>
</li>
<li>
<i class="tt-icon icon-group"></i>
Plazas: <span>3</span>
</li>
<li>
<i class="tt-icon icon-manual_g"></i>
Cambio: <span>Manual</span>
</li>
<li>
<i class="tt-icon icon-snowflake"></i>
Aire acondicionado: <span>Si</span>
</li>
</ul>
<span class="cost"><span><strong>Desde</strong></span><span><strong>67 €</strong> / Dia</span></span>
<u><a href="detalle-vehiculo/grupo-G+" class="link-gallery">Más Información</a></u>
<a class="btn" href="detalle-vehiculo/grupo-G+#form">Ver precios</a>
</div>
</div>
<div class="gallery__item 1" style="min-height: 500px !important; position: absolute; left: 0px; top: 2000px;">
<figure class="gallery__item__image">
<a class="hover" href="detalle-vehiculo/grupo-H">
<img src="assets/images/flota/H/lateral_rotulado.png" style="width: 80%" alt="Furgoline - Furgoneta Mixta 6 Plazas">
<i class="icon-arrow-down-sign-to-navigate2"></i>
</a>
</figure>
<div class="gallery__item__content">
<h6>Furgoneta Mixta 6 Plazas</h6>
<ul class="tt-list-descriptions">
<li>
<i class="tt-icon icon-car-door"></i>
Puertas: <span>4</span>
</li>
<li>
<i class="tt-icon icon-group"></i>
Plazas: <span>6</span>
</li>
<li>
<i class="tt-icon icon-manual_g"></i>
Cambio: <span>Manual</span>
</li>
<li>
<i class="tt-icon icon-snowflake"></i>
Aire acondicionado: <span>Si</span>
</li>
</ul>
<span class="cost"><span><strong>Desde</strong></span><span><strong>36 €</strong> / Dia</span></span>
<u><a href="detalle-vehiculo/grupo-H" class="link-gallery">Más Información</a></u>
<a class="btn" href="detalle-vehiculo/grupo-H#form">Ver precios</a>
</div>
</div>
<div class="gallery__item 1" style="min-height: 500px !important; position: absolute; left: 390px; top: 2000px;">
<figure class="gallery__item__image">
<a class="hover" href="detalle-vehiculo/grupo-H+">
<img src="assets/images/flota/H+/lateral_rotulado.png" style="width: 80%" alt="Furgoline - Furgoneta Mixta 6 Plazas Plus">
<i class="icon-arrow-down-sign-to-navigate2"></i>
</a>
</figure>
<div class="gallery__item__content">
<h6>Furgoneta Mixta 6 Plazas Plus</h6>
<ul class="tt-list-descriptions">
<li>
<i class="tt-icon icon-car-door"></i>
Puertas: <span>4</span>
</li>
<li>
<i class="tt-icon icon-group"></i>
Plazas: <span>6</span>
</li>
<li>
<i class="tt-icon icon-manual_g"></i>
Cambio: <span>Manual</span>
</li>
<li>
<i class="tt-icon icon-snowflake"></i>
Aire acondicionado: <span>Si</span>
</li>
</ul>
<span class="cost"><span><strong>Desde</strong></span><span><strong>41 €</strong> / Dia</span></span>
<u><a href="detalle-vehiculo/grupo-H+" class="link-gallery">Más Información</a></u>
<a class="btn" href="detalle-vehiculo/grupo-H+#form">Ver precios</a>
</div>
</div>
<div class="gallery__item 3" style="min-height: 500px !important; position: absolute; left: 780px; top: 2000px;">
<figure class="gallery__item__image">
<a class="hover" href="detalle-vehiculo/grupo-S">
<img src="assets/images/flota/H+1/lateral_rotulado.png" style="width: 80%" alt="Furgoline - Monovolumen 7 plazas">
<i class="icon-arrow-down-sign-to-navigate2"></i>
</a>
</figure>
<div class="gallery__item__content">
<h6>Monovolumen 7 plazas</h6>
<ul class="tt-list-descriptions">
<li>
<i class="tt-icon icon-car-door"></i>
Puertas: <span>5</span>
</li>
<li>
<i class="tt-icon icon-group"></i>
Plazas: <span>7</span>
</li>
<li>
<i class="tt-icon icon-manual_g"></i>
Cambio: <span>Manual</span>
</li>
<li>
<i class="tt-icon icon-snowflake"></i>
Aire acondicionado: <span>Si</span>
</li>
</ul>
<span class="cost"><span><strong>Desde</strong></span><span><strong>41 €</strong> / Dia</span></span>
<u><a href="detalle-vehiculo/grupo-S" class="link-gallery">Más Información</a></u>
<a class="btn" href="detalle-vehiculo/grupo-S#form">Ver precios</a>
</div>
</div>
<div class="gallery__item 1" style="min-height: 500px !important; position: absolute; left: 0px; top: 2500px;">
<figure class="gallery__item__image">
<a class="hover" href="detalle-vehiculo/grupo-I">
<img src="assets/images/flota/I/lateral_rotulado.png" style="width: 80%" alt="Furgoline - Furgoneta 9 Plazas">
<i class="icon-arrow-down-sign-to-navigate2"></i>
</a>
</figure>
<div class="gallery__item__content">
<h6>Furgoneta 9 Plazas</h6>
<ul class="tt-list-descriptions">
<li>
<i class="tt-icon icon-car-door"></i>
Puertas: <span>5</span>
</li>
<li>
<i class="tt-icon icon-group"></i>
Plazas: <span>9</span>
</li>
<li>
<i class="tt-icon icon-manual_g"></i>
Cambio: <span>Manual</span>
</li>
<li>
<i class="tt-icon icon-snowflake"></i>
Aire acondicionado: <span>Si</span>
</li>
</ul>
<span class="cost"><span><strong>Desde</strong></span><span><strong>58 €</strong> / Dia</span></span>
<u><a href="detalle-vehiculo/grupo-I" class="link-gallery">Más Información</a></u>
<a class="btn" href="detalle-vehiculo/grupo-I#form">Ver precios</a>
</div>
</div>
<div class="gallery__item 3" style="min-height: 500px !important; position: absolute; left: 390px; top: 2500px;">
<figure class="gallery__item__image">
<a class="hover" href="detalle-vehiculo/grupo-J">
<img src="assets/images/flota/J/lateral_rotulado.png" style="width: 80%" alt="Furgoline - Monovolumen 9 Plazas VIP">
<i class="icon-arrow-down-sign-to-navigate2"></i>
</a>
</figure>
<div class="gallery__item__content">
<h6>Monovolumen 9 Plazas VIP</h6>
<ul class="tt-list-descriptions">
<li>
<i class="tt-icon icon-car-door"></i>
Puertas: <span>4</span>
</li>
<li>
<i class="tt-icon icon-group"></i>
Plazas: <span>9</span>
</li>
<li>
<i class="tt-icon icon-manual_g"></i>
Cambio: <span>Manual</span>
</li>
<li>
<i class="tt-icon icon-snowflake"></i>
Aire acondicionado: <span>Si</span>
</li>
</ul>
<span class="cost"><span><strong>Desde</strong></span><span><strong>67 €</strong> / Dia</span></span>
<u><a href="detalle-vehiculo/grupo-J" class="link-gallery">Más Información</a></u>
<a class="btn" href="detalle-vehiculo/grupo-J#form">Ver precios</a>
</div>
</div>
<div class="gallery__item 3" style="min-height: 500px !important; position: absolute; left: 780px; top: 2500px;">
<figure class="gallery__item__image">
<a class="hover" href="detalle-vehiculo/grupo-O">
<img src="assets/images/flota/O/lateral_rotulado.png" style="width: 80%" alt="Furgoline - Monovolumen 9 plazas VIP EXECUTIVE">
<i class="icon-arrow-down-sign-to-navigate2"></i>
</a>
</figure>
<div class="gallery__item__content">
<h6>Monovolumen 9 plazas VIP EXECUTIVE</h6>
<ul class="tt-list-descriptions">
<li>
<i class="tt-icon icon-car-door"></i>
Puertas: <span>5</span>
</li>
<li>
<i class="tt-icon icon-group"></i>
Plazas: <span>9</span>
</li>
<li>
<i class="tt-icon icon-manual_g"></i>
Cambio: <span>Manual</span>
</li>
<li>
<i class="tt-icon icon-snowflake"></i>
Aire acondicionado: <span>Si</span>
</li>
</ul>
<span class="cost"><span><strong>Desde</strong></span><span><strong>70 €</strong> / Dia</span></span>
<u><a href="detalle-vehiculo/grupo-O" class="link-gallery">Más Información</a></u>
<a class="btn" href="detalle-vehiculo/grupo-O#form">Ver precios</a>
</div>
</div>
<div class="gallery__item 4" style="min-height: 500px !important; position: absolute; left: 0px; top: 3000px;">
<figure class="gallery__item__image">
<a class="hover" href="detalle-vehiculo/grupo-N">
<img src="assets/images/flota/N/lateral_rotulado.png" style="width: 80%" alt="Furgoline - Furgoneta Isotermada- Frio Mediana">
<i class="icon-arrow-down-sign-to-navigate2"></i>
</a>
</figure>
<div class="gallery__item__content">
<h6>Furgoneta Isotermada- Frio Mediana</h6>
<ul class="tt-list-descriptions">
<li>
<i class="tt-icon icon-car-door"></i>
Puertas: <span>3</span>
</li>
<li>
<i class="tt-icon icon-group"></i>
Plazas: <span>3</span>
</li>
<li>
<i class="tt-icon icon-manual_g"></i>
Cambio: <span>Manual</span>
</li>
<li>
<i class="tt-icon icon-snowflake"></i>
Aire acondicionado: <span>Si</span>
</li>
</ul>
<span class="cost"><span><strong>Desde</strong></span><span><strong>65 €</strong> / Dia</span></span>
<u><a href="detalle-vehiculo/grupo-N" class="link-gallery">Más Información</a></u>
<a class="btn" href="detalle-vehiculo/grupo-N#form">Ver precios</a>
</div>
</div>
<div class="gallery__item 4" style="min-height: 500px !important; position: absolute; left: 390px; top: 3000px;">
<figure class="gallery__item__image">
<a class="hover" href="detalle-vehiculo/grupo-P">
<img src="assets/images/flota/F/lateral_rotulado.png" style="width: 80%" alt="Furgoline - Carrozado Frigorífico">
<i class="icon-arrow-down-sign-to-navigate2"></i>
</a>
</figure>
<div class="gallery__item__content">
<h6>Carrozado Frigorífico</h6>
<ul class="tt-list-descriptions">
<li>
<i class="tt-icon icon-car-door"></i>
Puertas: <span>3</span>
</li>
<li>
<i class="tt-icon icon-group"></i>
Plazas: <span>2</span>
</li>
<li>
<i class="tt-icon icon-manual_g"></i>
Cambio: <span>Manual</span>
</li>
<li>
<i class="tt-icon icon-snowflake"></i>
Aire acondicionado: <span>Si</span>
</li>
</ul>
<span class="cost"><span><strong>Desde</strong></span><span><strong>77 €</strong> / Dia</span></span>
<u><a href="detalle-vehiculo/grupo-P" class="link-gallery">Más Información</a></u>
<a class="btn" href="detalle-vehiculo/grupo-P#form">Ver precios</a>
</div>
</div>
<div class="gallery__item 2" style="min-height: 500px !important; position: absolute; left: 780px; top: 3000px;">
<figure class="gallery__item__image">
<a class="hover" href="detalle-vehiculo/grupo-K">
<img src="assets/images/flota/K/lateral_rotulado.png" style="width: 80%" alt="Furgoline - Turismo Pequeño">
<i class="icon-arrow-down-sign-to-navigate2"></i>
</a>
</figure>
<div class="gallery__item__content">
<h6>Turismo Pequeño</h6>
<ul class="tt-list-descriptions">
<li>
<i class="tt-icon icon-car-door"></i>
Puertas: <span>5</span>
</li>
<li>
<i class="tt-icon icon-group"></i>
Plazas: <span>5</span>
</li>
<li>
<i class="tt-icon icon-manual_g"></i>
Cambio: <span>Manual</span>
</li>
<li>
<i class="tt-icon icon-snowflake"></i>
Aire acondicionado: <span>Si</span>
</li>
</ul>
<span class="cost"><span><strong>Desde</strong></span><span><strong>21 €</strong> / Dia</span></span>
<u><a href="detalle-vehiculo/grupo-K" class="link-gallery">Más Información</a></u>
<a class="btn" href="detalle-vehiculo/grupo-K#form">Ver precios</a>
</div>
</div>
<div class="gallery__item 2" style="min-height: 500px !important; position: absolute; left: 0px; top: 3500px;">
<figure class="gallery__item__image">
<a class="hover" href="detalle-vehiculo/grupo-L">
<img src="assets/images/flota/L/lateral_rotulado.png" style="width: 80%" alt="Furgoline - Turismo Mediano">
<i class="icon-arrow-down-sign-to-navigate2"></i>
</a>
</figure>
<div class="gallery__item__content">
<h6>Turismo Mediano</h6>
<ul class="tt-list-descriptions">
<li>
<i class="tt-icon icon-car-door"></i>
Puertas: <span>5</span>
</li>
<li>
<i class="tt-icon icon-group"></i>
Plazas: <span>5</span>
</li>
<li>
<i class="tt-icon icon-manual_g"></i>
Cambio: <span>Manual</span>
</li>
<li>
<i class="tt-icon icon-snowflake"></i>
Aire acondicionado: <span>Si</span>
</li>
</ul>
<span class="cost"><span><strong>Desde</strong></span><span><strong>30 €</strong> / Dia</span></span>
<u><a href="detalle-vehiculo/grupo-L" class="link-gallery">Más Información</a></u>
<a class="btn" href="detalle-vehiculo/grupo-L#form">Ver precios</a>
</div>
</div>
<div class="gallery__item 5" style="min-height: 500px !important; position: absolute; left: 390px; top: 3500px;">
<figure class="gallery__item__image">
<a class="hover" href="detalle-vehiculo/grupo-Q">
<img src="assets/images/flota/Q/lateral_rotulado.png" style="width: 80%" alt="Furgoline - Todoterreno Mediano">
<i class="icon-arrow-down-sign-to-navigate2"></i>
</a>
</figure>
<div class="gallery__item__content">
<h6>Todoterreno Mediano</h6>
<ul class="tt-list-descriptions">
<li>
<i class="tt-icon icon-car-door"></i>
Puertas: <span>5</span>
</li>
<li>
<i class="tt-icon icon-group"></i>
Plazas: <span>5</span>
</li>
<li>
<i class="tt-icon icon-manual_g"></i>
Cambio: <span>Manual</span>
</li>
<li>
<i class="tt-icon icon-snowflake"></i>
Aire acondicionado: <span>Si</span>
</li>
</ul>
<span class="cost"><span><strong>Desde</strong></span><span><strong>30 €</strong> / Dia</span></span>
<u><a href="detalle-vehiculo/grupo-Q" class="link-gallery">Más Información</a></u>
<a class="btn" href="detalle-vehiculo/grupo-Q#form">Ver precios</a>
</div>
</div>
<div class="gallery__item 5" style="min-height: 500px !important; position: absolute; left: 780px; top: 3500px;">
<figure class="gallery__item__image">
<a class="hover" href="detalle-vehiculo/grupo-R">
<img src="assets/images/flota/R/lateral_rotulado.png" style="width: 80%" alt="Furgoline - Todoterreno Grande">
<i class="icon-arrow-down-sign-to-navigate2"></i>
</a>
</figure>
<div class="gallery__item__content">
<h6>Todoterreno Grande</h6>
<ul class="tt-list-descriptions">
<li>
<i class="tt-icon icon-car-door"></i>
Puertas: <span>5</span>
</li>
<li>
<i class="tt-icon icon-group"></i>
Plazas: <span>5</span>
</li>
<li>
<i class="tt-icon icon-manual_g"></i>
Cambio: <span>Manual</span>
</li>
<li>
<i class="tt-icon icon-snowflake"></i>
Aire acondicionado: <span>Si</span>
</li>
</ul>
<span class="cost"><span><strong>Desde</strong></span><span><strong>36 €</strong> / Dia</span></span>
<u><a href="detalle-vehiculo/grupo-R" class="link-gallery">Más Información</a></u>
<a class="btn" href="detalle-vehiculo/grupo-R#form">Ver precios</a>
</div>
</div>
</div>