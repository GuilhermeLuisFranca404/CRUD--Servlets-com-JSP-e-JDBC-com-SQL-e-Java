<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<style>
body {
	margin: 9px;
}

.titulo {
	text-align: center;
	margin-top: 160px;
}

form {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.btn {
	width: 100%;
}


</style>
<title>Insert title here</title>
</head>
<body>


	<h1 class="titulo">Bem-Vindo ao Curso - JSP</h1>

	<form action="ServletLogin" method="post"
		class="row g-3 needs-validation" novalidate>

		<div class="col-md-3">
			<label for="login" class="form-label">Login:</label> <input
				type="text" class="form-control" id="login" name="login"
				required="required">
			<div class="invalid-feedback">Campo Obrigatorio!!</div>
		</div>
		<div class="col-md-3">
			<label for="senha" class="form-label">Password:</label> <input
				type="password" class="form-control" id="senha" name="senha"
				required="required">
			<div class="invalid-feedback">Campo Obrigatorio!!</div>
		</div>
		<div class="col-md-3">
			<input type="submit" value="Enviar" class="btn btn-primary">
		</div>

	</form>
	<div>${msg}</div>
	<script>
		// Example starter JavaScript for disabling form submissions if there are invalid fields
		(function() {
			'use strict'

			// Fetch all the forms we want to apply custom Bootstrap validation styles to
			var forms = document.querySelectorAll('.needs-validation')

			// Loop over them and prevent submission
			Array.prototype.slice.call(forms).forEach(function(form) {
				form.addEventListener('submit', function(event) {
					if (!form.checkValidity()) {
						event.preventDefault()
						event.stopPropagation()
					}

					form.classList.add('was-validated')
				}, false)
			})
		})()
	</script>

</body>
</html>