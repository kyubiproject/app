<?php
view()->registerJsFile('@web/js/app.js', [
    'position' => view()::POS_END
]);
view()->registerJs('planning.init();', view()::POS_END);
view()->registerCssFile('@web/css/app.css');
?>
<!-- Titulo -->
<section class="planning-header">
	<div class="row">
		<div class="col-sm-12">
			<h1>Planning</h1>
		</div>
	</div>
</section>

<!-- Filtros -->
<section class="planning-filters">
	<div class="row">
		<div class="col-md-12">
			<form id="formFilters">
				<div class="form-row align-items-center">
					<div class="form-left">
						<div class="col-auto my-1">
							<div class="form-group">
								<label for="formDelegacion">Delegación</label><select
									class="form-control mr-sm-2" id="formDelegacion"></select>
							</div>
						</div>

						<div class="col-auto my-1">
							<div class="form-group">
								<label for="formDate">Fecha</label> <input type="date"
									class="form-control" id="formDate">
							</div>
						</div>

						<div class="col-auto my-1">
							<div class="form-group">
								<label for="formDias">Días</label> <select
									class="form-control mr-sm-2" id="formDias">
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="7">7</option>
									<option value="14" selected>14</option>
									<option value="30">30</option>
								</select>
							</div>
						</div>

						<div class="col-auto my-1">
							<div class="form-group">
								<label for="formGrupos">Grupos</label> <select
									class="form-control mr-sm-2" id="formGrupos"></select>
							</div>
						</div>

						<div class="col-auto my-1">
							<button class="btn btn-default" id="resetFilter">Borrar filtros</button>
						</div>
					</div>

					<!-- Input Buscar -->
					<div class="form-right">
						<input type="text" class="form-control" id="formSearch"
							placeholder="Buscar...">
					</div>
				</div>
			</form>
		</div>
	</div>
</section>

<!-- Tabla -->
<section class="planning-table">
	<div class="row">
		<div class="col-md-12">
			<table class="table table-bordered table-hover table-striped"
				id="planning-table">
				<thead></thead>
				<tbody></tbody>
			</table>

		</div>
	</div>
</section>

<!-- Error -->
<div id="error" class="alert alert-danger" role="alert">Ha ocurrido un
	error, inténtalo de nuevo mas tarde</div>

<!-- Sin datos -->
<div id="nodata" class="alert alert-info" role="alert">No hay
	información que mostrar</div>

<!-- Loading -->
<div id="spinner" class="alert alert-secondary" role="alert">Cargando
	datos</div>

